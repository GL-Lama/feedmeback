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
        <div id="teacher" class="card pr-0 pl-0 fmb-bg-primary mt-6 col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-12">
            <div class="card-block pr-0 pl-0 pb-0">
                <p class="fmb-font-title text-center">FEEDMEBACK</p>
                <i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i>

                <div class="d-flex justify-content-center ">
                    <p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">Bon retour parmis nous, ${teacher.username} !<p>
                </div>
            </div>

            <div class="card-block fmb-card-content">
            hello
            
            </div>



        </div>

     </jsp:body>
</tag:wrapper>