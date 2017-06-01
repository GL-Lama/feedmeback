<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="moduleManager" class="servlet.models.ModuleManagerModel" scope="request"/>

<tag:wrapper>

    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="/static/app/home/teacher/teacher.css"></link>
    </jsp:attribute>

    <jsp:body>

        <div id="newForm" class="card pr-0 pl-0 fmb-bg-primary mt-6 col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-12">
            <div id="newModule" class="card-block pr-0 pl-0 pb-0">
                <p class="fmb-font-title text-center">FEED<span>ME</span>BACK</p>
                <a href="/logout"><i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i></a>


                <div class="d-flex justify-content-center ">
                    <p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">Création d'un module<p>
                </div>

                <div class="d-flex justify-content-center fmb-bg-message fmb-border-message">
                    <div class="d-flex w-100 align-items-start">
                        <div class="w-15 pl-4 pt-1 pb-1">
                            <small>Nom du Module</small>
                            <h3 class="text-truncate m-0"><c:out value="${moduleManager.module.name}"/></h3>
                        </div>
                    </div>
                </div>

                

                <c:forEach items="${moduleManager.students}" var="student">

                    <div>${student.username}</div>
                    
                    
                </c:forEach>

                <div>${moduleManager.module.name}</div>

               
            </div>
        </div>

    </jsp:body>

</tag:wrapper>