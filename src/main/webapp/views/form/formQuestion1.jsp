<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<tag:wrapper>

    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="/static/app/form/formQuestion.css"></link>
    </jsp:attribute>

    <jsp:attribute name="scripts">
        <script src="/static/app/form/formQuestion.js"></script>
    </jsp:attribute>

    <jsp:body>
            <div class="card pr-0 pl-0 fmb-bg-primary mt-6 col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-12">
                <div class="card-block pr-0 pl-0 pb-0">

                    <p class="fmb-font-title text-center">FEEDMEBACK</p>
                    
                    <i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i>

                    <div class="d-flex justify-content-center text-center">
                        <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Cybersécurité #3</p>
                    </div>

                    <div class="card-block fmb-card-content">
                       
                        <div class="d-flex justify-content-center text-center">
                            <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" > <i class="fa fa-arrow-circle-right fmb-btn-arrow fa-rotate-180 pl-1" aria-hidden="true"></i>Comment vous a paru la difficulté de ce cours ?
                            <i class="fa fa-arrow-circle-right fmb-btn-arrow" aria-hidden="true"></i></p>
                        </div>

                        <div class="d-flex justify-content-center text-center">
                            <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Difficile</p>
                        </div> 

                        <div class="progress">
                        <div class="progress-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;">
                        <span class="sr-only">80% effectué</span>
                        </div>
                        </div>

                        <p class="text-center mt-2 "> 2/5 </p>

                </div>
    </jsp:body>

</tag:wrapper>
