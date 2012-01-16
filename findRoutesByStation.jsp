<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.neusoft.network.LineDirection"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.neusoft.network.Line"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.neusoft.network.InterchangeDirection"%>
<%@page import="java.util.Map"%>
<%@page import="com.neusoft.network.Station"%>
<%@page import="com.neusoft.network.NetworkFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NetworkFactory factory = (NetworkFactory)request.getAttribute("networkFactory");
	
	String stationid = request.getParameter("stationId");
	
	Station st = factory.getStationById(Integer.parseInt(stationid));
	
	List<Map<String, Object>> retval = new ArrayList<Map<String, Object>>();
	
	Map<Integer, InterchangeDirection> directions = st.getInterchangeDirections();
	
	for (Entry<Integer, InterchangeDirection> e : directions.entrySet()) {
		int id = e.getKey();
		InterchangeDirection direction = e.getValue();
		Line from = direction.getFrom();
		Line to = direction.getTo();
		
		Map<String, Object> dirMap = new HashMap<String, Object>();
		dirMap.put("routeId", id);
		
		Map<String, Object> fromMap = new HashMap<String, Object>();
		fromMap.put("lineId", from.getId());
		fromMap.put("lineName", from.getLine());
		fromMap.put("lineDir", from.getLineDirection().equals(LineDirection.UP)? 2 : 1);

		dirMap.put("fromLine", fromMap);
		
		Map<String, Object> toMap = new HashMap<String, Object>();
		toMap.put("lineId", to.getId());
		toMap.put("lineName", to.getLine());
		toMap.put("lineDir", to.getLineDirection().equals(LineDirection.UP)? 2 : 1);
		
		dirMap.put("toLine", toMap);
		
		retval.add(dirMap);
	}
	
	out.print(new Gson().toJson(retval));
	
%>