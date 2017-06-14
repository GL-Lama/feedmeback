$( function() {
    $( "#datepicker" ).datepicker();
} );

let newForm = new Vue({
  el: '#newForm',
  data: {
      currentState: 0,
      nbStates: 3
  },

  computed: {},

  methods: {
      isThisState: function(nb) {
        return nb == this.currentState;
      },

      incrCurrentState: function() {
          if (this.currentState < this.nbStates - 1)
            this.currentState++;
      },

      decrCurrentState: function() {
        if (this.currentState > 0)
          this.currentState--;
      }
  }
});