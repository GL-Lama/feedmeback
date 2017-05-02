// var nbQuestion = 2;

// for (i=0; i<nbQuestion; i++){
//     var app1 = new Vue({
//         el: '#app-' + i,
//         data: {
//         seen: true
//         }
//     })
// }

new Vue({
  el: '#formQuestion',
  data: {
    nbQuestion: 0
  },
  methods: {
      isThisQuestion: function(nb) {
        return nb == this.nbQuestion;
      },

      incrNbQuestion: function() {
          this.nbQuestion++;
      },

      decrNbQuestion: function() {
          this.nbQuestion--;
      }
  }
})