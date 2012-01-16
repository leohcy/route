<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.neusoft.map.TrainTime"%>
<%@page import="com.neusoft.map.TrainWorkingDiagramFactory"%>
<%@page import="com.neusoft.map.Timetable"%>
<%@page import="com.neusoft.network.Line"%>
<%@page import="com.neusoft.network.NetworkFactory"%>
<%@page import="com.neusoft.network.InterchangeDirection"%>
<%@page import="com.neusoft.network.Station"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
	
	Station station = networkFactory.getStationById(Integer.parseInt(stationId));
	Map<Integer, InterchangeDirection> directions = station.getInterchangeDirections();
	
	List<Map<String, Object>> lastest = new ArrayList<Map<String, Object>>();
	List<Map<String, Object>> reachable = new ArrayList<Map<String, Object>>();

	for (int dirId : dirIds) {
		Map<String, Object> interchangeInfo = new HashMap<String, Object>();
		interchangeInfo.put("routeId", dirId);
		interchangeInfo.put("walkTime", walkTime);
		
		InterchangeDirection direction = directions.get(dirId);
		Line from = direction.getFrom();
		Line to = direction.getTo();
		
		Timetable fromTable = trainWorkingDiagramFactory.getTimetableByLine(from);
		TrainTime fromTrainTime = fromTable.getLastTrainOfStation(station.getId());
		long arrivalTime = fromTrainTime.getArrivalTime();
		long departureTimePoint = arrivalTime + walkTime * 1000;
		
		Map<String, Object> fromTrain = new HashMap<String, Object>();
		fromTrain.put("trainId", fromTrainTime.getTrainId());
		fromTrain.put("arrivalTime", arrivalTime);
		fromTrain.put("departureTime", fromTrainTime.getDepartureTime());
		interchangeInfo.put("fromTrain", fromTrain);
		
		Timetable toTable = trainWorkingDiagramFactory.getTimetableByLine(to);
		TrainTime toTrainTime = toTable.getTrainOfStationAfter(station.getId(), departureTimePoint);
		if (toTrainTime == null) {
			interchangeInfo.put("toTrain", null);
			interchangeInfo.put("waitTime", null);
			
			
			toTrainTime = toTable.getLastTrainOfStation(station.getId());
			long lastDepartureTime = toTrainTime.getDepartureTime();
			long beforeTime = lastDepartureTime - walkTime * 1000;
			
			fromTrainTime = fromTable.getTrainOfStationBefore(station.getId(), beforeTime);
			
			Map<String, Object> reachableTrain = new HashMap<String, Object>();
			reachableTrain.put("routeId", dirId);
			reachableTrain.put("walkTime", walkTime);
			
			Map<String, Object> reachableFromTrain = new HashMap<String, Object>();
			reachableFromTrain.put("trainId", fromTrainTime.getTrainId());
			reachableFromTrain.put("arrivalTime", fromTrainTime.getArrivalTime());
			reachableFromTrain.put("departureTime", fromTrainTime.getDepartureTime());
			reachableTrain.put("fromTrain", reachableFromTrain);
			
			Map<String, Object> reachableToTrain = new HashMap<String, Object>();
			reachableToTrain.put("trainId", toTrainTime.getTrainId());
			reachableToTrain.put("arrivalTime", toTrainTime.getArrivalTime());
			reachableToTrain.put("departureTime", toTrainTime.getDepartureTime());
			reachableTrain.put("toTrain", reachableToTrain);
			
			reachableTrain.put("waitTime", (toTrainTime.getDepartureTime() - fromTrainTime.getArrivalTime() - walkTime * 1000) / 1000);
			
			reachable.add(reachableTrain);
			
		} else {
			Map<String, Object> toTrain = new HashMap<String, Object>();
			toTrain.put("trainId", toTrainTime.getTrainId());
			toTrain.put("arrivalTime", toTrainTime.getArrivalTime());
			toTrain.put("departureTime", toTrainTime.getDepartureTime());
			interchangeInfo.put("toTrain", toTrain);
			
			interchangeInfo.put("waitTime", (toTrainTime.getDepartureTime() - fromTrainTime.getArrivalTime() - walkTime * 1000) / 1000);
		}
		
		lastest.add(interchangeInfo);
		
	}
	Map<String, Object> retval = new HashMap<String, Object>();
	retval.put("lastest", lastest);
	retval.put("reachable", reachable);
	
	out.println(new Gson().toJson(retval));
%>