
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.entities.Note"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes</title>
</head>
<%@include file="all_js_css.jsp" %>
<body>
<div class="container-fluid p-0 m-0">
<%@include file="NavBar.jsp" %>
<h1>All Notes</h1>
<div class="row">

<div class="col-12">

<%
Session session2=FactoryProvider.getFactory().openSession();
Transaction transaction=session2.beginTransaction();
Query<Note> q=session2.createQuery("from Note", Note.class);
List<Note> list=q.getResultList();


for(Note note:list){
	


%>
<div class="card mt-3" style="">
  <img class="card-img-top" src="img/notepad.png" alt="Card image cap" style="max-width: 50px;">
  <div class="card-body">
    <h5 class="card-title"><%=note.getTitle() %></h5>
    <p class="card-text"><%=note.getContent() %></p>
    <a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
    <a href="edit.jsp?note_id=<%=note.getId()%>" class="btn btn-primary">Update</a>
   	
    <%DateFormat dateFormat=DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG); %>
    
    <p class="left-align"><%=dateFormat.format(note.getAddedDate()) %></p>
   
  </div>
</div>
<%
}transaction.commit();
session2.close();
%>

</div>
</div>

</div>
</body>
</html>