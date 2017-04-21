<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<tag:wrapper>

    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="/static/app/form/newForm.css"></link>
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
                    
                    <i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i>

                    <div class="d-flex justify-content-center text-center">
                        <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Création d'un formulaire<br>
                        Formulaire existant</p>
                    </div>

                    <div class="list-group">
                        <a class="list-group-item list-group-item-action flex-column align-items-start fmb-bg-secondary">
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
                                    <div class="w-50 text-center"><i v-on:click="modify('Hello')" class="fa fa-pencil fa-3x" aria-hidden="true"></i></div>
                                    <div class="w-50 text-center"><i class="fa fa-eye fa-3x" aria-hidden="true"></i></div>
                                </div>
                            </div>
                        </a>
                        <a class="list-group-item list-group-item-action flex-column align-items-start fmb-bg-secondary">
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
                                    <div class="w-50 text-center"><i class="fa fa-pencil fa-3x" aria-hidden="true"></i></div>
                                    <div class="w-50 text-center"><i class="fa fa-eye fa-3x" aria-hidden="true"></i></div>
                                </div>
                            </div>
                        </a>
                        <a class="list-group-item list-group-item-action flex-column align-items-start fmb-bg-secondary">
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
                                    <div class="w-50 text-center"><i class="fa fa-pencil fa-3x" aria-hidden="true"></i></div>
                                    <div class="w-50 text-center"><i class="fa fa-eye fa-3x" aria-hidden="true"></i></div>
                                </div>
                            </div>
                        </a>
                    </div>

                <!--Footer-->
                <div class="modal-footer">
                    <div class="options d-flex justify-content-start">
                        <i class="fa fa-arrow-circle-left fmb-btn-arrow justify-content-start" aria-hidden="true"></i>
                        <i class="fa fa-arrow-circle-right fmb-btn-arrow justify-content-end" aria-hidden="true"></i>
                    </div>
                </div>
    </jsp:body>

</tag:wrapper>
