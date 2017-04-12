<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<tag:wrapper>

    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="/static/app/login/login.css"></link>
    </jsp:attribute>

    <jsp:attribute name="scripts">
        <script src="/static/app/login/login.js"></script>
    </jsp:attribute>

    <jsp:body>

        <!--Form without header-->
        <div id="login" class="card fmb-bg-primary mt-6 col-xl-4 offset-xl-4 col-md-6 offset-md-3 col-sm-10 offset-sm-1 col-12">
            <div class="card-block">

                <p class="fmb-font-title text-center">FEEDMEBACK</p>

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
                    <button v-on:click="submit" class="btn fmb-btn-primary">Login</button>
                </div>

            </div>

            <!--Footer-->
            <div class="modal-footer">
                <div class="options">
                    <p>Not a member? <a href="#">Sign Up</a></p>
                    <p>Forgot <a href="#">Password?</a></p>
                    <label class="custom-control custom-checkbox">
                        <input v-model="isTeacher" type="checkbox" class="custom-control-input">
                        <span class="custom-control-indicator"></span>
                        <p class="custom-control-description">I'm a teacher</p>
                    </label>
                </div>
            </div>

        </div>
        <!--/Form without header-->

    </jsp:body>

</tag:wrapper>