<head>
    <!-- Standard Meta -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <!-- Site Properties -->
    <title>Information Retrieval Project 1</title>
    <link rel="stylesheet" type="text/css" href="semantic/dist/components/reset.css">
    <link rel="stylesheet" type="text/css" href="semantic/dist/components/site.css">

    <link rel="stylesheet" type="text/css" href="semantic/dist/components/container.css">
    <link rel="stylesheet" type="text/css" href="semantic/dist/components/grid.css">
    <link rel="stylesheet" type="text/css" href="semantic/dist/components/header.css">
    <link rel="stylesheet" type="text/css" href="semantic/dist/components/image.css">
    <link rel="stylesheet" type="text/css" href="semantic/dist/components/menu.css">

    <link rel="stylesheet" type="text/css" href="semantic/dist/components/divider.css">
    <link rel="stylesheet" type="text/css" href="semantic/dist/components/dropdown.css">
    <link rel="stylesheet" type="text/css" href="semantic/dist/components/segment.css">
    <link rel="stylesheet" type="text/css" href="semantic/dist/components/button.css">
    <link rel="stylesheet" type="text/css" href="semantic/dist/components/list.css">
    <link rel="stylesheet" type="text/css" href="semantic/dist/components/icon.css">
    <link rel="stylesheet" type="text/css" href="semantic/dist/components/sidebar.css">
    <link rel="stylesheet" type="text/css" href="semantic/dist/components/transition.css">

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

    <script src="js/jQuery.min.js"></script>
    <script src="semantic/dist/components/visibility.js"></script>
    <script src="semantic/dist/components/sidebar.js"></script>
    <script src="semantic/dist/components/transition.js"></script>
    <script>
        $(document)
            .ready(function () {

                // fix menu when passed
                $('.masthead')
                    .visibility({
                        once: false,
                        onBottomPassed: function () {
                            $('.fixed.menu').transition('fade in');
                        },
                        onBottomPassedReverse: function () {
                            $('.fixed.menu').transition('fade out');
                        }
                    })
                ;

                // create sidebar and attach to menu open
                $('.ui.sidebar')
                    .sidebar('attach events', '.toc.item')
                ;

            })
        ;
    </script>
</head>
<body>

<!-- Following Menu -->
<div class="ui large top fixed hidden menu">
    <div class="ui container">
        <a class="active item" href="index.jsp">Home</a>
        <a class="item" href="jsp/Search.jsp">Search</a>
        <a class="item" href="jsp/Tasks.jsp">Tasks</a>
        <div class="right menu">
            <a class="item" href="jsp/Members.jsp">Members</a>
        </div>
    </div>
</div>

<!-- Page Contents -->
<div class="pusher">
    <div class="ui inverted vertical masthead center aligned segment">

        <div class="ui container">
            <div class="ui large secondary inverted pointing menu">
                <a class="toc item">
                    <i class="sidebar icon"></i>
                </a>
                <a class="active item" href="index.jsp">Home</a>
                <a class="item" href="jsp/Search.jsp">Search</a>
                <a class="item" href="jsp/Tasks.jsp">Tasks</a>
                <div class="right item">
                    <a class="item" href="jsp/Members.jsp">Members</a>
                </div>
            </div>
        </div>


        <div class="ui text container">
            <h1 class="ui inverted header">
                Academic Research
            </h1>
            <h2>
                Information Retrieval Project 1
            </h2>
            <h3>
                Ray Andrew LP Ryan
            </h3>
            <a class="ui huge primary button" href="jsp/Search.jsp">Get Started <i class="right arrow icon"></i></a>
        </div>

    </div>

    <div class="ui vertical stripe segment">
        <div class="ui middle aligned stackable grid container">
            <div class="row">
                <div class="eight wide column">
                    <h3 class="ui header">More Elaborate to Use</h3>
                    <p>Everything is intuitive.</p>
                    <h3 class="ui header">More Accurate Result</h3>
                    <p>We calibrated the information as much as possible.</p>
                    <h3 class="ui header">More Elaborate Pages</h3>
                    <p>We use Semantic UI as web framework.</p>
                </div>
                <div class="six wide right floated column">
                    <img src="photos/demo.png" class="ui large bordered rounded image">
                </div>
            </div>
        </div>
    </div>

    <div class="ui vertical stripe segment">
        <div class="ui text container">
            <h3 class="ui header">Tutorial of Grobid</h3>
            <p>GROBID is a machine learning library for extracting, parsing and re-structuring raw documents such as PDF
                into structured TEI-encoded documents with a particular focus on technical and scientific
                publications. </p>
            <a class="ui large button" href="https://mp.weixin.qq.com/s/WM3PFm2g0IfNmV8DyBHnHg">Read More</a>
            <h4 class="ui horizontal header divider">
                <a href="#">tutorial</a>
            </h4>
            <h3 class="ui header">Tutorial of Lucene</h3>
            <p>Apache Lucene is a high-performance, full-featured text search engine library written entirely in Java.
                It is a technology suitable for nearly any application that requires full-text search, especially
                cross-platform.</p>
            <a class="ui large button" href="https://mp.weixin.qq.com/s/j3gn49jFTVAxouE6UH2r5g">Read More</a>
        </div>
    </div>


    <div class="ui inverted vertical footer segment">
        <div class="ui container">
            <div class="ui stackable inverted divided equal height stackable grid">
                <div class="five wide column">
                    <h4 class="ui inverted header">About</h4>
                    <div class="ui inverted link list">
                        <a href="jsp/Members.jsp" class="item">About Us</a>
                        <a href="http://miner.picp.net/members/Yan/teaching/IR2016Spring.html" class="item">About This
                            Course</a>
                        <a href="http://en.cufe.edu.cn/" class="item">About CUFE</a>
                    </div>
                </div>
                <%--<div class="seven wide column">--%>
                    <%--<h4 class="ui inverted header">Source Code</h4>--%>
                    <%--<a href="https://github.com/RaySoon/CUFE-Information-Retrieval-Course-Project-1" class="item">GitHub--%>
                        <%--Link</a>--%>
                <%--</div>--%>
            </div>
        </div>
    </div>
</div>

</body>

