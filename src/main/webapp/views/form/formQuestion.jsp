<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<tag:wrapper>

    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="/static/app/form/formQuestion.css"></link>
    </jsp:attribute>

    <jsp:attribute name="scripts">
        <script src="/static/app/form/formQuestion.js"></script>
    </jsp:attribute>

    <jsp:body>
            <div class="card pr-0 pl-0 fmb-bg-primary mt-6 col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-12">
                <div id="formQuestion" class="card-block pr-0 pl-0 pb-0">

                    <p class="fmb-font-title text-center">FEEDMEBACK</p>
                    
                    <i class="fa fa-power-off fmb-btn-logout mt-3 mr-5" aria-hidden="true"></i>

                    <div class="d-flex justify-content-center text-center">
                        <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Cybersécurité #3</p>
                    </div>

                    <%-- 1st question --%>
                    <div v-if="isThisQuestion(0)" class="card-block fmb-card-content">
                        <div class="d-flex justify-content-center text-center">
                            <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Quel est votre ressenti par rapport au cours ?
                            <i v-on:click="incrNbQuestion()" class="fa fa-arrow-circle-right fmb-btn-arrow" aria-hidden="true"></i></p>
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
                        <p class="text-center mt-2 "> 1/5 </p>

                    </div>
                    <%-- end of 1st question --%>

                    <%-- 2nd question --%>
                    <div v-if="isThisQuestion(1)" class="card-block fmb-card-content">
                        <div class="d-flex justify-content-center text-center">
                            <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >
                                <i v-on:click="decrNbQuestion()" class="fa fa-arrow-circle-right fmb-btn-arrow fa-rotate-180 pl-1" aria-hidden="true"></i>
                                Comment vous a paru la difficulté de ce cours ?
                                <i v-on:click="incrNbQuestion()" class="fa fa-arrow-circle-right fmb-btn-arrow" aria-hidden="true"></i>
                            </p>
                        </div>

                        <div class="d-flex justify-content-center text-center">
                            <p class="fmb-border-message fmb-bg-message p-2 pr-4 pl-4" >Difficile</p>
                        </div> 

                        <div class="progress">
                            <div class="progress-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;">
                                <span class="sr-only">80% effectué</span>
                            </div>
                        </div>
                        <p class="text-center mt-2 "> 2/5 </p>
                    </div>
                    <%-- end of 2nd question --%>

                    <%-- 3rd question --%>
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
                        <p class="text-center mt-2 "> 3/5 </p>
                    </div>
                    <%-- end of 2rd question --%>

                    <%-- 4th question --%>
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
                    <%-- end of 4th question --%>

                </div>
            </div>
    </jsp:body>

</tag:wrapper>
