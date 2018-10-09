<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="test1.SearchFiles"%>
<%@ page import="test2.fileeach" %>
<%@ page import="test2.listlala" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>IR Project 1 Search </title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <script type="text/javascript" src="../js/jQuery-3.3.1.js"></script>
    <script type="text/javascript" src="../js/bootstrap.js"></script>
</head>

<style>
    body {
        background: #000000;
        background-size: cover;
        background-position: center;
    }
</style>

<body>


<!--导航-->
<nav class="navbar navbar-inverse" role="navigation"
     style="margin-bottom:0;background: rgba(0,0,0,0);border-style: solid;border-width: 1px;border-color:rgba(0,0,0,0);">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="../index.jsp" style="color: white;">IR Project 1</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="../html/Search.html" style="background: rgba(0,0,0,0);color: white">
                    <span class="glyphicon glyphicon-search"></span>&nbsp;Search</a></li>
                <li class="active"><a href="../html/Tasks.html" style="background: rgba(0,0,0,0);color: white">
                    <span class="glyphicon glyphicon-tasks"></span>&nbsp;Tasks </a></li>
                <li class="active">
                    <a href="Members.html" style="background: rgba(0,0,0,0);color: white;">
                        <span class="glyphicon glyphicon-user"></span>&nbsp;Members</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown" style="background: rgba(0,0,0,0);color: white">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false" style="background: rgba(0,0,0,0);color: white">
                        <span class="glyphicon glyphicon-menu-hamburger"></span>&nbsp;More
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu" style="background: rgba(0,0,0,0)">
                        <li><a href="../download/ReadMe.md" style="color: white">ReadMe.md</a></li>
                        <li><a href="../download/Slides.pdf" style="color: white">Slides.pdf</a></li>
                        <li role="separator" class="divider" style="color: white"></li>
                        <li><a href="http://miner.picp.net/members/Yan/teaching/IR2016Spring.html" style="color: white">About
                            IR Course</a>
                        </li>
                        <li><a href="http://en.cufe.edu.cn/" style="color: white">About CUFE</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>


<!--页头-->
<div class="page-header" style="color: white">
    <h2>&nbsp;&nbsp;&nbsp;Academic&nbsp;Literature&nbsp;Search&nbsp;Answer </h2>
</div>


<tbody>
<%
    String keyword2=(String)request.getAttribute("keyword1");
   listlala list2=(listlala)request.getAttribute("listAll2");
   ArrayList<fileeach> lp2=list2.getContent();
    for(int i = 0; i < lp2.size(); i ++){
%>
<div class="col-md-6 col-md-offset-3">
    <div class="panel panel-default">
        <div class="panel-heading">
            <b>
                <a href="./Search?action=displayTxt&amp;dblpId=285660&amp;sourceRadio=ms " target="_blank"><%=lp2.get(i).getTitle()%></a>
                &nbsp;
                <sup>
                    <a href="http://archixl.nl/files/wicsa_referencearchitecture.pdf" target="_blank">[pdf]</a>
                </sup>
            </b>
        </div>
        <div class="panel-body">
            <span><b>Score: ？？？</b></span><br>
            <span><b>DblpAuthors: </b><%=lp2.get(i).getAuthor()%></span><br>
            <span><b>DblpPages: </b><%=lp2.get(i).getPage()%></span><br>
            <span><b>DblpYear: </b> <%=lp2.get(i).getDate()%></span><br>
            <span><b><a href="./Search?action=displayGraph&amp;dblpId=285660&amp;sourceRadio=ms" target="_blank">display related papers</a></b></span><br>
            <span><b>DblpYear: </b> <%=lp2.get(i).getHighlight()%></span><br>
        </div>
        <div class="panel-footer">
            <span><b><a href="./Search?action=displayGraph&amp;dblpId=285660&amp;sourceRadio=ms" target="_blank">Related Papers</a></b></span><br>
        </div>
    </div>
</div>
        <%--<h2 class="panel-title">--%>
            <%--<a href="./Search?action=displayTxt&amp;dblpId=285660&amp;sourceRadio=ms " target="_blank"><%=lp2.get(i).getTitle()%></a>--%>
            <%--&nbsp;--%>
            <%--<sup>--%>
                <%--<a href="http://archixl.nl/files/wicsa_referencearchitecture.pdf" target="_blank">[pdf]</a>--%>
            <%--</sup>--%>
        <%--</h2>--%>

        <%--<div>--%>
            <%--<span><b>Score: ？？？</b></span><br>--%>
            <%--<span><b>DblpAuthors: </b><%=lp2.get(i).getAuthor()%></span><br>--%>
            <%--<span><b>DblpPages: </b><%=lp2.get(i).getPage()%></span><br>--%>
            <%--<span><b>DblpYear: </b> <%=lp2.get(i).getDate()%></span><br>--%>
            <%--<span><b><a href="./Search?action=displayGraph&amp;dblpId=285660&amp;sourceRadio=ms" target="_blank">display related papers</a></b></span><br>--%>
            <%--<span><b>DblpYear: </b> <%=lp2.get(i).getHighlight()%></span><br>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<% } %>
</tbody>






<!--空行-->
<div class="row">
    <p><br><br><br><br><br><br><br><br><br><br><br><br><br></p>
</div>


<!--翻页控制条-->
<div class="col-md-8 col-md-offset-4">
    <nav aria-label="Page navigation">
        <ul class="pagination pagination-lg">
            <li>
                <a href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li><a href="/search2?keyword=<%=request.getParameter("keyword1")%>&page=1">1</a></li>
            <li><a href="/search2?keyword=<%=request.getParameter("keyword1")%>&page=2">2</a></li>
            <li><a href="/search2?keyword=<%=request.getParameter("keyword1")%>&page=3">3</a></li>
            <li><a href="/search2?keyword=<%=request.getParameter("keyword1")%>&page=4">4</a></li>
            <li><a href="/search2?keyword=<%=request.getParameter("keyword1")%>&page=5">5</a></li>
            <li><a href="/search2?keyword=<%=request.getParameter("keyword1")%>&page=6">6</a></li>
            <li>
                <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
</body>
</html>