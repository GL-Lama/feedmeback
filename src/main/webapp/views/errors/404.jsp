<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<tag:wrapper>

    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="/static/app/error/404.css"></link>
    </jsp:attribute>

    <jsp:body>

            <div class="mt-6 col-xl-4 offset-xl-4 col-md-6 offset-md-3 col-sm-10 offset-sm-1 col-12 fmb-bg-primary card">

                <div class="card-block">

                    <p class="fmb-font-title text-center">FEED404BACK</p>

                    <div class="col-12 fmb-bg-secondary">
                        <p class="text-center fmb-font-md">Oups !</p>
                        <p class="col-10 offset-1 text-center">La page que vous avez demandez n'existe pas...</p>
                        <p class="col-12 text-center">Cliquez sur le lien ci-dessous pour accéder à une page existante</p>
                    </div>

                    <!--Footer-->
                    <div class="modal-footer">
                        <div class="text-center mx-auto">
                            <a href="/"><button class="fmb-btn-primary fmb-font-sm btn">Mettez-vous à l'aise</button></a>
                        </div>
                    </div>

                </div>

            </div>

    </jsp:body>

</tag:wrapper>