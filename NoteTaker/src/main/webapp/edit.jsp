<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
 <%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container-fluid p-0 m-0">
    <%@include file="NavBar.jsp" %>
    <% 
    Session session2=FactoryProvider.getFactory().openSession();
	Transaction transaction = session2.beginTransaction();
	int noteId=Integer.parseInt(request.getParameter("note_id").trim());
	

	Note note=session2.get(Note.class, noteId);
    %>
    
    <h1>Update your note here</h1>
    <!-- This is add form  -->
    <form action="UpdateServlet" method="get">
    <input value="<%=note.getId()%>" name="noteId" type="hidden">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Note Title</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="title" value="<%=note.getTitle()%>">
   
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Note Content</label>
   <textarea rows="" cols="" class="form-control"  required="required" style="height: 300px;" name="content" ><%=note.getContent() %></textarea>
  </div>
  
  <button type="submit" class="btn btn-primary">Update</button>
</form>
    </div>
</body>
</html>