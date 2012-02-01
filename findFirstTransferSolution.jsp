<%@page import="java.util.Calendar"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.neusoft.map.TrainTime"%>
<%@page import="com.neusoft.map.Timetable"%>
<%@page import="com.neusoft.network.Line"%>
<%@page import="com.neusoft.network.InterchangeDirection"%>
<%@page import="java.util.Map"%>
<%@page import="com.neusoft.network.Station"%>
<%@page import="com.neusoft.map.TrainWorkingDiagramFactory"%>
<%@page import="com.neusoft.network.NetworkFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Calendar cal = Calendar.getInstance();
	int hour = cal.get(Calendar.HOUR_OF_DAY);
	int min = cal.get(Calendar.MINUTE);
	int curTime = hour * 100 + min;

	NetworkFactory networkFactory = (NetworkFactory)request.getAttribute("networkFactory");
	TrainWorkingDiagramFactory trainWorkingDiagramFactory = (TrainWorkingDiagramFactory)request.getAttribute("trainWorkingDiagramFactory");
	
	String stationid = request.getParameter("stationId");
	String dirTmp = request.getParameter("routeIds");
	String[] dirs = dirTmp.split(",");
	int length = dirs.length;
	int[] dirIds = new int[length];
	for (int i = 0; i < length; i ++) {
		String dir = dirs[i];
		dirIds[i] = Integer.parseInt(dir);
	}

	List<Map<String, Object>> retval = new ArrayList<Map<String, Object>>();
	
	Station station = networkFactory.getStationById(Integer.parseInt(stationid));
	Map<Integer, InterchangeDirection> directions = station.getInterchangeDirections();

	for (int dirId : dirIds) {
		Map<String, Object> dir = new HashMap<String, Object>();
		dir.put("routeId", dirId);
		
		InterchangeDirection direction = directions.get(dirId);
		int walkTime = direction.getWalkTime(curTime);
		dir.put("walkTime", walkTime);
		
		Line from = direction.getFrom();
		Line to = direction.getTo();
		
		Timetable fromTable = trainWorkingDiagramFactory.getTimetableByLine(from);
		TrainTime fromTrainTime = fromTable.getFirstTrainOfStation(station.getId());
		Map<String, Object> fromTrain = new HashMap<String, Object>();
		fromTrain.put("trainId", fromTrainTime.getTrainId());
		fromTrain.put("arrivalTime", fromTrainTime.getArrivalTime());
		fromTrain.put("departureTime", fromTrainTime.getDepartureTime());

		dir.put("fromTrain", fromTrain);
		
		long arrivalTime = fromTrainTime.getArrivalTime();
		
		long departureTimePoint = arrivalTime + walkTime * 1000;
		
		Timetable toTable = trainWorkingDiagramFactory.getTimetableByLine(to);
		TrainTime toTrainTime = toTable.getTrainOfStationAfter(station.getId(), departureTimePoint);
		
		Map<String, Object> toTrain = new HashMap<String, Object>();
		toTrain.put("trainId", toTrainTime.getTrainId());
		toTrain.put("arrivalTime", toTrainTime.getArrivalTime());
		toTrain.put("departureTime", toTrainTime.getDepartureTime());

		dir.put("toTrain", toTrain);
		
		dir.put("waitTime", (toTrainTime.getDepartureTime() - fromTrainTime.getArrivalTime() - walkTime * 1000)/ 1000);
		
		retval.add(dir);
	}
	
	out.print(new Gson().toJson(retval));
%>