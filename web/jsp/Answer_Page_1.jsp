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
    <title>Answer</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/semantic/dist/semantic.css">

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

    <script src="<%=request.getContextPath()%>/js/jQuery.min.js"></script>
    <script src="<%=request.getContextPath()%>/semantic/dist/semantic.js"></script>

</head>
<body>
<%
    String keyword2 = (String) request.getAttribute("keyword1");
    request.setAttribute("keyword1", keyword2);
    String type2 = (String) request.getAttribute("type1");
    request.setAttribute("type1", type2);
    ArrayList<fileeach> lp2 = SearchFiles.indexSearch(keyword2,type2);
%>

<div class="container">
    <div class="ui large top menu">
        <div class="ui container">
            <a class="item" href="<%=request.getContextPath()%>/index.jsp">Home</a>
            <a class="item" href="<%=request.getContextPath()%>/jsp/Search.jsp">Search</a>
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
            <%=lp2.size()%>
        </div>
        <div class="label">
            Results
        </div>
    </div>
</div>


<br>
<%
    if (lp2.size() == 0 && keyword2 !=null) {
%>
<br><br><br><br><br>
<div class="container">
    <div class="ui two column grid centered">
        <div class="text">
            There is no result for searching <%=keyword2%>.
        </div>
    </div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
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
                <p>
                    <%=lp2.get(i).getTitle()%>
                    <sup>
                        <a href = "<%=request.getContextPath()%>/data/<%=SearchFiles.realPath(lp2.get(i).getFilepath())%>">[pdf]</a>
                    </sup>
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
                <a class="ui violet right ribbon label">Preview: </a>
                <div><%=lp2.get(i).getHighlight()%>
                </div>
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
                    <p>
                        <%=lp2.get(j).getTitle()%>
                        <sup>
                            <a href = "<%=request.getContextPath()%>/data/<%=SearchFiles.realPath(lp2.get(j).getFilepath())%>">[pdf]</a>
                        </sup>
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
                    <div><%=lp2.get(j).getHighlight()%>
                    </div>
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

                <%

                int pagen=lp2.size();
                int yvshu=pagen%5;
                int yv=0;
                if(yvshu>0)yv=1;
                int allpagenumber=pagen/5+yv;
                if(pagen<=25){
                for(int jj=1;jj<=allpagenumber;jj++){
                %>
                <a class="item" href="<%=request.getContextPath()%>/search2?keyword=<%=keyword2%>&type=<%=type2%>&page=<%=jj %>">
                    <%=jj%>
                </a>

                <%
                        }
                }
                else {
                    for(int jj=1;jj<=5;jj++){
                %>
                <a class="item" href="<%=request.getContextPath()%>/search2?keyword=<%=keyword2%>&type=<%=type2%>&page=<%=jj %>">
                    <%=jj%>
                </a>


                <% }%>

                <a class="item" href="<%=request.getContextPath()%>/search2?keyword=<%=keyword2%>&type=<%=type2%>&page=6">
                    >>
                </a>

                <%
                } %>
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
                                <a href="<%=request.getContextPath()%>/jsp/Members.jsp" class="item">About Us</a>
                                <a href="http://miner.picp.net/members/Yan/teaching/IR2016Spring.html" class="item">About
                                    This
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



