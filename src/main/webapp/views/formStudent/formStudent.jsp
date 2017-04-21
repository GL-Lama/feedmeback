<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<tag:wrapper>

    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="/static/app/formManager/formManager.css"></link>
        <link rel="stylesheet" type="text/css" href="/static/css/themes/fmb-theme-0.css"></link>
    </jsp:attribute>

    <jsp:body>

        <div id="formStudent" class="card pr-0 pl-0 fmb-bg-primary mt-6 col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-12">
            <div class="card-block pr-0 pl-0 pb-0">
                <p class="fmb-font-title text-center">FEEDMEBACK</p>
                <i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i>
            </div>
            <p class="text-center fmb-bg-primary">Votre avis nous est cher, Machin !! </p>
        </div>

    </jsp:body>
</tag:wrapper>