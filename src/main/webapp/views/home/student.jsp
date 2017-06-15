<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="student" class="servlet.models.StudentModel" scope="request"/>

<tag:wrapper>

    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="/static/app/home/student/student.css"></link>
    </jsp:attribute>

    <jsp:attribute name="scripts">
        <script src="/static/app/home/student/student.js"></script>
    </jsp:attribute>

    <jsp:body>

        <div class="d-flex justify-content-center mt-1">

            <div id="student" class="card pr-0 pl-0 fmb-bg-primary col-xl-8 col-md-8 col-sm-4 col-12">

                <div class="card-block pr-0 pl-0 pb-0">

                    <p class="fmb-font-title text-center">FEED<span>ME</span>BACK</p>

                    <a href="/logout"><i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i></a>

                    <div class="d-flex justify-content-center ">
                        <p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">Bon retour parmi nous, ${student.username} !<p>
                    </div>

                    <div class="card-block fmb-card-content">
                        <div class="d-flex justify-content-center">
                            <p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1 ">En attente<p>
                        </div>

                        <c:if test = "${student.forms.size() == 0}">
                                <div class="d-flex justify-content-center">
                                    <p>Détendez-vous, vous n'avez aucun formulaire à remplir ! ;)<p>
                                </div>
                         </c:if>

                        <div class="list-group fmb-border-item">

                            <c:forEach items="${student.forms}" var="form">

                                <a href="/form?id=${form.idForm}">
                                    <div class="list-group-item list-group-item-action flex-column align-items-start fmb-bg-item">
                                        <div class="d-flex w-100 align-items-start">
                                            <div class="w-25">
                                                <small>Date</small>
                                                <p>{{getDate(${form.date})}}</p>
                                            </div>
                                            <div class="w-50 pl-3 pr-3">
                                                <small>Nom du formulaire</small>
                                                <p class="text-truncat m-0"><c:out value="${form.name}"/></p>
                                            </div>
                                            <div class="d-flex w-25 justify-content-end">
                                                <div class="w-50 text-center"><i class="fa fa-eye fa-3x" aria-hidden="true"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                </a>

                            </c:forEach>


                        </div>

                        <div class="d-flex justify-content-center w-100 mt-1 ">
                            <p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">Mes modules</p>
                        </div>

                        <div class="d-flex flex-wrap justify-content-center w-100 text-center">
                            <c:forEach items="${student.modules}" var="module">
                                <button class="btn px-3 fmb-btn-primary"><c:out value="${module.name}"/></button>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </jsp:body>

</tag:wrapper>