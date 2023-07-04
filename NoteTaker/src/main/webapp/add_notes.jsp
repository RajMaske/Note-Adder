<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="CSS/style.css" rel="stylesheet"/>

    <title>Add Notes</title>
     <%@include file="all_js_css.jsp" %>
  </head>
  <body>
    
    <div class="container-fluid p-0 m-0">
    <%@include file="NavBar.jsp" %>
    </div>
    <h1>Please fill your notes detail</h1>
    <!-- This is add form  -->
    <form action="SaveNoteServlet" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Note Title</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="title">
   
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Note Content</label>
   <textarea rows="" cols="" class="form-control" placeholder="Enter your content here" required="required" style="height: 300px;" name="content"></textarea>
  </div>
  
  <button type="submit" class="btn btn-primary">Add Note</button>
</form>

    
  </body>
</html>