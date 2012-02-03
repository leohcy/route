<%@page import="java.util.Calendar"%>
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
	
	Station station = networkFactory.getStationById(Integer.parseInt(stationId));
	Map<Integer, InterchangeDirection> directions = station.getInterchangeDirections();
	
	List<Map<String, Object>> lastest = new ArrayList<Map<String, Object>>();
	List<Map<String, Object>> reachable = new ArrayList<Map<String, Object>>();

	for (int dirId : dirIds) {
		Map<String, Object> interchangeInfo = new HashMap<String, Object>();
		interchangeInfo.put("routeId", dirId);
		
		
		InterchangeDirection direction = directions.get(dirId);
		int walkTime = direction.getWalkTime(curTime);
		interchangeInfo.put("walkTime", walkTime);
		
		Line from = direction.getFrom();
		Line to = direction.getTo();
		
		Timetable fromTable = trainWorkingDiagramFactory.getTimetableByLine(from);
		if (fromTable == null) {
			out.println("{\"error\":\"没有找到\"" + from + "\"的列车运行时刻表\"}");
			return;
		}
		TrainTime fromTrainTime = fromTable.getLastTrainOfStation(station.getId());
		long arrivalTime = fromTrainTime.getArrivalTime();
		long departureTimePoint = arrivalTime + walkTime * 1000;
		
		Map<String, Object> fromTrain = new HashMap<String, Object>();
		fromTrain.put("trainId", fromTrainTime.getTrainId());
		fromTrain.put("arrivalTime", arrivalTime);
		fromTrain.put("departureTime", fromTrainTime.getDepartureTime());
		interchangeInfo.put("fromTrain", fromTrain);
		
		Timetable toTable = trainWorkingDiagramFactory.getTimetableByLine(to);
		if (toTable == null) {
			out.println("{\"error\":\"没有找到\"" + to + "\"的列车运行时刻表\"}");
			return;
		}

		List<TrainTime> toTrainTimes = toTable.getTrainOfStationAfter(station.getId(), departureTimePoint, maxCount);
		if (toTrainTimes == null || toTrainTimes.size() == 0) {
			interchangeInfo.put("toTrain", null);
			interchangeInfo.put("waitTime", null);
			
			
			TrainTime toTrainTime = toTable.getLastTrainOfStation(station.getId());
			if (toTrainTime == null) {
				out.println("{\"error\":\"无法找到列车运行时刻，请检查\"" + to + "\"的列车运行时刻表\"}");
				return;
			}
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
			reachableToTrain.put("waitTime", (toTrainTime.getDepartureTime() - fromTrainTime.getArrivalTime() - walkTime * 1000) / 1000);
			
			List<Map<String, Object>> toTrains = new ArrayList<Map<String, Object>>();
			toTrains.add(reachableToTrain);
			reachableTrain.put("toTrain", toTrains);
			
			reachable.add(reachableTrain);
			
		} else {
			List<Map<String, Object>> toTrains = new ArrayList<Map<String, Object>>();
			for (TrainTime toTrainTime : toTrainTimes) {
				Map<String, Object> toTrain = new HashMap<String, Object>();
				toTrain.put("trainId", toTrainTime.getTrainId());
				toTrain.put("arrivalTime", toTrainTime.getArrivalTime());
				toTrain.put("departureTime", toTrainTime.getDepartureTime());
				toTrain.put("waitTime", (toTrainTime.getDepartureTime() - fromTrainTime.getArrivalTime() - walkTime * 1000) / 1000);
				
				toTrains.add(toTrain);
			}
			interchangeInfo.put("toTrain", toTrains);
			
		}
		
		lastest.add(interchangeInfo);
		
	}
	Map<String, Object> retval = new HashMap<String, Object>();
	retval.put("lastest", lastest);
	retval.put("reachable", reachable);
	
	out.println(new Gson().toJson(retval));
%>