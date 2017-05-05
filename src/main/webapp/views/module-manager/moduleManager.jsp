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
                <p class="fmb-font-title text-center">FEED<span>ME</span>BACK</p>
                <a href="/logout"><i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i></a>

                <div class="d-flex justify-content-center ">
                    <p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">Gestionnaire de modules<p>
                </div>

                <div class="card-block fmb-card-content">

                    <div class="d-flex justify-content-center title-box ">
                    <button type="button" class="btn color-button mb-1 bt-1 mt-0 fmb-border-new"><i class="fa fa-plus pr-3 "></i>Créer un nouveau module</button>
                    </div>
                    
                    <div class="d-flex justify-content-center title-box pt-1">
                    <p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">Mes formulaires</p>
                    </div>

                    <div class="d-flex justify-content-center">
                        <p class=" btn fmb-btn-primary fmb-bg-message fmb-border-message text-center">Génie Logiciel<p>
                        <p class=" btn fmb-btn-primary fmb-bg-message fmb-border-message text-center">Technologie Web<p>
                    </div>

                    <div class="d-flex justify-content-center title-box pt-3">
                    <button type="button" class="btn color-button mb-1 bt-1 mt-0 fmb-border-new">Rechercher un module</button>
                    </div>

                </div>

            </div>
        </div>

    </jsp:body>

</tag:wrapper>