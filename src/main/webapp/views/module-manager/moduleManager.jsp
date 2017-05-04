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
                    <p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">Gestionnaire de modules<p>
                </div>

                <div class="card-block fmb-card-content">

                    <div class="d-flex justify-content-center title-box ">
                    <a href="/moduleManager/newModule"><button type="button" class="btn color-button mb-1 bt-1 mt-0 fmb-border-new"><i class="fa fa-plus pr-3 "></i>Créer un nouveau module</button></a>
                    </div>
                    
                    <div class="d-flex justify-content-center title-box pt-1">
                    <p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">Mes modules</p>
                    </div>

                    <div class="d-flex justify-content-center">
                        <p class=" btn fmb-btn-primary fmb-bg-message fmb-border-message text-center">Génie Logiciel<p>
                        <p class=" btn fmb-btn-primary fmb-bg-message fmb-border-message text-center">Technologie Web<p>
                    </div>

                    <div class="modal-footer">
                        <div class="options d-flex justify-content-end">
                        <p>
                            <!-- Button trigger modal -->
                            <button type="button" class="btn  btn-md fmb-btn-primary fmb-border-new" data-toggle="modal" data-target="#myModal">
                                Rechercher un module
                            </button>

                    <!-- Search Pop-up -->
                    <div class="modal fade scroll" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <!--Content-->
                            <div class="modal-content fmb-bg-primary">
                                <!--Header-->
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <h4 class="modal-title w-100" id="myModalLabel">Recherche d'un module</h4>
                                </div>

                                <!--Body-->
                                <div class="modal-body">
                                    
                                </div>

                            </div>
                            
                        </div>
                    </div>



                </div>

            </div>
        </div>

    </jsp:body>

</tag:wrapper>