$( function() {
	$('#datepickerStart').datepicker();
	$('#datepickerEnd').datepicker();
});

let newForm = new Vue({
	el: '#newForm',
	data: {
		fmb: fmb,
		currentState: 0,
		nbStates: 2,
		formName: '',
		startDate: '',
		endDate: '',
		idModule: '',
		questions: [
			{
				idType: fmb.FmbQuestionTypeSmiley,
				question: 'Quel est votre ressenti par rapport au cours ?',
				props: ['', '', '', '']
			}
		]
	},
	mounted() {
		$('#datepickerStart').on(
			'input change', () => { this.startDate = $('#datepickerStart').val() }
		);

		$('#datepickerEnd').on(
			'input change', () => { this.endDate = $('#datepickerEnd').val() }
		);
	},

	computed: {},

	methods: {
		isThisState: function(nb) {
			return nb == this.currentState;
		},

		isEndState: function() {
			return this.currentState + 1 == this.nbStates;
		},

		incrCurrentState: function() {
			if (this.currentState < this.nbStates - 1)
				this.currentState++;
			console.log(this.questions)
		},

		addQuestion: function() {
			this.questions.push({
				idType: fmb.FmbQuestionTypeSmiley,
				question: '',
				props: ['', '', '', '']
			});
			this.currentState++;
			this.nbStates++;
		},

		decrCurrentState: function() {
			if (this.currentState > 0)
				this.currentState--;
		},

		isType: function(index, type) {
			return this.questions[index].idType == type;
		},

		deleteQuestion: function(index) {
			this.questions.splice(index, 1);
			this.currentState -=1;
			this.nbStates -=1;
		},

		checkForm: function() {

			if (!this.formName)
				return false;

			if (!this.startDate)
				return false;

			if (!this.endDate)
				return false;

			if (!this.idModule)
				return false;

			if (this.questions.length == 0)
				return false;

			for (let i = 0; i < this.questions.length; i++) {

				let question = this.questions[i];

				if (!question.question)
					return false;

				if (!question.idType)
					return false;

				let nbEmpty = 0;

				for (let j = 0; j < question.props; j++) {
					if (!question.props[j])
						nbEmpty ++;
				}

				console.log("NBEMPTY", nbEmpty);

				if (question.idType != fmb.FmbQuestionTypeMCQ)
					question.props = ['', '', '', ''];

				if (question.idType == fmb.FmbQuestionTypeMCQ && nbEmpty > 2)
					return false;

				return true;
			}

			return true;
		},

		convertDate: function(_date) {
			let temp = _date.split("/");
			return new Date(temp[2], parseInt(temp[0]) - 1, parseInt(temp[1])).getTime() / 1000;
		},

		sendForm: function() {

			if (!this.checkForm())
				return;

			var myHeaders = new Headers();

			myHeaders.append("Content-type", "application/x-www-form-urlencoded");

			var params = {
				method: 'POST',
				headers: myHeaders,
				body: jQuery.param({
					formName: this.formName,
					startDate: this.convertDate(this.startDate),
					endDate: this.convertDate(this.endDate),
					idModule: this.idModule,
					questions: JSON.stringify(this.questions)
				}),
				credentials: "include",
				redirect: "follow"
			};

			fetch('/form/addForm', params).then(
				res => {
					if (res.status == 200)
						window.location = "/"
				},
				err => console.log("addForm err", err)
			);
		}
	}
});