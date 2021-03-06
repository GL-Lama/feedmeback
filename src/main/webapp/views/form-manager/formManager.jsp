<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<tag:wrapper>

	<jsp:attribute name="head">
		<link rel="stylesheet" type="text/css" href="/static/app/form-manager/form-manager/formManager.css"></link>
	</jsp:attribute>

	<jsp:attribute name="scripts">
		<script src="/static/app/form-manager/form-manager/formManager.js"></script>
	</jsp:attribute>

	<jsp:body>
		<div id="formManager" class="card pr-0 pl-0 fmb-bg-primary mt-1 col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-12">
			<div class="card-block pr-0 pl-0 pb-0">
				<p class="fmb-font-title text-center">FEED<span>ME</span>BACK</p>
				<a href="/logout"><i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i></a>

				<div class="card-block fmb-card-contenté">
					<div class="d-flex justify-content-end">
						<p>Poucentage de participation : 95%</p>
					</div>

					<div class="scrollspy-example z-depth-1" data-spy="scroll" data-target="#navbar-example2" data-offset="0">
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
										<div class="w-50 text-center"><i class="fa fa-pencil fa-3x" aria-hidden="true"></i></div>
										<div class="w-50 text-center"><i class="fa fa-eye fa-3x" aria-hidden="true"></i></div>
									</div>
								</div>
							</a>
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
										<div class="w-50 text-center"><i class="fa fa-pencil fa-3x" aria-hidden="true"></i></div>
										<div class="w-50 text-center"><i class="fa fa-eye fa-3x" aria-hidden="true"></i></div>
									</div>
								</div>
							</a>
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
										<div class="w-50 text-center"><i class="fa fa-pencil fa-3x" aria-hidden="true"></i></div>
										<div class="w-50 text-center"><i class="fa fa-eye fa-3x" aria-hidden="true"></i></div>
									</div>
								</div>
							</a>
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
										<div class="w-50 text-center"><i class="fa fa-pencil fa-3x" aria-hidden="true"></i></div>
										<div class="w-50 text-center"><i class="fa fa-eye fa-3x" aria-hidden="true"></i></div>
									</div>
								</div>
							</a>
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
										<div class="w-50 text-center"><i class="fa fa-pencil fa-3x" aria-hidden="true"></i></div>
										<div class="w-50 text-center"><i class="fa fa-eye fa-3x" aria-hidden="true"></i></div>
									</div>
								</div>
							</a>
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
										<div class="w-50 text-center"><i class="fa fa-pencil fa-3x" aria-hidden="true"></i></div>
										<div class="w-50 text-center"><i class="fa fa-eye fa-3x" aria-hidden="true"></i></div>
									</div>
								</div>
							</a>
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
										<div class="w-50 text-center"><i class="fa fa-pencil fa-3x" aria-hidden="true"></i></div>
										<div class="w-50 text-center"><i class="fa fa-eye fa-3x" aria-hidden="true"></i></div>
									</div>
								</div>
							</a>
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
										<div class="w-50 text-center"><i class="fa fa-pencil fa-3x" aria-hidden="true"></i></div>
										<div class="w-50 text-center"><i class="fa fa-eye fa-3x" aria-hidden="true"></i></div>
									</div>
								</div>
							</a>
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
										<div class="w-50 text-center"><i class="fa fa-pencil fa-3x" aria-hidden="true"></i></div>
										<div class="w-50 text-center"><i class="fa fa-eye fa-3x" aria-hidden="true"></i></div>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>






	</jsp:body>

</tag:wrapper>