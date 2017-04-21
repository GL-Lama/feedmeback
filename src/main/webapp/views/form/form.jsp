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
                    
                    <i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i>

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
                    
                </form>
                    <!--Footer-->
                <div class="modal-footer">
                    <div class="options d-flex justify-content-end">
                    <p>
                        <div class="btn-group" data-toggle="buttons">
                            <button type="button" v-on:click="selectExistantForm" class="btn btn-md fmb-btn-primary" style="right: 70px;">Utiliser un formulaire existant</button>
                            <!--<button type="button" v-on:click="selectCreateForm"class="btn btn-md fmb-btn-primary">Créer</button>-->
                        </div>
                    </p>
                    <i class="fa fa-arrow-circle-right fmb-btn-arrow mb-2 mr-5" aria-hidden="true"></i>
                    </div>
                    <!--<div class="d-flex justify-content-end">...</div>-->
                </div>
    </jsp:body>

</tag:wrapper>
