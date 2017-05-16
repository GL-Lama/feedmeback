new Vue({
  el: '#formQuestion',
  data: {
    nbQuestion: 0,
    value: 50
  },


  computed: {
      getTextDifficulty: function () {
        if (this.value < 30){
          return ("facile");
        }

       else if (this.value > 31 && this.value < 70) {
          return ("moyen");
        }

        else {
          return ("difficile");
        }

      }
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
});