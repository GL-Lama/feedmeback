<!DOCTYPE HTML>
<html>

    <head>
        <title>FeedMEback</title>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="/static/libs/mdbootstrap/css/mdb.css"></link>
    </head>

    <script src="/static/libs/vue/dist/vue.js"></script>
    <script src="/static/libs/mdbootstrap/js/mdb.js"></script>
    <script src="/static/libs/mdbootstrap/js/bootstrap.js"></script>
    <script src="/static/libs/mdbootstrap/js/tether.js"></script>
    <script src="/static/libs/mdbootstrap/js/jquery-3.1.1.js"></script>

    <body>
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

    </body>

    <script src="/static/app/home.js"></script>
</html>