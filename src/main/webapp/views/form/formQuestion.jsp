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
            <div class="card pr-0 pl-0 fmb-bg-primary mt-6 col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-12">
                <div id="formQuestion" class="card-block pr-0 pl-0 pb-0">

                    <p class="fmb-font-title text-center">FEED<span>ME</span>BACK</p>

                    <a href="/logout"><i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i></a>

                    <div class="d-flex justify-content-center text-center">
                        <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Cybersécurité #3</p>
                    </div>

                    <%-- Questions --%>
                    <c:forEach items="${formModel.questions}" var="question" varStatus="loop">
                        <div v-if="isThisQuestion(${loop.index})" class="card-block fmb-card-content">
                            <div class="d-flex justify-content-center text-center">
                                <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >${question.question}</p>
                            </div>

                            <%--if ${question.idType} == 1--%>
                            <%-- Question de type smiley (type 1) --%>

                            <div v-if="${question.idType} === 1">
                                <form class="d-flex justify-content-around">
                                    <label for="smiley-1"><img src="/static/pictures/graySmiley/smiley-1.png"></label>
                                    <input type="radio" name="smiley" id="smiley-1" value="smiley-1" class='smiley'>

                                    <label for="smiley0"><img src="/static/pictures/graySmiley/smiley0.png"></label>
                                    <input type="radio" name="smiley" id="smiley0" value="smiley0" class='smiley'>

                                    <label for="smiley+1"><img src="/static/pictures/graySmiley/smiley+1.png"></label>
                                    <input type="radio" name="smiley" id="smiley+1" value="smiley+1" class='smiley'>
                                </form>
                            </div>

                            <%--if ${question.idType} == 2--%>
                            <%-- Question de type jauge (type 2) --%>

                            <div v-if="${question.idType} === 2">
                                <div class="d-flex justify-content-center text-center">
                                    <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" v-text="getTextDifficulty"></p>
                                </div>

                                <input class="w-100" type="range" min="0" max="100" step="1" v-model="value">--%>
                            </div>

                            <%--if ${question.idType} == 3 --%>
                            <%-- Question de type QCM (type 3) --%>
                            
                            <div v-if="${question.idType} === 3">
                                <div class="row d-flex justify-content-center text-center">
                                    <div class="d-flex justify-content-center text-center col-lg-4">
                                        <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Trop de théorie pas assez de pratique</p>
                                    </div>

                                    <div class="d-flex justify-content-center text-center col-lg-4">
                                        <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Un équilibre parfait</p>
                                    </div>
                                </div>


                                <div class="row d-flex justify-content-center text-center">
                                    <div class="d-flex justify-content-center text-center col-lg-4">
                                        <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Peu de contenu théorique</p>
                                    </div>
                                    <div class="d-flex justify-content-center text-center col-lg-4">
                                        <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >La réponse D</p>
                                    </div>
                                </div>
                            </div>

                            <%--if ${question.idType} == 4 --%>
                            <%-- Question de type Oui/Non (type 4) --%>
                            
                            <div v-if="${question.idType} === 4" class="row d-flex justify-content-center text-center">
                                <div class="d-flex justify-content-center text-center col-lg-3">
                                    <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >OUI</p>
                                </div>

                                <div class="d-flex justify-content-center text-center col-lg-3">
                                    <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >NON</p>
                                </div>
                            </div>
                            
                            <%--if ${question.idType} == 5--%>
                            <%-- Question de type libre (type 5) --%>

                            <div v-if="${question.idType} === 5" class="row d-flex justify-content-center text-center">

                                <div class="d-flex justify-content-center text-center ">
                                    <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Un cours passionnant, dommage que certains élèves bavardaient durant vos explications ...</p>
                                </div>

                                <div class="text-center mx-auto">
                                    <a href="/"><button class="fmb-btn-primary fmb-font-sm btn">Terminer</button></a>
                                </div>

                            </div>

                        </div>
 
                    </c:forEach>


                    <div class="d-flex justify-content-between p-3">
                        <i v-on:click="decrNbQuestion()" class="fa fa-arrow-circle-left fmb-btn-arrow fa-3x " aria-hidden="true"></i>
                        <div class=" compteur text-center m-0 align-self-center"> {{nbQuestion + 1}}/${formModel.questions.size()} </div>
                        <i v-on:click="incrNbQuestion(${formModel.questions.size()})" class="fa fa-arrow-circle-right fmb-btn-arrow fa-3x" aria-hidden="true"></i>
                    </div>

                    <%--<div v-if="isThisQuestion(0)" class="card-block fmb-card-content">
                        <div class="d-flex justify-content-center text-center">
                            <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Quel est votre ressenti par rapport au cours ?
                            
                        </div>

                        <div>
                            <form class="d-flex justify-content-around">
                                <label for="smiley-1"><img src="/static/pictures/graySmiley/smiley-1.png"></label>
                                <input type="radio" name="smiley" id="smiley-1" value="smiley-1" class='smiley'>

                                <label for="smiley0"><img src="/static/pictures/graySmiley/smiley0.png"></label>
                                <input type="radio" name="smiley" id="smiley0" value="smiley0" class='smiley'>

                                <label for="smiley+1"><img src="/static/pictures/graySmiley/smiley+1.png"></label>
                                <input type="radio" name="smiley" id="smiley+1" value="smiley+1" class='smiley'>
                            </form>
                        </div>
                    </div>

                    <div v-if="isThisQuestion(1)" class="card-block fmb-card-content">
                        <div class="d-flex justify-content-center text-center">
                            <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >
                                <i v-on:click="decrNbQuestion()" class="fa fa-arrow-circle-right fmb-btn-arrow fa-rotate-180 pl-1" aria-hidden="true"></i>
                                Comment vous a paru la difficulté de ce cours ?
                                <i v-on:click="incrNbQuestion()" class="fa fa-arrow-circle-right fmb-btn-arrow" aria-hidden="true"></i>
                            </p>
                        </div>

                        <div class="d-flex justify-content-center text-center">
                            <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" v-text="getTextDifficulty"></p>
                        </div>

                        <input class="w-100" type="range" min="0" max="100" step="1" v-model="value"> 
                    </div>

                    <div v-if="isThisQuestion(2)" class="card-block fmb-card-content">
                        <div class="d-flex justify-content-center text-center">
                            <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >
                            <i v-on:click="decrNbQuestion()" class="fa fa-arrow-circle-right fmb-btn-arrow fa-rotate-180 pl-1" aria-hidden="true"></i>
                            Parmis ces 4 propositions, laquelle decrirait le mieux ce cours ?
                            <i v-on:click="incrNbQuestion()" class="fa fa-arrow-circle-right fmb-btn-arrow" aria-hidden="true"></i></p>
                        </div>

                        <div class="row d-flex justify-content-center text-center">
                            <div class="d-flex justify-content-center text-center col-lg-4">
                                <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Trop de théorie pas assez de pratique</p>
                            </div>

                            <div class="d-flex justify-content-center text-center col-lg-4">
                                <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Un équilibre parfait</p>
                            </div>
                        </div>


                        <div class="row d-flex justify-content-center text-center">
                            <div class="d-flex justify-content-center text-center col-lg-4">
                                <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Peu de contenu théorique</p>
                            </div>

                            <div class="d-flex justify-content-center text-center col-lg-4">
                                <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >La réponse D</p>
                            </div>
                        </div>
                    </div>

                    <div v-if="isThisQuestion(3)" class="card-block fmb-card-content">
                        <div class="d-flex justify-content-center text-center">
                            <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >
                            <i v-on:click="decrNbQuestion()" class="fa fa-arrow-circle-right fmb-btn-arrow fa-rotate-180 pl-1" aria-hidden="true"></i>
                            Cette matière vous paraît-elle importante ?
                            <i v-on:click="incrNbQuestion()" class="fa fa-arrow-circle-right fmb-btn-arrow" aria-hidden="true"></i></p>
                        </div>

                        <div class="row d-flex justify-content-center text-center">
                            <div class="d-flex justify-content-center text-center col-lg-3">
                                <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >OUI</p>
                            </div>

                            <div class="d-flex justify-content-center text-center col-lg-3">
                                <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >NON</p>
                            </div>
                        </div>
                        <p class="text-center mt-2 "> 4/5 </p>
                    </div>

                     <div v-if="isThisQuestion(4)" class="card-block fmb-card-content">

                        <div class="d-flex justify-content-center text-center">
                            <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >
                            <i v-on:click="decrNbQuestion()" class="fa fa-arrow-circle-right fmb-btn-arrow fa-rotate-180 pl-1" aria-hidden="true"></i>
                            Avez-vous quelconques remarques concernant ce cours ?
                            <i v-on:click="incrNbQuestion()" class="fa fa-arrow-circle-right fmb-btn-arrow" aria-hidden="true"></i></p>
                        </div>

                        <div class="row d-flex justify-content-center text-center">

                            <div class="d-flex justify-content-center text-center ">
                                <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Un cours passionnant, dommage que certains élèves bavardaient durant vos explications ...</p>
                            </div>

                            <div class="text-center mx-auto">
                                <a href="/"><button class="fmb-btn-primary fmb-font-sm btn">Terminer</button></a>
                            </div>

                        </div>
                    </div>

                    <div v-if="isThisQuestion(5)" class="card-block fmb-card-content">

                        <div class="row d-flex justify-content-center text-center">

                            <div class="d-flex justify-content-center text-center ">
                                <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" > Nous vous remercions de votre participation.</p>
                            </div>

                        </div>
                    </div>--%>

                </div>
            </div>
    </jsp:body>

</tag:wrapper>
