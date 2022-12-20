<%@page import="org.json.simple.JSONArray"%>

<%@page import="com.project.dao.ChartDAO"%>

<%@ page language="java" contentType="application/json; charset=UTF-8"

pageEncoding="UTF-8"%>

<%
ChartDAO ChartDao = ChartDAO.getInstance();

JSONArray jsonArray = ChartDao.getCountAddress();

//out.println(jsonArray);
%>

<%= jsonArray %>