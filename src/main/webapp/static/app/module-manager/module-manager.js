let moduleManager = new Vue({
	el: '#searchModule',
	data: {
		moduleQuery: '',
		modules: []
	},
	computed:  {},
	watch: {
		moduleQuery: function(val, oldVal) {
			console.log(val, oldVal);

			var myHeaders = new Headers();

			myHeaders.append("Content-type", "application/x-www-form-urlencoded");

			var params = {
				method: 'POST',
				headers: myHeaders,
				body: jQuery.param({moduleName: this.moduleQuery}),
				credentials: "include",
				redirect: "follow"
			};

			if (val.length >= 3)
				fetch('/moduleManager/searchModule', params).then(
					res => res.json(),
					err => { throw err; }
				).then(
					res => { console.log(decodeURIComponent(res[0].name)); this.modules = res; },
					err => console.log("error", err)
				);
		},
	},
	methods: {
		joinModule: function(idModule) {
			console.log(idModule);

			var myHeaders = new Headers();

			myHeaders.append("Content-type", "application/x-www-form-urlencoded");

			var params = {
				method: 'POST',
				headers: myHeaders,
				body: jQuery.param({idModule: idModule}),
				credentials: "include",
				redirect: "follow"
			};


			fetch('/moduleManager/joinModule', params).then(
				res => console.log(res),//window.location = "/moduleManager",
				err => console.log(err)
			);
		}
	}




});