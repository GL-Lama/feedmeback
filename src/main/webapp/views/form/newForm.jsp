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
                        <!-- Button trigger modal -->
                        <button type="button" class="btn  btn-md fmb-btn-primary" data-toggle="modal" data-target="#myModal">
                            Utiliser un formulaire existant
                        </button>
                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <!--Content-->
                        <div class="modal-content fmb-bg-primary">
                            <!--Header-->
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h4 class="modal-title w-100" id="myModalLabel">Modal title</h4>
                            </div>
                            <!--Body-->
                            <div class="modal-body">
                                ...
                            </div>
                            <!--Footer-->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                        <!--/.Content-->
                    </div>
                </div>
                <!-- /.Live preview-->
                    </p>
                    <i class="fa fa-arrow-circle-right fmb-btn-arrow" aria-hidden="true"></i>
                    </div>
                </div>
    </jsp:body>

</tag:wrapper>
