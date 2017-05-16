let inputs = new Vue({
  el: '#inputs',
  data: {
    students: [ {index: 0, name: ""} ]
  },
  methods: {
      newInput: function (index) {
          console.log(this.students);
        if (this.students.length == index + 1) {
            this.students.push({index: index + 1, name: ""});
            setTimeout(() => {
                $("#student-"  + (index + 1)).focus();
            }, 100);
        }
      },

      deleteInput: function(index) {
          if(this.students.length >1 && this.students[index].name === "" ){
            this.students.splice(index,1);
            setTimeout(() => {
                $("#student-"  + (index - 1)).focus();
            }, 100);
          }

      }
  }
});