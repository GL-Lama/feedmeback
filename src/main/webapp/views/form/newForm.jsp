<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<tag:wrapper>

    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="/static/app/form/new-form/newForm.css"></link>
    </jsp:attribute>

    <jsp:attribute name="scripts">
        <script src="/static/app/form/new-form/newForm.js"></script>
    </jsp:attribute>

    <jsp:body>
        <div class="card pr-0 pl-0 fmb-bg-primary mt-6 col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-12">
            <div class="card-block pr-0 pl-0 pb-0">

                <p class="fmb-font-title text-center">FEED<span>ME</span>BACK</p>

                    <a href="/logout"><i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i></a>
                 
                    <div class="d-flex justify-content-center text-center">
                        <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Création d'un formulaire<br>
                        Informations générales</p>
                    </div>

                    <div class="card-block fmb-card-content">
                        <form>
                            <div class="md-form d-flex w-100 justify-content-center">
                                <div class="w-50 relative">
                                    <input type="text" id="form1" class="form-control">
                                    <label for="form1" class="">Nom du formulaire</label>
                                </div>
                            </div>
                            <div class="md-form d-flex w-100 justify-content-center">
                                <div class="w-50 relative">
                                    <input type="text" id="datepicker" class="form-control">
                                    <label for="datepicker" class="">Date</label>
                                </div>
                            </div>

                    </form>
                        <!--Footer-->
                    <div class="modal-footer">
                        <div class="options d-flex justify-content-end">
                    
                            <!-- Button trigger modal -->
                            <button type="button" class="btn  btn-md fmb-btn-primary" data-toggle="modal" data-target="#myModal">
                                Utiliser un formulaire existant
                            </button>


                    <!-- Modal -->
                    <div class="modal fade scroll" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <!--Content-->
                            <div class="modal-content fmb-bg-primary">
                                <!--Header-->
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <h4 class="modal-title w-100" id="myModalLabel">Formulaire existant</h4>
                                </div>
                                <!--Body-->
                                <div class="modal-body">
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
                                </div>
                            </div>


                <div class="card-block fmb-card-content">
                    <div class="md-form d-flex w-100 justify-content-center">
                        <div class="w-50 relative">
                            <input type="text" id="form1" class="form-control">
                            <label for="form1" class="">Nom du formulaire</label>
                        </div>
                    </div>
                    <div class="md-form d-flex w-100 justify-content-center">
                        <div class="w-50 relative">
                            <input type="text" id="datepicker" class="form-control">
                            <label for="datepicker" class="">Date de début</label>
                        </div>
                    </div>
                    <div class="md-form d-flex w-100 justify-content-center">
                        <div class="w-50 relative">
                            <input type="text" id="datepicker" class="form-control">
                            <label for="datepicker" class="">Date d'expiration</label>
                        </div>
                    </div>

                    <!--Footer-->
                    <div class="modal-footer">
                        <div class="options d-flex justify-content-end">

                            <p>
                                <!-- Button trigger modal -->
                                <button type="button" class="btn  btn-md fmb-btn-primary" data-toggle="modal" data-target="#myModal">
                                    Utiliser un formulaire existant
                                </button>

                            </p>
                            <i class="fa fa-arrow-circle-right fmb-btn-arrow" aria-hidden="true"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</tag:wrapper>
