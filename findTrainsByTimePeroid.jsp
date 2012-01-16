<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.neusoft.map.TrainTime"%>
<%@page import="java.util.List"%>
<%@page import="com.neusoft.map.Timetable"%>
<%@page import="com.neusoft.network.Station"%>
<%@page import="com.neusoft.network.Line"%>
<%@page import="com.neusoft.network.NetworkFactory"%>
<%@page import="com.neusoft.network.LineDirection"%>
<%@page import="com.neusoft.map.TrainWorkingDiagramFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	TrainWorkingDiagramFactory trainWorkingDiagramFactory = (TrainWorkingDiagramFactory)request.getAttribute("trainWorkingDiagramFactory");
	NetworkFactory networkFactory = (NetworkFactory)request.getAttribute("networkFactory");
	
	String stationId = request.getParameter("stationId");
	String lineId = request.getParameter("lineId");
	String lineDirs = request.getParameter("lineDirs").trim();
	String ssTime = request.getParameter("startTime");
	long startTime = Long.parseLong(ssTime);
	String seTime = request.getParameter("endTime");
	long endTime = Long.parseLong(seTime);
	
	Station station = networkFactory.getStationById(Integer.parseInt(stationId));
	
	List<Map<String, Object>> retval = new ArrayList<Map<String, Object>>();
	
	if (lineDirs.equals("1") || lineDirs.equals("3")) {
		Map<String, Object> lineTrains = new HashMap<String, Object>();
		lineTrains.put("lineDirs", "1");
		
		Line line = networkFactory.getLine(Integer.parseInt(lineId), LineDirection.DOWN);
		Timetable times = trainWorkingDiagramFactory.getTimetableByLine(line);
		List<TrainTime> trainTimes = times.getTrainsOfStationBetween(station.getId(), startTime, endTime);
		lineTrains.put("trains", trainTimes);
		
		retval.add(lineTrains);
	}
	if (lineDirs.equals("2") || lineDirs.equals("3")) {
		Map<String, Object> lineTrains = new HashMap<String, Object>();
		lineTrains.put("lineDirs", "2");
		
		Line line = networkFactory.getLine(Integer.parseInt(lineId), LineDirection.DOWN);
		Timetable times = trainWorkingDiagramFactory.getTimetableByLine(line);
		List<TrainTime> trainTimes = times.getTrainsOfStationBetween(station.getId(), startTime, endTime);
		lineTrains.put("trains", trainTimes);
		
		retval.add(lineTrains);
	}
	
	out.print(new Gson().toJson(retval));
%>