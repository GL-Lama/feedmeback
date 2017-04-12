let LoginForm = new Vue({
    el: '#login',
    data: {
        username: '',
        password: '',
        isTeacher: false
    },
    methods: {
        submit: function (event) {

            var myHeaders = new Headers();

            myHeaders.append("Content-type", "application/x-www-form-urlencoded");

            var params = {
                method: 'POST',
                headers: myHeaders,
                body: jQuery.param({username: this.username, password: this.password, isTeacher: this.isTeacher}),
                credentials: "include",
                redirect: "follow"
            };

            fetch('/login', params).then(
                res => window.location = "/",
                err => console.log("error", err)
            );
        }
    }
});