<%--
  Created by IntelliJ IDEA.
  User: alexsun
  Date: 2018/10/12
  Time: 上午12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@page import="test1.SearchFiles" %>
<%@ page import="test2.fileeach" %>
<%@ page import="org.apache.lucene.search.highlight.Scorer" %>
<head>
    <!-- Standard Meta -->
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
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/label.css">
    <link rel="stylesheet" type="text/css" href="../semantic/dist/components/statistic.css">

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

        /*.masthead .ui.menu .ui.button {*/
        /*margin-left: 0.5em;*/
        /*}*/

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
<%
    String keyword2 = (String) request.getAttribute("keyword1");
    request.setAttribute("keyword1", keyword2);
    ArrayList<fileeach> lp2 = SearchFiles.indexSearch(keyword2);
%>

<div class="container">
    <div class="ui large top menu">
        <div class="ui container">
            <a class="item" href="../index.jsp">Home</a>
            <a class="item" href="../jsp/Search.jsp">Search</a>
            <a class="item" href="../jsp/Tasks.jsp">Tasks</a>
            <div class="right menu">
                <a class="item" href="../jsp/Members.jsp">Members</a>
            </div>
        </div>
    </div>
</div>

<br>

<%--<div class="ui sizer vertical segment">--%>
<%--<div class="ui huge right aligned header">巨型标题</div>--%>
<%--</div>--%>
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
            <%=lp2.size()%>
        </div>
        <div class="label">
            Results
        </div>
        <%
            if (lp2.size() > 30) {
        %>
        <div class="text">
            Too much results that only show six pages
        </div>
        <% }%>
    </div>

</div>


<br>


<%
    if (lp2.size() == 0) {
%>
<br><br><br><br><br>
<div class="container">
    <div class="ui two column grid centered">
        <div class="text">
            There is no result for searching <%=keyword2%>.
        </div>
    </div>
</div>
<br><br><br><br><br><br><br><br>
<% }%>


<%
    if (lp2.size() <= 5) {
        for (int i = 0; i < lp2.size(); i++) {
%>
<div class="container">
    <div class="ui two column grid centered">
        <div class="column">
            <div class="ui raised segment">
                <a class="ui red ribbon label">Title:</a>
                <p><%=lp2.get(i).getTitle()%>
                </p>
                <a class="ui orange ribbon label">Authors: </a>
                <p><%=lp2.get(i).getAuthor()%>
                </p>
                <a class="ui teal ribbon label">Pages: </a>
                <p><%=lp2.get(i).getPage()%>
                </p>
                <a class="ui blue ribbon label">Year: </a>
                <p><%=lp2.get(i).getDate()%>
                </p>
                <a class="ui violet right ribbon label">Abstract: </a>
                <p><%=lp2.get(i).getHighlight()%>
                </p>
            </div>
        </div>
    </div>
    <br><br>

        <% }
} else {

    for (int j = 0; j < 5; j++) {

%>

    <div class="container">
        <div class="ui two column grid centered">
            <div class="column">
                <div class="ui raised segment">
                    <a class="ui red ribbon label">Title:</a>
                    <p><%=lp2.get(j).getTitle()%>
                    </p>
                    <a class="ui orange ribbon label">Authors: </a>
                    <p><%=lp2.get(j).getAuthor()%>
                    </p>
                    <a class="ui teal ribbon label">Pages: </a>
                    <p><%=lp2.get(j).getPage()%>
                    </p>
                    <a class="ui blue ribbon label">Year: </a>
                    <p><%=lp2.get(j).getDate()%>
                    </p>
                    <a class="ui violet right ribbon label">Abstract: </a>
                    <p><%=lp2.get(j).getHighlight()%>
                    </p>
                </div>
            </div>
        </div>
        <br><br>
            <% } } %>

        <br><br><br>

            <%
    if (lp2.size() > 5) {
%>

        <div class="ui grid centered">
            <div class="ui pagination menu">
                <a class="active item" href="/search2?keyword=<%=keyword2%>&page=1">
                    1
                </a>
                <a class="item" href="/search2?keyword=<%=keyword2%>&page=2">
                    2
                </a>
                <a class="item" href="/search2?keyword=<%=keyword2%>&page=3">
                    3
                </a>
                <a class="item" href="/search2?keyword=<%=keyword2%>&page=4">
                    4
                </a>
                <a class="item" href="/search2?keyword=<%=keyword2%>&page=5">
                    5
                </a>
                <a class="item" href="/search2?keyword=<%=keyword2%>&page=6">
                    6
                </a>
                <a class="disabled item">
                    ...
                </a>
            </div>
        </div>
            <% }%>

        <br><br><br><br><br>

        <div class="pusher">
            <div class="ui inverted vertical footer segment">
                <div class="ui container">
                    <div class="ui stackable inverted divided equal height stackable grid">
                        <div class="five wide column">
                            <h4 class="ui inverted header">About</h4>
                            <div class="ui inverted link list">
                                <a href="Members.jsp" class="item">About Us</a>
                                <a href="http://miner.picp.net/members/Yan/teaching/IR2016Spring.jsp" class="item">About
                                    This
                                    Course</a>
                                <a href="http://en.cufe.edu.cn/" class="item">About CUFE</a>
                            </div>
                        </div>
                        <div class="seven wide column">
                            <h4 class="ui inverted header">Source Code</h4>
                            <%--<a href="https://github.com/RaySoon/CUFE-Information-Retrieval-Course-Project-1" class="item">GitHub Link</a>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>



