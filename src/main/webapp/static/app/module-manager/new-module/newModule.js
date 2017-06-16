let newModule = new Vue({
	el: '#newModule',
	data: {
		moduleName: "",
		students: [ {index: 0, name: ""} ]
	},
	methods: {
		newInput: function (index) {
			console.log(this.students);
			if (this.students.length == index + 1) {
				this.students.push({index: index + 1, name: ""});
				setTimeout(() => {
					$("#student-"+ (index + 1)).focus();
				}, 100);
			}
		},

		deleteInput: function(index) {
			if(this.students.length > 1 && this.students[index].name === "" ){
				this.students.splice(index, 1);

				for (let i = 0; i < this.students.length; i++)
					this.students[i].index = i;

				setTimeout(() => {
					$("#student-"+ (index - 1)).focus();
				}, 100);
			}

		},

		addModule: function() {

			var myHeaders = new Headers();

			myHeaders.append("Content-type", "application/x-www-form-urlencoded");

			var params = {
				method: 'POST',
				headers: myHeaders,
				body: jQuery.param({moduleName: this.moduleName, students: JSON.stringify(this.students)}),
				credentials: "include",
				redirect: "follow"
			};

			if (this.moduleName != "")
				fetch('/moduleManager/addModule', params).then(
					res => res.json(),
					err => err
				).then(
					res => window.location = '/moduleManager/moduleConfirm?idModule=' + res.idModule,
					err => err
				);
		}
	}
});