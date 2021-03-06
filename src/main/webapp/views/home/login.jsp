<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<tag:wrapper>

	<jsp:attribute name="head">
		<link rel="stylesheet" type="text/css" href="/static/app/login/login.css"></link>
	</jsp:attribute>

	<jsp:attribute name="scripts">
		<script src="/static/app/login/login.js"></script>
	</jsp:attribute>

	<jsp:body>
		<div id="login" class="card fmb-bg-primary mt-1 col-xl-4 offset-xl-4 col-md-6 offset-md-3 col-sm-10 offset-sm-1 col-12">
			<div class="card-block">

				<p class="fmb-font-title text-center">FEED<span>ME</span>BACK</p>

				<div class="md-form">
					<i class="fa fa-envelope prefix"></i>
					<input type="text" id="form2" class="form-control" v-model="username">
					<label for="form2">Identifiant</label>
				</div>

				<div class="md-form">
					<i class="fa fa-lock prefix"></i>
					<input type="password" id="form4" class="form-control" v-model="password">
					<label for="form4">Mot de passe</label>
				</div>

				<div class="text-center">
					<button v-on:click="submit" class="btn fmb-btn-primary">Connexion</button>
				</div>

			</div>

			<div class="modal-footer">
				<div class="options">
					<p>
						<div class="btn-group" data-toggle="buttons">
							<button type="button" v-on:click="selectStudent" class="btn btn-md fmb-btn-primary" v-bind:class="{ selected: isNotTeacher }">
								Student
							</button>
							<button type="button" v-on:click="selectTeacher"class="btn btn-md fmb-btn-primary" v-bind:class="{ selected: isTeacher }">
								Teacher
							</button>
						</div>
					</p>
				</div>
			</div>

		</div>
	</jsp:body>

</tag:wrapper>