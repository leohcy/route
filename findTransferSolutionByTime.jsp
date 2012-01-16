<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
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
	String sTime = request.getParameter("time");
	long time = Long.parseLong(sTime);
	
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
		Timetable toTable = trainWorkingDiagramFactory.getTimetableByLine(to);
		
		TrainTime fromTrain = fromTable.getTrainOfStationAfter(station.getId(), time);
		if (fromTrain == null) {//指定的时间没有换出列车
			fromTrain = fromTable.getLastTrainOfStation(station.getId());
			long arrivalTime = fromTrain.getArrivalTime();
			
			long departureTimepoint = arrivalTime + walkTime * 1000;
			
			TrainTime toTrain = toTable.getTrainOfStationAfter(station.getId(), departureTimepoint);
			if (toTrain == null) {//没有换入路线
				toTrain = toTable.getLastTrainOfStation(station.getId());
				long departureTime = toTrain.getDepartureTime();
				long arrivalTimeponit = departureTime - walkTime * 1000;
				fromTrain = fromTable.getTrainOfStationBefore(station.getId(), arrivalTimeponit);
			}
			
			Map<String, Object> fromTrainInfo = new HashMap<String, Object>();
			fromTrainInfo.put("trainId", fromTrain.getTrainId());
			fromTrainInfo.put("arrivalTime", fromTrain.getArrivalTime());
			fromTrainInfo.put("departureTime", fromTrain.getDepartureTime());
			interchangeInfo.put("fromTrain", fromTrainInfo);
			
			Map<String, Object> toTrainInfo = new HashMap<String, Object>();
			toTrainInfo.put("trainId", toTrain.getTrainId());
			toTrainInfo.put("arrivalTime", toTrain.getArrivalTime());
			toTrainInfo.put("departureTime", toTrain.getDepartureTime());
			interchangeInfo.put("toTrain", toTrainInfo);
			
			interchangeInfo.put("waitTime", (toTrain.getDepartureTime() - fromTrain.getArrivalTime() - walkTime * 1000) / 1000);
			
			reachable.add(interchangeInfo);
		} else {
			long arrivalTime = fromTrain.getArrivalTime();
			
			long departureTimepoint = arrivalTime + walkTime * 1000;
			
			TrainTime toTrain = toTable.getTrainOfStationAfter(station.getId(), departureTimepoint);
			if (toTrain == null) {//没有换入路线
				toTrain = toTable.getLastTrainOfStation(station.getId());
				long departureTime = toTrain.getDepartureTime();
				long arrivalTimeponit = departureTime - walkTime * 1000;
				fromTrain = fromTable.getTrainOfStationBefore(station.getId(), arrivalTimeponit);
				
				Map<String, Object> fromTrainInfo = new HashMap<String, Object>();
				fromTrainInfo.put("trainId", fromTrain.getTrainId());
				fromTrainInfo.put("arrivalTime", fromTrain.getArrivalTime());
				fromTrainInfo.put("departureTime", fromTrain.getDepartureTime());
				interchangeInfo.put("fromTrain", fromTrainInfo);
				
				Map<String, Object> toTrainInfo = new HashMap<String, Object>();
				toTrainInfo.put("trainId", toTrain.getTrainId());
				toTrainInfo.put("arrivalTime", toTrain.getArrivalTime());
				toTrainInfo.put("departureTime", toTrain.getDepartureTime());
				interchangeInfo.put("toTrain", toTrainInfo);
				
				interchangeInfo.put("waitTime", (toTrain.getDepartureTime() - fromTrain.getArrivalTime() - walkTime * 1000) / 1000);
				
				reachable.add(interchangeInfo);
				//写入可用reachable	
			} else {
				Map<String, Object> fromTrainInfo = new HashMap<String, Object>();
				fromTrainInfo.put("trainId", fromTrain.getTrainId());
				fromTrainInfo.put("arrivalTime", fromTrain.getArrivalTime());
				fromTrainInfo.put("departureTime", fromTrain.getDepartureTime());
				interchangeInfo.put("fromTrain", fromTrainInfo);
				
				Map<String, Object> toTrainInfo = new HashMap<String, Object>();
				toTrainInfo.put("trainId", toTrain.getTrainId());
				toTrainInfo.put("arrivalTime", toTrain.getArrivalTime());
				toTrainInfo.put("departureTime", toTrain.getDepartureTime());
				interchangeInfo.put("toTrain", toTrainInfo);
				
				interchangeInfo.put("waitTime", (toTrain.getDepartureTime() - fromTrain.getArrivalTime() - walkTime * 1000) / 1000);
				
				lastest.add(interchangeInfo);
				//写入lastest
			}
			
		}
	}
	
	Map<String, Object> retval = new HashMap<String, Object>();
	retval.put("lastest", lastest);
	retval.put("reachable", reachable);
	out.println(new Gson().toJson(retval));
%>