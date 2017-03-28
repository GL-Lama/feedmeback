<!DOCTYPE HTML>
<html>

    <head>
        <title>FeedMEback</title>
        <meta charset="utf-8">
    </head>

    <script src="https://unpkg.com/vue"></script>

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
    </body>

    <script src="/static/js/home.js"></script>
</html>