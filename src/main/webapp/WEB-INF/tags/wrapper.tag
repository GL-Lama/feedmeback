<%@tag description="Wrapper for basic pages" pageEncoding="UTF-8"%>
<%@attribute name="head" fragment="true" %>
<%@attribute name="scripts" fragment="true" %>

<html>

    <head>

        <title>FeedMEback</title>

        <meta charset="utf-8">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/static/libs/mdbootstrap/css/bootstrap.min.css"></link>
        <link rel="stylesheet" type="text/css" href="/static/libs/mdbootstrap/css/mdb.min.css"></link>
        <link rel="stylesheet" type="text/css" href="/static/css/feedmeback.css"></link>
        <link rel="stylesheet" type="text/css" href="/static/css/themes/fmb-theme-${(sessionScope.theme != null)? 0 : 0}.css"></link>

        <jsp:invoke fragment="head"/>

    </head>

    <script src="/static/libs/vue/dist/vue.js"></script>

    <body>
        <jsp:doBody/>
    </body>

    <div>
        <script src="/static/libs/mdbootstrap/js/jquery-3.1.1.js"></script>
        <script src="/static/libs/mdbootstrap/js/mdb.min.js"></script>
    </div>

    <jsp:invoke fragment="scripts"/>

</html>