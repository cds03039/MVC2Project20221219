<%@page import="org.json.simple.JSONArray"%>

<%@page import="com.project.dao.Chart2DAO"%>

<%@ page language="java" contentType="application/json; charset=UTF-8"

pageEncoding="UTF-8"%>

<%
Chart2DAO Chart2Dao = Chart2DAO.getInstance();

JSONArray jsonArray = Chart2Dao.getCountAddress();

//out.println(jsonArray);
%>

<%= jsonArray %>