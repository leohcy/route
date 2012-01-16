<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.neusoft.network.NetworkFactory"%>
<%@page import="com.neusoft.network.Station"%>
<%
	NetworkFactory factory = (NetworkFactory)request.getAttribute("networkFactory");
	List<Station> stations = factory.getTransferStations();
	List<Map<String, Object>> sts = new ArrayList<Map<String, Object>>();
	for (Station s : stations) {
		Map<String, Object> sm = new HashMap<String, Object>();
		sm.put("id", s.getId());
		sm.put("name", s.getName());
		
		sts.add(sm);
	}
	Gson gson = new Gson();
	out.print(gson.toJson(sts));
%>