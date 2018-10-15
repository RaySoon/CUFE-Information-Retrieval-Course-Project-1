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
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/reset.css">
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/site.css">

    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/container.css">
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/grid.css">
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/header.css">
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/image.css">
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/menu.css">
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/search.css">
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/input.css">
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/statistic.css">
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/label.css">

    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/divider.css">
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/dropdown.css">
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/segment.css">
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/button.css">
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/list.css">
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/icon.css">
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/sidebar.css">
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/transition.css">


    <style type="text/css">

        .hidden.menu {
            display: none;
        }

        .masthead.segment {
            min-height: 700px;
            padding: 1em 0em;
        }

        .masthead .logo.item img {
            margin-right: 1em;
        }

        .masthead .ui.menu .ui.button {
            margin-left: 0.5em;
        }

        .masthead h1.ui.header {
            margin-top: 3em;
            margin-bottom: 0em;
            font-size: 4em;
            font-weight: normal;
        }

        .masthead h2 {
            font-size: 1.7em;
            font-weight: normal;
        }

        .ui.vertical.stripe {
            padding: 8em 0em;
        }

        .ui.vertical.stripe h3 {
            font-size: 2em;
        }

        .ui.vertical.stripe .button + h3,
        .ui.vertical.stripe p + h3 {
            margin-top: 3em;
        }

        .ui.vertical.stripe .floated.image {
            clear: both;
        }

        .ui.vertical.stripe p {
            font-size: 1.33em;
        }

        .ui.vertical.stripe .horizontal.divider {
            margin: 3em 0em;
        }

        .quote.stripe.segment {
            padding: 0em;
        }

        .quote.stripe.segment .grid .column {
            padding-top: 5em;
            padding-bottom: 5em;
        }

        .footer.segment {
            padding: 3em 0em;
        }

        .secondary.pointing.menu .toc.item {
            display: none;
        }

        .header {
            user-select: none;
        }

        @media only screen and (max-width: 700px) {
            .ui.fixed.menu {
                display: none !important;
            }

            .secondary.pointing.menu .item,
            .secondary.pointing.menu .menu {
                display: none;
            }

            .secondary.pointing.menu .toc.item {
                display: block;
            }

            .masthead.segment {
                min-height: 350px;
            }

            .masthead h1.ui.header {
                font-size: 2em;
                margin-top: 1.5em;
            }

            .masthead h2 {
                margin-top: 0.5em;
                font-size: 1.5em;
            }

        }


    </style>
    <script src="../js/jQuery.min.js"></script>
    <script src="../semantic/dist/components/visibility.js"></script>
    <script src="../semantic/dist/components/sidebar.js"></script>
    <script src="../semantic/dist/components/transition.js"></script>

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

<br><br><br><br>

<div class="ui container">
    <img class="ui centered large image" src="../photos/logo.png">
</div>

<br><br>

<div class="ui container center aligned">
    <form role="form" action="../servlets/searchs" method="get">
        <div class="ui massive icon input">
            <input type="text" placeholder="Search Papers..." name="keywords"/>
            <i class="disabled search icon"></i>
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
