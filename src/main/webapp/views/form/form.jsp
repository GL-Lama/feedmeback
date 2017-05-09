<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<%--<jsp:useBean id="student" class="servlet.models.StudentModel" scope="request"/>
--%>

<tag:wrapper>
    <jsp:attribute name="head">
            <link rel="stylesheet" type="text/css" href="/static/app/form/form.css"></link>
    </jsp:attribute>

    <jsp:attribute name="scripts">
        <script src="/static/app/form/form.js"></script>
    </jsp:attribute>


     <jsp:body>
        <div class="card pr-0 pl-0 fmb-bg-primary mt-6 col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-12">
            <div class="card-block pr-0 pl-0 pb-0">
                <p class="fmb-font-title text-center">FEED<span>ME</span>BACK</p>
                <a href="/logout"><i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i></a>

                <div class="d-flex justify-content-center ">
                    <p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">Votre avis nous intéresse Machin !<p>
                </div>
            </div>

            <div class="card-block fmb-card-content">

                <div class="d-flex justify-content-center fmb-bg-message fmb-border-message">
                    <div class="d-flex w-100 align-items-start">
                        <div class="w-15 pl-4 pt-1 pb-1">
                            <small>Nom du Module</small>
                            <h3 class="text-truncate m-0">Cybersécurité</h3>
                        </div>
                        <div class="w-15 pl-4 pt-1 pb-1">
                            <small>Nom du formulaire</small>
                            <h3 class="text-truncate m-0">Cybersécurité #1</h3>
                        </div>
                    </div>
                </div>

                <div class="d-flex justify-content-center fmb-bg-message fmb-border-message mt-1">
                    <div class="d-flex w-100 align-items-start pl-4 pt-1 pb-1 ">
                        <div class="w-25">
                            <small class="w-100 text-center">Date</small>
                            <p class="text-truncate m-0">20/03/2017</p>
                        </div>
                        <div class="w-25">
                            <small class="w-100 text-center">Horaire de fin</small>
                            <p class="text-truncat m-0">17:30</p>
                        </div>
                        <div class="w-50">
                            <small class="w-100 text-center">Professeur</small>
                            <p class="text-truncat m-0">Jacques Célère</p>
                        </div>
                </div>
                </div>


                <div class="text-center mx-auto">
                    <a href="/form/formQuestion/"><button class="fmb-btn-primary fmb-font-sm btn">Commencer</button></a>
                </div>

            </div>
        </div>

     </jsp:body>
</tag:wrapper>