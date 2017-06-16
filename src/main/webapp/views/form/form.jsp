<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="formModel" class="servlet.models.FormModel" scope="request"/>

<tag:wrapper>
	<jsp:attribute name="head">
			<link rel="stylesheet" type="text/css" href="/static/app/form/form/form.css"></link>
	</jsp:attribute>

	<jsp:attribute name="scripts">
		<script src="/static/app/form/form/form.js"></script>
	</jsp:attribute>

	<jsp:body>
		<div class="card pr-0 pl-0 fmb-bg-primary mt-1 col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-12">
			<div class="card-block pr-0 pl-0 pb-0">
				<p class="fmb-font-title text-center">FEED<span>ME</span>BACK</p>
				<a href="/logout"><i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i></a>
				<a href="/"><i class="fa fa-arrow-circle-left fmb-btn-previous mt-3 ml-4" aria-hidden="true"></i></a>

				<div class="d-flex justify-content-center ">
					<p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">
						Votre avis nous intéresse ${student.student.username} !
					<p>
				</div>
			</div>

			<div id="form" class="card-block fmb-card-content">

				<div class="d-flex fmb-bg-message fmb-border-message">
					<div class="d-flex w-100 justify-content-between px-4 py-2">
						<div>
							<small>Nom du Module</small>
							<h3 class="text-truncate m-0"><c:out value="${formModel.module.name}"/></h3>
						</div>
						<div>
							<small>Nom du formulaire</small>
							<h3 class="text-truncate m-0"><c:out value="${formModel.form.name}"/></h3>
						</div>
					</div>
				</div>

				<div class="d-flex fmb-bg-message fmb-border-message my-3">
					<div class="d-flex w-100 justify-content-between px-4 py-2">
						<div>
							<small class="w-100 text-center">Date d'expiration</small>
							<p class="text-truncate m-0">{{getDate(${formModel.form.endDate})}}</p>
						</div>
						<div>
							<small class="w-100 text-center">Professeur</small>
							<p class="text-truncat m-0">${formModel.teacher.username}</p>
						</div>
					</div>
				</div>

				<div class="text-center mx-auto">
					<a href="/form/formQuestion?id=${formModel.form.idForm}"><button class="fmb-btn-primary fmb-font-sm btn">Commencer</button></a>
				</div>

			</div>
		</div>
	</jsp:body>
</tag:wrapper>