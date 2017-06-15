<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="formModel" class="servlet.models.FormModel" scope="request"/>

<tag:wrapper>

    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="/static/app/form/form-question/formQuestion.css"></link>
    </jsp:attribute>

    <jsp:attribute name="scripts">
        <script src="/static/app/form/form-question/formQuestion.js"></script>
    </jsp:attribute>

    <jsp:body>
            <div class="card pr-0 pl-0 fmb-bg-primary mt-1 col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-12">
                <div id="formQuestion" class="card-block pr-0 pl-0 pb-0">

                    <p class="fmb-font-title text-center">FEED<span>ME</span>BACK</p>

                    <a href="/logout"><i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i></a>

                    <div class="d-flex justify-content-center text-center">
                        <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >${formModel.form.name}</p>
                        <%--<p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Cybersécurité</p>--%>
                    </div>

                    <form method="post" action="">
                        <%-- Questions --%>
                        <c:forEach items="${formModel.questions}" var="question" varStatus="loop">
                            <div v-if="isThisQuestion(${loop.index})" class="card-block fmb-card-content">
                                <div class="d-flex justify-content-center text-center">
                                    <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >${question.question}</p>
                                </div>

                                <%-- Question de type smiley (type 1) --%>

                                <div v-if="${question.idType} === 1">
                                    <div class="d-flex justify-content-around">
                                        <label for="smiley-1"><img src="/static/pictures/graySmiley/smiley-1.png" id="img-smiley-1"></label>
                                        <input v-on:click="changeSmiley('-1')" type="radio" name="smiley" id="smiley-1" value="smiley-1" class="proposition">

                                        <label for="smiley0"><img src="/static/pictures/graySmiley/smiley0.png" id="img-smiley0"></label>
                                        <input v-on:click="changeSmiley('0')" type="radio" name="smiley" id="smiley0" value="smiley0" class="proposition">

                                        <label for="smiley+1"><img src="/static/pictures/graySmiley/smiley+1.png" id="img-smiley+1"></label>
                                        <input v-on:click="changeSmiley('+1')"type="radio" name="smiley" id="smiley+1" value="smiley+1" class="proposition">
                                    </div>
                                </div>

                                <%-- Question de type jauge (type 2) --%>

                                <div v-if="${question.idType} === 2">
                                    <div class="d-flex justify-content-center text-center">
                                        <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" v-text="getTextDifficulty"></p>
                                    </div>

                                    <input class="w-100" type="range" min="0" max="100" step="1" v-model="value">
                                </div>

                                <%-- Question de type QCM (type 3) --%>

                                <div v-if="${question.idType} === 3">
                                    <%-- Propositions --%>
                                    <div class="d-flex flex-wrap">
                                        <c:forEach items="${formModel.getPropositions(loop.index)}" var="proposition" varStatus="loopProp">
                                            <div class="card-block fmb-card-content col-md-6 w-50">
                                                <label for="${proposition.numProposition}" class="w-100">
                                                    <input type="radio" name="proposition" id="${proposition.numProposition}" value="${proposition.proposition}" class="proposition">
                                                    <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4 lol w-100" >${proposition.proposition}</p>
                                                </label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>

                                <%-- Question de type Oui/Non (type 4) --%>

                                <div v-if="${question.idType} === 4" class="row d-flex justify-content-center text-center">
                                    <div class="d-flex justify-content-center text-center col-lg-3">
                                        <label for="oui">
                                            <input type="radio" name="ouinon" id="oui" value="oui" class="proposition">
                                            <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >OUI</p>
                                        </label>
                                    </div>

                                    <div class="d-flex justify-content-center text-center col-lg-3">
                                        <label for="non">
                                            <input type="radio" name="ouinon" id="non" value="non" class="proposition">
                                            <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >NON</p>
                                        </label>
                                    </div>
                                </div>

                                <%-- Question de type libre (type 5) --%>

                                <div v-if="${question.idType} === 5" class="row d-flex justify-content-center text-center">
                                    <div class="d-flex flex-column">
                                        <div class="p-2 d-flex justify-content-center text-center">
                                            <div class="fmb-border-message fmb-bg-message p-2 pt-2 pr-4">
                                                <div class="md-form">
                                                    <i class="fa fa-pencil prefix"></i>
                                                    <input type="text" id="form8" class="md-textarea"/>
                                                    <label for="form8">Votre réponse</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="p-2 text-center mx-auto">
                                            <label for="submit">
                                                <a href="/"><button class="fmb-btn-primary fmb-font-sm btn">Terminer</button></a>
                                            </label>
                                            <input type="submit" id="submit" value="Submit" class="proposition">
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>

                        <div class="d-flex justify-content-between p-3">
                            <!--<div v-if="{{nbQuestion}} !== 0">
                                {{nbQuestion}}
                                ${formModel.questions.size()}-->
                                <i v-on:click="decrNbQuestion()" class="fa fa-arrow-circle-left fmb-btn-arrow fa-3x " aria-hidden="true"></i>
                            <!--</div>-->
                            <div class=" compteur text-center m-0 align-self-center"> {{nbQuestion + 1}}/${formModel.questions.size()} </div>
                            <i v-on:click="incrNbQuestion(${formModel.questions.size()})" class="fa fa-arrow-circle-right fmb-btn-arrow fa-3x" aria-hidden="true"></i>
                        </div>
                    </form>
                </div>
            </div>
    </jsp:body>

</tag:wrapper>
