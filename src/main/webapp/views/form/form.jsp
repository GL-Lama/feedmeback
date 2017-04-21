<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<tag:wrapper>

    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="/static/app/form/form.css"></link>
    </jsp:attribute>

    <jsp:attribute name="scripts">
        <script src="/static/app/form/form.js"></script>
    </jsp:attribute>

    <jsp:body>
                <!--Form without header-->
       <div class="d-flex justify-content-center mt-6"> 
            <div id="login" class="card fmb-bg-primary col-xl-8 col-md-8 col-sm-4 col-12">
                <div class="card-block">

                    <p class="fmb-font-title text-center">FEEDMEBACK</p>
                    
                    <div class="d-flex justify-content-center text-center">
                        <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Création d'un formulaire<br>
                        Informations générales</p>
                    </div>
                    <form>
                        <div class="md-form d-flex w-100 justify-content-center">
                            <div class="w-50 relative">
                                <input type="text" id="form1" class="form-control">
                                <label for="form1" class="">Nom du formulaire</label>
                            </div>
                        </div>
                        <div class="md-form d-flex w-100 justify-content-center">
                            <div class="w-50 relative">
                                <input type="text" id="form2" class="form-control">
                                <label for="form2" class="">Date (JJ/MM/AAAA)</label>
                            </div>
                        </div>

                        <!--<div class="md-form form-group">
                            <i class="fa fa-envelope prefix"></i>
                            <input type="email" id="form91" class="form-control validate">
                            <label for="form91" data-error="wrong" data-success="right">Type your email</label>
                        </div>

                        <div class="md-form form-group">
                            <i class="fa fa-lock prefix"></i>
                            <input type="password" id="form92" class="form-control validate">
                            <label for="form92" data-error="wrong" data-success="right">Type your password</label>
                        </div>

                        <div class="md-form form-group">
                        <a href="" class="btn btn-primary btn-lg">Login</a>
                        </div>-->
                        
                </form>
    </jsp:body>

</tag:wrapper>
