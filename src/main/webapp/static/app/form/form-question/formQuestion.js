new Vue({
  el: '#formQuestion',
  data: {
    nbQuestion: 0,
    nbProposition: 0,
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

      incrNbQuestion: function(max) {
          if (this.nbQuestion < max - 1)
            this.nbQuestion++;
      },

      decrNbQuestion: function() {
        if (this.nbQuestion > 0)
          this.nbQuestion--;
      },

      isThisProposition: function(nb) {
        return nb == this.nbProposition;
      },

      incrNbProposition: function(max) {
          if (this.nbProposition < max - 1)
            this.nbProposition++;
      },

      decrNbProposition: function() {
        if (this.nbProposition > 0)
          this.nbProposition--;
      }
  }
});