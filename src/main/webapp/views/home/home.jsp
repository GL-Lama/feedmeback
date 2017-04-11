<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<tag:wrapper>

    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="/static/app/home/home.css"></link>
    </jsp:attribute>

    <jsp:attribute name="scripts">
        <script src="/static/app/home/home.js"></script>
    </jsp:attribute>

    <jsp:body>
        <div id="app">
            {{ message }}
        </div>

        <div id="app-2">
            <span v-bind:title="message">
                Hover your mouse over me for a few seconds
                to see my dynamically bound title!
            </span>
        </div>

        <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
        <button type="button" class="btn btn-primary">Primary</button>

        <!-- Indicates a dangerous or potentially negative action -->
        <button type="button" class="btn btn-default">Default</button>

        <!-- Secondary, outline button -->
        <button type="button" class="btn btn-secondary">Secondary</button>

        <!-- Indicates a successful or positive action -->
        <button type="button" class="btn btn-success">Success</button>

        <!-- Contextual button for informational alert messages -->
        <button type="button" class="btn btn-info">Info</button>

        <!-- Indicates caution should be taken with this action -->
        <button type="button" class="btn btn-warning">Warning</button>

        <!-- Indicates a dangerous or potentially negative action -->
        <button type="button" class="btn btn-danger">Danger</button>


        <div class="md-form">
            <input type="text" id="form1" class="form-control">
            <label for="form1" class="">Example label</label>
        </div>
    </jsp:body>

</tag:wrapper>