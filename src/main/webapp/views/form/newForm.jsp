<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="teacherModel" class="servlet.models.TeacherModel" scope="request"/>

<tag:wrapper>

	<jsp:attribute name="head">
		<link rel="stylesheet" type="text/css" href="/static/app/form/new-form/newForm.css"></link>
	</jsp:attribute>

	<jsp:attribute name="scripts">
		<script src="/static/app/form/new-form/newForm.js"></script>
	</jsp:attribute>

	<jsp:body>
		<div class="card pr-0 pl-0 fmb-bg-primary mt-1 col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-12">
			<div id="newForm" class="card-block pr-0 pl-0 pb-0">

				<p class="fmb-font-title text-center">FEED<span>ME</span>BACK</p>

				<a href="/logout"><i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i></a>
				<a href="/"><i class="fa fa-arrow-circle-left fmb-btn-previous mt-3 ml-4" aria-hidden="true"></i></a>

				<div class="d-flex justify-content-center text-center">
					<p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >
						Création d'un formulaire
						<br>
						<span v-if="isThisState(0)">Informations générales</span>
						<span v-else class="relative">
							Questions n°{{currentState}}
							<i v-on:click="deleteQuestion(currentState - 1)" class="fa fa-close ml-2" aria-hidden="true"></i>
						</span>
					</p>
				</div>

				<div class="card-block fmb-card-content">
					<form v-show="isThisState(0)">
						<div class="md-form d-flex w-100 justify-content-center">
							<div class="w-50 relative">
								<input v-model="formName" type="text" id="form1" class="form-control">
								<label for="form1" class="">Nom du formulaire</label>
							</div>
						</div>
						<div class="md-form d-flex w-100 justify-content-center">
							<div class="w-50 relative">
								<input v-model="startDate" type="text" id="datepickerStart" class="form-control">
								<label for="datepickerStart" class="">Date de début</label>
							</div>
						</div>

						<div class="md-form d-flex w-100 justify-content-center">
							<div class="w-50 relative">
								<input v-model="endDate" type="text" id="datepickerEnd" class="form-control">
								<label for="datepickerEnd" class="">Date d'expiration</label>
							</div>
						</div>

						<div class="md-form d-flex w-100 justify-content-center">
							<select v-model="idModule" class="custom-select">
								<c:forEach items="${teacherModel.modules}" var="module">
									<option value="${module.idModule}"><c:out value="${module.name}"/></option>
								</c:forEach>
							</select>
						</div>
					</form>

					<form v-for="(question, index) in questions" v-if="isThisState(index + 1)" class="px-3">

						<div class="md-form">
							<textarea type="text" v-bind:id="'question' + index" class="md-textarea">{{question.question}}</textarea>
							<label v-bind:for="'question' + index">1 - Question :</label>
						</div>

						<div>2 - Type :</div>

						<select v-model="question.idType" class="custom-select ml-5 mt-1 pr-5">
							<option v-bind:value="fmb.FmbQuestionTypeSmiley" v-bind:selected="isType(index, fmb.FmbQuestionTypeSmiley)">Smileys</option>
							<option v-bind:value="fmb.FmbQuestionTypeGauge" v-bind:selected="isType(index, fmb.FmbQuestionTypeGauge)">Gauge</option>
							<option v-bind:value="fmb.FmbQuestionTypeMCQ" v-bind:selected="isType(index, fmb.FmbQuestionTypeMCQ)">MQC</option>
							<option v-bind:value="fmb.FmbQuestionTypeYesNo" v-bind:selected="isType(index, fmb.FmbQuestionTypeYesNo)">Yes/No</option>
							<option v-bind:value="fmb.FmbQuestionTypeFree" v-bind:selected="isType(index, fmb.FmbQuestionTypeFree)">Free</option>
						</select>

						<div v-if="isType(index, fmb.FmbQuestionTypeMCQ)">
							<div class="mt-2">3 - Propositions :</div>

							<div class="mx-3 mt-1">

								<div class="md-form">
									<textarea v-model="question.props[0]" type="text" v-bind:id="'prop1' + index" class="md-textarea"></textarea>
									<label v-bind:for="'prop1' + index">#1</label>
								</div>

								<div class="md-form">
									<textarea v-model="question.props[1]" type="text" v-bind:id="'prop2' + index" class="md-textarea"></textarea>
									<label v-bind:for="'prop2' + index">#2</label>
								</div>

								<div class="md-form">
									<textarea v-model="question.props[2]" type="text" v-bind:id="'prop3' + index" class="md-textarea"></textarea>
									<label v-bind:for="'prop3' + index">#3</label>
								</div>

								<div class="md-form">
									<textarea v-model="question.props[3]" type="text" v-bind:id="'prop4' + index" class="md-textarea"></textarea>
									<label v-bind:for="'prop4' + index">#4</label>
								</div>

							</div>
						</div>

					</form>


					<!--Footer-->
					<div class="modal-footer justify-content-between">
						<i v-if="currentState != 0" v-on:click="decrCurrentState()" class="fa fa-arrow-circle-left fmb-btn-arrow fa-3x" aria-hidden="true"></i>

						<div v-if="isThisState(0)" class="options d-flex">
							<button type="button" class="btn btn-md fmb-btn-primary" data-toggle="modal" data-target="#existingFormModal">
								Utiliser un formulaire existant
							</button>
						</div>

						<div class="options d-flex">
							<button type="button" class="btn btn-md fmb-btn-primary" data-toggle="modal" data-target="#validateFormModal">
								Valider le formulaire
							</button>
						</div>

						<i v-if="isEndState()" v-on:click="addQuestion()" class="fa fa-plus fmb-btn-arrow fa-3x" aria-hidden="true"></i>
						<i v-else v-on:click="incrCurrentState()" class="fa fa-arrow-circle-right fmb-btn-arrow fa-3x" aria-hidden="true"></i>
					</div>

					<!-- Modal -->
					<div class="modal fade scroll mt-0" id="existingFormModal" tabindex="-1" role="dialog" aria-labelledby="existingFormModalLabel" aria-hidden="true">
						<div class="modal-dialog mt-0" role="document">
							<!--Content-->
							<div class="modal-content fmb-bg-primary">
								<!--Header-->
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title w-100" id="existingFormModalLabel">Formulaires existants</h4>
								</div>
								<!--Body-->
								<div class="modal-body">
									<div class="list-group">
										<a class="list-group-item list-group-item-action flex-column align-items-start fmb-bg-secondary">
											<div class="d-flex w-100 align-items-start">
												<div class="w-25">
													<small>Date</small>
													<p class="text-truncate m-0">20/03/2017</p>
												</div>
												<div class="w-50 pl-3 pr-3">
													<small>Nom du formulaire</small>
													<p class="text-truncat m-0">Sciences Fondamentales</p>
												</div>
												<div class="d-flex w-25">
													<div class="w-50 text-center"><i v-on:click="modify('Hello')" class="fa fa-pencil fa-3x" aria-hidden="true"></i></div>
													<div class="w-50 text-center"><i class="fa fa-eye fa-3x" aria-hidden="true"></i></div>
												</div>
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Modal -->
					<div class="modal fade scroll mt-0" id="validateFormModal" tabindex="-1" role="dialog" aria-labelledby="validateFormModalLabel" aria-hidden="true">
						<div class="modal-dialog mt-0" role="document">
							<!--Content-->
							<div class="modal-content fmb-bg-primary">
								<!--Header-->
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title w-100 pl-2" id="validateFormModalLabel">Votre formulaire : {{formName}}</h4>
								</div>
								<!--Body-->
								<div class="modal-body">
									<div class="list-group">
										<a class="list-group-item list-group-item-action flex-column align-items-start fmb-bg-secondary">
											<div class="d-flex w-100 justify-content-between">
												<div>
													<small>Date de début</small>
													<p class="text-truncate m-0">{{startDate}}</p>
												</div>
												<div>
													<small>Date d'expiration</small>
													<p class="text-truncate m-0">{{endDate}}</p>
												</div>
												<div>
													<small>Questions</small>
													<p class="text-truncate m-0">{{questions.length}}</p>
												</div>
											</div>
										</a>

										<a v-for="(question, index) in questions" class="list-group-item list-group-item-action flex-column align-items-start fmb-bg-secondary question-list">
											<div class="d-flex w-100 justify-content-between">
												<div>
													<small>N°</small>
													<p class="text-truncate m-0">{{index + 1}}</p>
												</div>
												<div>
													<small>Type</small>
													<p class="text-truncate m-0">{{fmb.FmbQuestionTypesText[question.idType - 1]}}</p>
												</div>
												<div class="validate-question">
													<small>Question</small>
													<p class="m-0">{{question.question}}</p>
												</div>
											</div>
										</a>
									</div>

									<div class="modal-footer justify-content-center pb-0 mt-1">
										<div class="options d-flex">
											<button v-on:click="sendForm()" type="button" class="btn btn-md fmb-btn-primary">
												Envoyer le formulaire
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</jsp:body>

</tag:wrapper>
