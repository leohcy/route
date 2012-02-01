<%@page import="java.util.Date"%>
<%@page import="com.neusoft.map.Timetable"%>
<%@page import="com.neusoft.map.TrainWorkingDiagramFactory"%>
<%@page import="com.neusoft.network.Line"%>
<%@page import="com.neusoft.network.Station"%>
<%@page import="com.neusoft.network.NetworkFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NetworkFactory networkFactory = (NetworkFactory)request.getAttribute("networkFactory");
	TrainWorkingDiagramFactory trainWorkingDiagramFactory = (TrainWorkingDiagramFactory)request.getAttribute("trainWorkingDiagramFactory");
	
	Station station = networkFactory.getStationById(191);
	
	Line[] ls = networkFactory.getLine(31);
	Timetable t1 = trainWorkingDiagramFactory.getTimetableByLine(ls[0]);
	Timetable t2 = trainWorkingDiagramFactory.getTimetableByLine(ls[1]);
	
	ls = networkFactory.getLine(32);
	Timetable t3 = trainWorkingDiagramFactory.getTimetableByLine(ls[0]);
	Timetable t4 = trainWorkingDiagramFactory.getTimetableByLine(ls[1]);
	
	System.out.println(new Date(t1.getLastTrainOfStation(191).getArrivalTime()));
	System.out.println(new Date(t2.getLastTrainOfStation(191).getArrivalTime()));
	System.out.println(new Date(t3.getLastTrainOfStation(191).getArrivalTime()));
	System.out.println(new Date(t4.getLastTrainOfStation(191).getArrivalTime()));
%>