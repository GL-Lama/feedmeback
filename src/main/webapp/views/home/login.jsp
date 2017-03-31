<!DOCTYPE HTML>
<html>

    <head>
        <title>FeedMEback</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="/static/libs/mdbootstrap/css/bootstrap.min.css"></link>
        <link rel="stylesheet" type="text/css" href="/static/libs/mdbootstrap/css/mdb.min.css"></link>
        <link rel="stylesheet" type="text/css" href="/static/app/login/login.css"></link>
    </head>

    <script src="/static/libs/vue/dist/vue.js"></script>

    <body>

        <div class="mt-6 col-md-6 offset-md-3 col-sm-10 offset-sm-1">

            <!--Form without header-->
            <div id="login" class="card">
                <div class="card-block">

                    <!--Header-->
                    <div class="text-center">
                        <h3><i class="fa fa-lock"></i> Login:</h3>
                        <hr class="mt-2 mb-2">
                    </div>

                    <!--Body-->
                    <div class="md-form">
                        <i class="fa fa-envelope prefix"></i>
                        <input type="text" id="form2" class="form-control" v-model="username">
                        <label for="form2">Your email</label>
                    </div>

                    <div class="md-form">
                        <i class="fa fa-lock prefix"></i>
                        <input type="password" id="form4" class="form-control" v-model="password">
                        <label for="form4">Your password</label>
                    </div>

                    <div class="text-center">
                        <button v-on:click="submit" class="btn btn-deep-purple">Login</button>
                    </div>

                </div>

                <!--Footer-->
                <div class="modal-footer">
                    <div class="options">
                        <p>Not a member? <a href="#">Sign Up</a></p>
                        <p>Forgot <a href="#">Password?</a></p>
                    </div>
                </div>

            </div>
            <!--/Form without header-->

        </div>

    </body>

    <script src="/static/libs/mdbootstrap/js/jquery-3.1.1.js"></script>
    <script src="/static/libs/mdbootstrap/js/mdb.min.js"></script>
    <script src="/static/app/login/login.js"></script>
</html>