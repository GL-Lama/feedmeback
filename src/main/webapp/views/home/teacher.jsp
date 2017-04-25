<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="teacher" class="servlet.models.TeacherModel" scope="request"/>

<tag:wrapper>

    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="/static/app/home/teacher.css"></link>
    </jsp:attribute>

    <jsp:attribute name="scripts">
        <script src="/static/app/home/teacher.js"></script>
    </jsp:attribute>

    <jsp:body>

        <div class="card pr-0 pl-0 fmb-bg-primary mt-6 col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-12">
            <div id="teacher" class="card-block pr-0 pl-0 pb-0">
                <p class="fmb-font-title text-center">FEEDMEBACK</p>
                <i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i>

                <div class="d-flex justify-content-center ">
                    <p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">Bon retour parmis nous, ${teacher.username} !<p>
                </div>

                <div class="card-block fmb-card-content">

                    <div class="d-flex justify-content-center">
                    <button type="button" class="btn fmb-btn-primary">Créer nouveau formulaire</button>
                    </div>

                    <div class="d-flex justify-content-center pt-2">
                    <p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">Mes formulaires<p>
                    </div>
                    

                    <div class="list-group fmb-border-item">
                        <a class="list-group-item list-group-item-action flex-column align-items-start fmb-bg-item">
                            <div class="d-flex w-100 align-items-start">
                                <div class="w-25">
                                    <small>Date</small>
                                    <p class="text-truncate m-0">20/03/2017</p>
                                </div>
                                <div class="w-50 pl-3 pr-3">
                                    <small>Nom du formulaire</small>
                                    <p class="text-truncat m-0">${teacher.form.name}</p>
                                </div>
                                <div class="d-flex w-25">
                                    <div class="w-50 text-center"><i v-on:click="modify('Hello')" class="fa fa-pencil fa-3x" aria-hidden="true"></i></div>
                                    <div class="w-50 text-center"><i class="fa fa-eye fa-3x" aria-hidden="true"></i></div>
                                </div>
                            </div>
                        </a>
                        <a class="list-group-item list-group-item-action flex-column align-items-start fmb-bg-item">
                            <div class="d-flex w-100 align-items-start">
                                <div class="w-25">
                                    <small>Date</small>
                                    <p class="text-truncate m-0">20/03/2017</p>
                                </div>
                                <div class="w-50 pl-3 pr-3">
                                    <small>Nom du formulaire</small>
                                    <p class="text-truncat m-0">${teacher.form.name}</p>
                                </div>
                                <div class="d-flex w-25">
                                    <div class="w-50 text-center"><i class="fa fa-pencil fa-3x" aria-hidden="true"></i></div>
                                    <div class="w-50 text-center"><i class="fa fa-eye fa-3x" aria-hidden="true"></i></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <br>
                    <div class="d-flex justify-content-center ">
                        <p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">Mes modules<p>
                    </div>
                    <br>
                    <div class="d-flex justify-content-center ">
                        <p class=" btn fmb-btn-primary fmb-bg-message fmb-border-message text-center ">Génie Logiciel<p>
                        <p class=" btn fmb-btn-primary fmb-bg-message fmb-border-message text-center ">Technologie Web<p>
                    </div>

                </div>

            </div>
        </div>

    </jsp:body>

</tag:wrapper>