<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="teacher" class="servlet.models.TeacherModel" scope="request"/>

<tag:wrapper>

    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="/static/app/home/teacher/teacher.css"></link>
    </jsp:attribute>

    <jsp:attribute name="scripts">
        <script src="/static/app/home/teacher/teacher.js"></script>
    </jsp:attribute>

    <jsp:body>

        <div class="card pr-0 pl-0 fmb-bg-primary mt-6 col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-12">
            <div id="teacher" class="card-block pr-0 pl-0 pb-0">
                <p class="fmb-font-title text-center">FEED<span>ME</span>BACK</p>
                <a href="/logout"><i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i></a>

                <div class="d-flex justify-content-center ">
                    <p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">Bon retour parmi nous, ${teacher.username} !<p>
                </div>

                <div class="card-block fmb-card-content">

                    <div class="d-flex justify-content-center pt-2 title-box ">
                        <p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">Mes formulaires</p>
                        <a href="/form/newForm/"> <button type="button" class="btn color-button mb-1 bt-1 mt-0 fmb-border-new"><i class="fa fa-plus pr-4 "></i>Nouveau</button></a>
                    </div>


                    <div class="list-group fmb-border-item">

                        <c:forEach items="${teacher.forms}" var="form">
                            <a class="list-group-item list-group-item-action flex-column align-items-start fmb-bg-item">
                                <div class="d-flex w-100 align-items-start">
                                    <div class="w-25">
                                        <small>Date</small>
                                        <p>{{getDate(${form.date})}}</p>
                                        
                                        <%--<p class="text-truncate m-0">20/03/2017</p>--%>
                                    </div>
                                    <div class="w-50 pl-3 pr-3">
                                        <small>Nom du formulaire</small>
                                        <p class="text-truncat m-0">${form.name}</p>
                                    </div>
                                    <div class="d-flex w-25">
                                        <div class="w-50 text-center"><i v-on:click="modify('Hello')" class="fa fa-pencil fa-3x" aria-hidden="true"></i></div>
                                        <div class="w-50 text-center"><i class="fa fa-eye fa-3x" aria-hidden="true"></i></div>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>

                    </div>

                    <br>

                    <div class="d-flex justify-content-center title-box ">
                        <a href="/moduleManager/"><button type="button" class="btn color-button mb-1 bt-1 mt-0 fmb-border-message">Gestionnaire de modules</button></a>
                    </div>

                    <br>

                </div>

            </div>
        </div>

    </jsp:body>

</tag:wrapper>