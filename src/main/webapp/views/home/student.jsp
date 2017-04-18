<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<tag:wrapper>

    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="/static/app/home/student.css"></link>
    </jsp:attribute>

    <jsp:attribute name="scripts">
        <script src="/static/app/home/student.js"></script>
    </jsp:attribute>

    <jsp:body>
        <!--Body-->

        <div class="d-flex justify-content-center mt-6"> 
            <div id="dashboard" class="card fmb-bg-primary col-xl-8 col-md-8 col-sm-4 col-12">
                <div class="card-block">

                    <p class="fmb-font-title text-center">FEEDMEBACK</p>

                    <div class="fmb-bg-message fmb-border-message">
                    <p class="text-center">Bon retour parmis nous, machin !<p>
                    </div>

                    <div>
                        <div>
                            <div class="fmb-bg-message fmb-border-message">
                                <p class="text-center">En attente<p>
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
                                            <p class="text-truncat m-0">Sciences Fondamentales</p>
                                        </div>
                                        <div class="d-flex w-25">
                                            <div class="w-50 text-center"><i class="fa fa-eye fa-3x" aria-hidden="true"></i></div>
                                        </div>
                                    </div>
                                </a>
                
                            </div>
                        </div>

                        <div class="fmb-bg-message fmb-border-message">
                            <p class="text-center">Mes modules<p>
                        </div>

                        

           
                    
                 
                </div>
            </div>
        </div>
    </jsp:body>

</tag:wrapper>