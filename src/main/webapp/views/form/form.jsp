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
                <p class="fmb-font-title text-center">FEEDMEBACK</p>
                <i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i>

                <div class="d-flex justify-content-center ">
                    <p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">Votre avis nous intéresse Machin !<p>
                </div>
            </div>

            <%-- ------------------------------------------------------------------------- --%>

            <div class="card-block fmb-card-content">
                <div class="d-flex justify-content-center ">
                    <p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">Cybersécurité<p>
                </div>

                <div class="list-group">
                            <a class="flex-column fmb-border-message align-items-start fmb-bg-secondary mb-1" >
                                <div class="d-flex w-100 align-items-start">
                                    <div class="w-15">
                                        <small>Nom du formulaire</small>
                                        <p class="text-truncate m-0">Cybersécurité</p>
                                    </div>
                                </div>
                            </a>
                            <a class="flex-column fmb-border-message align-items-start fmb-bg-secondary mb-1">
                                <div class="d-flex w-100 align-items-start">
                                    <div class="w-15">
                                        <small class="pl-5">Date</small>
                                        <p class="text-truncate m-0">20/03/2017</p>
                                    </div>
                                    <div class="w-50 pl-3 pr-3">
                                        <small class="pl-5">Horaires</small>
                                        <p class="text-truncat m-0">Sciences Fondamentales</p>
                                    </div>
                                    <div class="w-35">
                                        <small class="pl-5">Professeur</small>
                                        <p class="text-truncat m-0">Jacques Célère</p>
                                    </div>
                                </div>
                            </a>
                            <a class="fmb-bg-secondary">                                     
                                    <p class="text-center m-0">Commencez</p>
                            </a>
                </div>
            
            </div>
        </div>

     </jsp:body>
</tag:wrapper>