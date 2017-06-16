<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="moduleManager" class="servlet.models.ModuleManagerModel" scope="request"/>

<tag:wrapper>

	<jsp:attribute name="head">
		<link rel="stylesheet" type="text/css" href="/static/app/home/teacher/teacher.css"></link>
	</jsp:attribute>

	<jsp:body>

		<div id="newForm" class="card pr-0 pl-0 fmb-bg-primary mt-1 col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-12">
			<div id="newModule" class="card-block pr-0 pl-0 pb-0">
				<p class="fmb-font-title text-center">FEED<span>ME</span>BACK</p>
				<a href="/logout"><i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i></a>

				<div class="d-flex justify-content-center ">
					<p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">Votre module a été créé avec succès !<p>
				</div>

				<div class="card-block fmb-card-content">

				<div class="fmb-bg-message fmb-border-item ">
					<div class="md-form d-flex w-100 align-items-start">
						<div class="w-15 pl-4 pt-1 pb-1">
							<small>Nom du Module</small>
							<h1 class="text-truncate m-0"><c:out value="${moduleManager.module.name}"/></h1>
						</div>
					</div>
				</div>

				<div class="md-form d-flex w-100 justify-content-center pt-2">
					<div class="fmb-bg-message fmb-border-item p-2 pl-4 pr-4 pt-1">

							<small>Liste des élèves</small>
							<c:forEach items="${moduleManager.students}" var="student">
								<h3 class="text-truncate m-0"><c:out value="${student.username}"/></h3>
							</c:forEach>

					</div>
				</div>

				<div class="d-flex justify-content-center title-box pt-3">
					<a href="/moduleManager">
						<button v-on:click="addModule" type="button" class="btn color-button mb-1 bt-1 mt-0 fmb-border-message">Terminer</button>
					</a>
				</div>

			</div>
		</div>

	</jsp:body>

</tag:wrapper>