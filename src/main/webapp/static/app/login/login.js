let LoginForm = new Vue({
    el: '#login',
    data: {
        username: '',
        password: '',
        isTeacher: false
    },
    computed:  {
        isNotTeacher: {
            get() {
                return !this.isTeacher;
            }
        }
    },
    methods: {
        selectStudent(event) {
            if (this.isTeacher)
                this.isTeacher = false;
        },
        selectTeacher(event) {
            if (this.isNotTeacher)
                this.isTeacher = true;
        },
        submit(event) {

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