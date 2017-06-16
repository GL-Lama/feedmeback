let teacher = new Vue({
	el: '#teacher',
	data: {},
	methods: {
		modify: function (formName) {
			console.log("YAY ", formName);
		},
		getDate: function (timestamp) {
			let date = new Date(timestamp * 1000);
			var jour = date.getDate();
			var mois = date.getMonth();
			var annee = date.getFullYear();
			return (jour + "/" + mois + "/" + annee);
		}
	}
});
