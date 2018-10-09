<%--
  Created by IntelliJ IDEA.
  User: alexsun
  Date: 2018/9/8
  Time: 下午12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Main Page of IR Project 1</title>
    <link rel="stylesheet" href="./css/bootstrap.css" type="text/css">
    <%--<link rel="stylesheet" href="./css/main.css" type="text/css">--%>
    <script type="text/javascript" src="./js/jQuery-3.3.1.js"></script>
    <script type="text/javascript" src="./js/bootstrap.js"></script>
<body>
<style>
    body {
        background: url(./photos/wallhaven-685901.jpg);
        background-size: cover;
        background-position: center;
    }
</style>


<!--导航-->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"
     style="margin-bottom:0;background: rgba(0,0,0,0);border-style: solid;border-width: 1px;border-color:rgba(0,0,0,0);">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.jsp" style="color: white;">IR Project 1</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="html/Search.html" style="background: rgba(0,0,0,0);color: white">
                    <span class="glyphicon glyphicon-search"></span>&nbsp;Search</a></li>
                <li class="active"><a href="html/Tasks.html" style="background: rgba(0,0,0,0);color: white">
                    <span class="glyphicon glyphicon-tasks"></span>&nbsp;Tasks </a></li>
                <li class="active">
                    <a href="html/Members.html" style="background: rgba(0,0,0,0);color: white;">
                        <span class="glyphicon glyphicon-user"></span>&nbsp;Members</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown" style="background: rgba(0,0,0,0);color: white">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false" style="background: rgba(0,0,0,0);color: white">
                        <span class="glyphicon glyphicon-menu-hamburger"></span>&nbsp;More
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu" style="background: rgba(0,0,0,0)">
                        <li><a href="./download/ReadMe.md" style="color: white">ReadMe.md</a></li>
                        <li><a href="./download/Slides.pdf" style="color: white">Slides.pdf</a></li>
                        <li role="separator" class="divider" style="color: white"></li>
                        <li><a href="http://miner.picp.net/members/Yan/teaching/IR2016Spring.html" style="color: white">About
                            IR Course</a>
                        </li>
                        <li><a href="http://en.cufe.edu.cn/" style="color: white">About CUFE</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>


<!--空行-->
<div class="row">
    <p><br><br><br><br><br><br></p>
</div>


<div class="jumbotron" style="text-align: center;background: rgba(0,0,0,0)">
    <h1 style="font-family:'DIN Alternate Bold'; color: white">Information Retrieval Project 1</h1>
    <div class="row">
        <p><br><br></p>
    </div>
    <p style="font-family:Hiragino+Sans+GB+W6; color: white">
        TASK 1: Parse Metadata & Text form PDFs<br>
        TASK 2: Index & Search the Parsed Metadata from Grobid<br>
        TASK 3: Build a Simple Web Search Engine with the Index<br><br>
        Ray&nbsp;&nbsp;Andrew&nbsp;&nbsp;LP&nbsp;&nbsp;Ryan
    </p>
    <p></p>
    <p></p>
    <p></p>
    <p>
    <div style="text-align: center">
        <a class="btn btn-lg"
           style="color: white;border-style: solid;border-width: 1px;border-color:white;"
           href="html/Answer.html" role="button">Learn more</a>
    </div>
    </p>
</div>

</body>
</html>
