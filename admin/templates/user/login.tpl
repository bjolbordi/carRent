{% extends "user/index.tpl" %}


{% block content %}
    <div class="page-center">
        <div class="page-center-in">
            <div class="container-fluid">
                <form class="sign-box" method="post" action="{{ globals.uri }}user/login">
                    <div class="sign-avatar">
                        <img src="{{ constants.URL }}templates/assets/img/avatar-sign.png" alt="">
                    </div>
                    <header class="sign-title">Sign In</header>
                    <div class="form-group">
                        <input type="text" name="username" class="form-control" placeholder="E-Mail or Username"/>
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" placeholder="Password"/>
                    </div>
                    <div class="form-group">
                        <div class="checkbox float-left hidden">
                            <input type="checkbox" id="signed-in"/>
                            <label for="signed-in">Keep me signed in</label>
                        </div>
                        <div class="float-right reset">
                            <a href="{{ globals.uri }}user/reset">Reset Password</a>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-rounded">Sign in</button>
                    {% if message %}
                        <div class="alert alert-info text-center">
                            <strong>Message! </strong>
                            <div>{{ message }}</div>
                        </div>
                    {% endif %}
                </form>
            </div>
        </div>
    </div><!--.page-center-->
{% endblock %}