<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.neusoft.map.TrainTime"%>
<%@page import="com.neusoft.map.Timetable"%>
<%@page import="java.util.Map"%>
<%@page import="com.neusoft.network.Line"%>
<%@page import="com.neusoft.network.InterchangeDirection"%>
<%@page import="com.neusoft.network.Station"%>
<%@page import="com.neusoft.map.TrainWorkingDiagramFactory"%>
<%@page import="com.neusoft.network.NetworkFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	long walkTime = 2 * 60;

	NetworkFactory networkFactory = (NetworkFactory)request.getAttribute("networkFactory");
	TrainWorkingDiagramFactory trainWorkingDiagramFactory = (TrainWorkingDiagramFactory)request.getAttribute("trainWorkingDiagramFactory");
	
	String stationId = request.getParameter("stationId");
	String dirTmp = request.getParameter("routeIds");
	String[] dirs = dirTmp.split(",");
	int length = dirs.length;
	int[] dirIds = new int[length];
	for (int i = 0; i < length; i ++) {
		String dir = dirs[i];
		dirIds[i] = Integer.parseInt(dir);
	}
	String fromTrainId = request.getParameter("fromTrainId");
	
	Station station = networkFactory.getStationById(Integer.parseInt(stationId));
	Map<Integer, InterchangeDirection> directions = station.getInterchangeDirections();
	
	List<Map<String, Object>> retval = new ArrayList<Map<String, Object>>();
	
	for (int dirId : dirIds) {
		Map<String, Object> interchangeInfo = new HashMap<String, Object>();
		
		InterchangeDirection direction = directions.get(dirId);
		Line from = direction.getFrom();
		Line to = direction.getTo();
		
		Timetable fromTable = trainWorkingDiagramFactory.getTimetableByLine(from);
		TrainTime fromTrain = fromTable.getTrainOfStationByTrainId(station.getId(), fromTrainId);
		
		interchangeInfo.put("routeId", dirId);
		interchangeInfo.put("walkTime", walkTime);
		
		long timepoint = fromTrain.getArrivalTime() + walkTime * 1000;
		
		Timetable toTable = trainWorkingDiagramFactory.getTimetableByLine(to);
		TrainTime toTrain = toTable.getTrainOfStationAfter(station.getId(), timepoint);
		if (toTrain != null) {
			Map<String, Object> toTrainInfo = new HashMap<String, Object>();
			toTrainInfo.put("trainId", toTrain.getTrainId());
			toTrainInfo.put("arrivalTime", toTrain.getArrivalTime());
			toTrainInfo.put("departureTime", toTrain.getDepartureTime());
			interchangeInfo.put("toTrain", toTrainInfo);
			
			interchangeInfo.put("waitTime", (toTrain.getDepartureTime() - fromTrain.getArrivalTime() - walkTime * 1000) / 1000);
		}
		
		retval.add(interchangeInfo);
	}
	
	out.println(new Gson().toJson(retval));
%>