<%@page import="java.util.Calendar"%>
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
	String sTime = request.getParameter("time");
	long time = Long.parseLong(sTime);
	
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
		Timetable toTable = trainWorkingDiagramFactory.getTimetableByLine(to);
		
		List<TrainTime> fromTrains = fromTable.getTrainOfStationAfter(station.getId(), time, 1);
		if (fromTrains == null) {//指定的时间没有换出列车
			TrainTime fromTrain = fromTable.getLastTrainOfStation(station.getId());
			long arrivalTime = fromTrain.getArrivalTime();
			
			long departureTimepoint = arrivalTime + walkTime * 1000;
			
			List<TrainTime> toTrains = toTable.getTrainOfStationAfter(station.getId(), departureTimepoint, maxCount);
			if (toTrains == null) {//没有换入路线
				TrainTime toTrain = toTable.getLastTrainOfStation(station.getId());
				long departureTime = toTrain.getDepartureTime();
				long arrivalTimeponit = departureTime - walkTime * 1000;
				fromTrain = fromTable.getTrainOfStationBefore(station.getId(), arrivalTimeponit);
				
				toTrains = new ArrayList<TrainTime>();
				toTrains.add(toTrain);
			}
			
			Map<String, Object> fromTrainInfo = new HashMap<String, Object>();
			fromTrainInfo.put("trainId", fromTrain.getTrainId());
			fromTrainInfo.put("arrivalTime", fromTrain.getArrivalTime());
			fromTrainInfo.put("departureTime", fromTrain.getDepartureTime());
			interchangeInfo.put("fromTrain", fromTrainInfo);
			
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
			
			reachable.add(interchangeInfo);
		} else {
			TrainTime fromTrain = fromTrains.get(0);
			long arrivalTime = fromTrain.getArrivalTime();
			
			long departureTimepoint = arrivalTime + walkTime * 1000;
			
			List<TrainTime> toTrains = toTable.getTrainOfStationAfter(station.getId(), departureTimepoint, maxCount);
			if (toTrains == null) {//没有换入路线
				TrainTime toTrain = toTable.getLastTrainOfStation(station.getId());
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
				toTrainInfo.put("waitTime", (toTrain.getDepartureTime() - fromTrain.getArrivalTime() - walkTime * 1000) / 1000);
				
				List<Map<String, Object>> toTrainInfos = new ArrayList<Map<String, Object>>();
				toTrainInfos.add(toTrainInfo);
				
				interchangeInfo.put("toTrain", toTrainInfos);
				
				reachable.add(interchangeInfo);
				//写入可用reachable	
			} else {
				Map<String, Object> fromTrainInfo = new HashMap<String, Object>();
				fromTrainInfo.put("trainId", fromTrain.getTrainId());
				fromTrainInfo.put("arrivalTime", fromTrain.getArrivalTime());
				fromTrainInfo.put("departureTime", fromTrain.getDepartureTime());
				interchangeInfo.put("fromTrain", fromTrainInfo);
				
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