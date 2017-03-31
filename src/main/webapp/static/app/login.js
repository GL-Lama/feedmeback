let LoginForm = new Vue({
    el: '#login',
    data: {
        username: '',
        password: ''
    },
    methods: {
        submit: function (event) {

            var xhr = new XMLHttpRequest();
            xhr.open("POST", '/login', true);

            //Send the proper header information along with the request
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function() {//Call a function when the state changes.
                if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200)
                    console.log("ended");
            }

            let params = jQuery.param({username: this.username, password: this.password});

            xhr.send();
        }
    }
});