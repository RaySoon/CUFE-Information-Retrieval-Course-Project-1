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
<body>


<!--导航-->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"
     style="margin-bottom:0;background: #3d3d3d;border-style: solid;border-width: 1px;border-color:#3d3d3d;">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand disabled" href="../index.jsp" style="color: white">IR Project 1</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="Search.html" style="background: white;color: black">
                    <span class="glyphicon glyphicon-search"></span>&nbsp;Search</a></li>
                <li class="active"><a href="Tasks.html" style="background: #363639;color: white">
                    <span class="glyphicon glyphicon-tasks"></span>&nbsp;Tasks </a></li>
                <li class="active"><a href="Members.html" style="background: #363639;color: white;">
                    <span class="glyphicon glyphicon-user"></span>&nbsp;Members</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown" style="background: #363639;color: white">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false" style="background: #363639;color: white">
                        <span class="glyphicon glyphicon-menu-hamburger"></span>&nbsp;More
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="../download/ReadMe.md">ReadMe.md</a></li>
                        <li><a href="../download/Slides.pdf">Slides.pdf</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="http://miner.picp.net/members/Yan/teaching/IR2016Spring.html">About IR Course</a></li>
                        <li><a href="http://en.cufe.edu.cn/">About CUFE</a></li>
                    </ul>
                </li>
            </ul>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>


<!--空行-->
<div class="row">
    <p><br></p>
</div>

<!--页头-->
<div class="page-header">
    <h2>&nbsp;&nbsp;&nbsp;Academic&nbsp;Literature&nbsp;Search&nbsp;Answer </h2>
</div>


<!--检索框-->
<div class="container bs-docs-container" style="margin-bottom:60px">
    <form role="form" action="Search" method="get">
        <input type="hidden" name="action" value="fulltextSearch"/>
        <div class="row">
            <div class="row">
                <div class="col-xs-6 col-md-6 col-md-offset-2 col-xs-offset-1">
                    <input type="text" class="form-control input-lg" name="keywords" placeholder="fulltext search"/>
                </div>
                <div class="col-md-2 col-xs-4">
                    <button type="submit"
                            style="color: #4678ff;border-style: solid;border-width: 1px;border-color:#4678ff;"
                            href=""
                            class="btn-lg button-rounded" role="button"><b>Search</b></button>
                </div>
            </div>
        </div>
    </form>
</div>





<tbody>
<%
    String keyword2=(String)request.getAttribute("keyword1");
   listlala list2=(listlala)request.getAttribute("listAll2");

   ArrayList<fileeach> lp2=list2.getContent();
    for(int i = 0; i < lp2.size(); i ++){
%>
        <h2 class="panel-title">
            <a href="./Search?action=displayTxt&amp;dblpId=285660&amp;sourceRadio=ms " target="_blank"><%=lp2.get(i).getTitle()%></a>
            &nbsp;
            <sup>
                <a href="http://archixl.nl/files/wicsa_referencearchitecture.pdf" target="_blank">[pdf]</a>
            </sup>
        </h2>

        <div>
            <span><b>Score: ？？？</b></span><br>
            <span><b>DblpAuthors: </b><%=lp2.get(i).getAuthor()%></span><br>
            <span><b>DblpPages: </b><%=lp2.get(i).getPage()%></span><br>
            <span><b>DblpYear: </b> <%=lp2.get(i).getDate()%></span><br>
            <span><b><a href="./Search?action=displayGraph&amp;dblpId=285660&amp;sourceRadio=ms" target="_blank">display related papers</a></b></span><br>
            <span><b>DblpYear: </b> <%=lp2.get(i).getHighlight()%></span><br>
        </div>
    </div>
</div>
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
            <%
            int pagen=((list2.getPage()-1)/5)+1;
            int pageAll=list2.getAllPage();
            if(pageAll>=pagen*5)
            {

            %>


            <% if(list2.getPage()>=6){

            %>
            <li>
                <a href="/search2?keyword=<%=keyword2%>&page=<%=(pagen-1)*5%>">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <% } %>


            <%
            for(int jj=(pagen-1)*5+1;jj<=pagen*5;jj++)
            {
            %>

            <li><a href="/search2?keyword=<%=keyword2%>&page=<%=jj %>"><%=jj %></a></li>
            <% } %>
            <%
            if(pagen*5<pageAll)
            {
            %>
            <li>
                <a href="/search2?keyword=<%=keyword2%>&page=<%=pagen*5+1%>">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
            <%
                }
                %>
            <% }

            else {
            %>
            <% if(list2.getPage()>=6){

            %>
            <li>
                <a href="/search2?keyword=<%=keyword2%>&page=<%=(pagen-1)*5%>">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <% } %>


            <%
                for(int jj=(pagen-1)*5+1;jj<=pageAll;jj++)
                {
            %>

            <li><a href="/search2?keyword=<%=keyword2%>&page=<%=jj %>"><%=jj %></a></li>
            <% } %>


            <% } %>
        </ul>
    </nav>
</div>
</body>
</html>