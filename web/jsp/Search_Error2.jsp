<%@ page import="test1.SearchFiles" %>
<%@ page import="test2.fileeach" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: alexsun
  Date: 2018/10/12
  Time: 下午2:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>


<head>
    <title>Search</title>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <!-- Site Properties -->
    <title>Tasks</title>
    <link rel="stylesheet" type="text/css" href="../semantic/dist/semantic.css">
    <script src="../js/jQuery-3.3.1.js"></script>
    <script src="../semantic/dist/semantic.js"></script>

    <style type="text/css">

        .masthead .logo.item img {
            margin-right: 1em;
        }

        .masthead h2 {
            font-size: 1.7em;
            font-weight: normal;
        }

        .ui.vertical.stripe h3 {
            font-size: 2em;
        }

        .ui.vertical.stripe .button + h3,
        .ui.vertical.stripe p + h3 {
            margin-top: 3em;
        }

        .ui.vertical.stripe p {
            font-size: 1.33em;
        }

        .footer.segment {
            padding: 3em 0em;
        }

        .header {
            user-select: none;
        }

        @media only screen and (max-width: 700px) {

            .masthead h2 {
                margin-top: 0.5em;
                font-size: 1.5em;
            }
        }

    </style>

</head>


<body>


<div class="container">

    <div class="ui large top menu">
        <div class="ui container">
            <a class="item" href="<%=request.getContextPath()%>/index.jsp">Home</a>
            <a class="active item" href="<%=request.getContextPath()%>/jsp/Search.jsp">Search</a>
            <a class="item" href="<%=request.getContextPath()%>/jsp/Tasks.jsp">Tasks</a>
            <div class="right menu">
                <a class="item" href="<%=request.getContextPath()%>/jsp/Members.jsp">Members</a>
            </div>
        </div>
    </div>
</div>

<br>

<div class="header">
    <%
        for (int space = 0; space < 8; space++) {
    %>
    <div class="ui statistic">
        <div class="value" style="color: rgba(0,0,0,0)">
            000
        </div>
        <div class="label" style="color: rgba(0,0,0,0)">
            space
        </div>
    </div>
    <% }%>
    <div class="ui statistic">
        <div class="value">
            900+
        </div>
        <div class="label">
            Papers included
        </div>
    </div>
</div>

<br><br><br>

<div class="ui container">
    <img class="ui centered large image" src="../photos/logo.png">
</div>

<br>

<div class="container">
    <form role="form" action="../servlets/searchs" method="get">
        <div class="ui container center aligned">
            <div class="ui massive icon input">
                <input type="text" placeholder="Search Papers..." name="keywords"/>
                <i class="disabled search icon"></i>
            </div>
        </div>
        <br>
        <div class="ui container center aligned">
            <select class="ui compact selection dropdown" name="type1">
                <option value="fulltext">fulltext</option>
                <option value="title">title</option>
                <option value="author">author</option>
            </select>
        </div>
    </form>
</div>
<br>
<div class="container">
    <div class="ui two column grid centered">
        <div class="text" style="color: #919191">
            Press <i>Enter</i> to Start Searching
        </div>
    </div>
</div>
<br><br>

<div class="container">
    <div class="ui two column grid centered">
        <div class="text" style="color: red">
            The keyword must be encoded in English.
        </div>
    </div>
</div>
<br>



<br><br><br><br><br><br><br><br><br>

<div class="pusher">
    <div class="ui inverted vertical footer segment">
        <div class="ui container">
            <div class="ui stackable inverted divided equal height stackable grid">
                <div class="five wide column">
                    <h4 class="ui inverted header">About</h4>
                    <div class="ui inverted link list">
                        <a href="<%=request.getContextPath()%>/jsp/Members.jsp" class="item">About Us</a>
                        <a href="http://miner.picp.net/members/Yan/teaching/IR2016Spring.html" class="item">About This
                            Course</a>
                        <a href="http://en.cufe.edu.cn/" class="item">About CUFE</a>
                    </div>
                </div>
                <%--<div class="seven wide column">--%>
                <%--<h4 class="ui inverted header">Source Code</h4>--%>
                <%--&lt;%&ndash;<a href="https://github.com/RaySoon/CUFE-Information-Retrieval-Course-Project-1" class="item">GitHub Link</a>&ndash;%&gt;--%>
                <%--</div>--%>
            </div>
        </div>
    </div>
</div>

</body>
</html>
