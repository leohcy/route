<%@page import="java.util.Calendar"%>
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
	int maxCount = 3;

	Calendar cal = Calendar.getInstance();
	int hour = cal.get(Calendar.HOUR_OF_DAY);
	int min = cal.get(Calendar.MINUTE);
	int curTime = hour * 100 + min;
	
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
		
		int walkTime = direction.getWalkTime(curTime);
		
		Timetable fromTable = trainWorkingDiagramFactory.getTimetableByLine(from);
		TrainTime fromTrain = fromTable.getTrainOfStationByTrainId(station.getId(), fromTrainId);
		
		interchangeInfo.put("routeId", dirId);
		interchangeInfo.put("walkTime", walkTime);
		
		long timepoint = fromTrain.getArrivalTime() + walkTime * 1000;
		
		Timetable toTable = trainWorkingDiagramFactory.getTimetableByLine(to);
		List<TrainTime> toTrains = toTable.getTrainOfStationAfter(station.getId(), timepoint, maxCount);
		if (toTrains != null) {
			List<Map<String, Object>> toTrainInfos = new ArrayList<Map<String, Object>>();
			for (TrainTime toTrain : toTrains) {
				Map<String, Object> toTrainInfo = new HashMap<String, Object>();
				toTrainInfo.put("trainId", toTrain.getTrainId());
				toTrainInfo.put("arrivalTime", toTrain.getArrivalTime());
				toTrainInfo.put("departureTime", toTrain.getDepartureTime());
				toTrainInfo.put("waitTime", (toTrain.getDepartureTime() - fromTrain.getArrivalTime() - walkTime * 1000) / 1000);
				
				toTrainInfos.add(toTrainInfo);
			}
			interchangeInfo.put("toTrain", toTrainInfos);
		}
		
		retval.add(interchangeInfo);
	}
	
	out.println(new Gson().toJson(retval));
%>