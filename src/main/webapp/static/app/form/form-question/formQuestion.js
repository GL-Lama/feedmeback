new Vue({
	el: '#formQuestion',
	data: {
		nbQuestion: 0,
		nbProposition: 0,
		value: 50,
		smileys: ["graySmiley", "graySmiley", "graySmiley"]
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

		isThisEnd: function(max) {
			return this.nbQuestion + 1 == max;
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
		},

		changeSmiley: function(index) {
			let image1 = document.getElementById('img-smiley-1');
			image1.src = "/static/pictures/graySmiley/smiley-1.png";
			let image2 = document.getElementById('img-smiley0');
			image2.src = "/static/pictures/graySmiley/smiley0.png";
			let image3 = document.getElementById('img-smiley+1');
			image3.src = "/static/pictures/graySmiley/smiley+1.png";

			let image = document.getElementById('img-smiley' + index);
			image.src = "/static/pictures/yellowSmiley/smiley" + index + ".png";
		}
	}
});