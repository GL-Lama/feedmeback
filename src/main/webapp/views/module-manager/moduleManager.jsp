<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="teacher" class="servlet.models.TeacherModel" scope="request"/>

<tag:wrapper>

	<jsp:attribute name="head">
		<link rel="stylesheet" type="text/css" href="/static/app/module-manager/module-manager.css"></link>
	</jsp:attribute>

	<jsp:attribute name="scripts">
		<script src="/static/app/module-manager/module-manager.js"></script>
	</jsp:attribute>

	<jsp:body>

		<div class="card pr-0 pl-0 fmb-bg-primary mt-1 col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-12">
			<div id="moduleManager" class="card-block pr-0 pl-0 pb-0">
				<p class="fmb-font-title text-center">FEED<span>ME</span>BACK</p>
				<a href="/logout"><i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i></a>
				<a href="/"><i class="fa fa-arrow-circle-left fmb-btn-previous mt-3 ml-4" aria-hidden="true"></i></a>

				<div class="d-flex justify-content-center ">
					<p class="fmb-bg-message fmb-border-message text-center pl-4 pr-4 p-1">Gestionnaire de modules<p>
				</div>

				<div class="card-block fmb-card-content">

					<div class="d-flex justify-content-center title-box ">
						<a href="/moduleManager/newModule"><button type="button" class="btn fmb-btn-primary mb-1 bt-1 mt-0 fmb-border-new"><i class="fa fa-plus pr-3 "></i>Créer un nouveau module</button></a>
					</div>

					<c:if test = "${teacher.modules.size() == 0}">
						<div class="d-flex justify-content-center">
							<p>Vous n'avez pas encore créé de modules... Essayez d'en créer un en cliquant sur le bouton du dessus ! ;)<p>
						</div>
					</c:if>

					<div class="d-flex flex-wrap p-3 mb-1">
						<c:forEach items="${teacher.modules}" var="module">
							<div class="w-50">
								<a href="/moduleManager/viewModule?idModule=${module.idModule}"><button type="button" class="btn fmb-bg-secondary mb-1 bt-1 mt-0 fmb-border-new"><c:out value="${module.name}"/></button></a>
							</div>
						</c:forEach>
					</div>

					<!--Footer-->
					<div class="modal-footer">
						<div class="options d-flex justify-content-end">
							<button type="button" class="btn fmb-btn-primary fmb-bg-message fmb-border-message text-center" data-toggle="modal" data-target="#searchModule">
								Rechercher un module
							</button>
						</div>

					</div>

					<!-- Modal -->
					<div class="modal fade scroll" id="searchModule" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<!--Content-->
							<div class="modal-content fmb-bg-primary">
								<!--Header-->
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title w-100 pl-2" id="myModalLabel">Rechercher un module :</h4>
								</div>

								<!--Body-->
								<div class="modal-body">
									<div class="md-form">
										<i class="fa fa-search prefix"></i>
										<input type="text" id="form2" class="form-control mySelect" v-model="moduleQuery">
										<label for="form2">Module name</label>
									</div>


									<div class="list-group fmb-border-item">
										<a v-for="module in modules" class="list-group-item align-items-start fmb-bg-message ">
											<div class="align-self-center">
												{{ module.name }}
											</div>
											<div class="d-flex ml-auto">
												<i v-if="module.sub" class="fa fa-check fa-2x" aria-hidden="true"></i>
												<i v-else  class="fa fa-plus fa-2x" aria-hidden="true" data-toggle="modal" data-target="#basicExample"></i>
											</div>

											<!-- Modal -->
											<div class="modal fade" id="basicExample" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												<div class="modal-dialog" role="document">
													<!--Content-->
													<div class="modal-content fmb-bg-primary">
														<!--Header-->
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<%--<h4 class="modal-title w-100" id="myModalLabel">Modal title</h4>--%>
														</div>
														<!--Body-->
														<div class="modal-body">
															Etes-vous sûr de rejoindre ce module ?
														</div>
														<!--Footer-->
														<div class="modal-footer">

															<button v-on:click="joinModule(module.idModule)" type="button" class="btn btn-primary">Oui</button>
															<button type="button" class="btn btn-primary">Non</button>
														</div>
													</div>
													<!--/.Content-->
												</div>
											</div>
											<!-- Modal -->
										</a>
									</div>
							   </div>
						</div>
					</div>

				</div>
			</div>
		</div>

	</jsp:body>

</tag:wrapper>