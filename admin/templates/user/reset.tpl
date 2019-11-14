{% extends "user/index.tpl" %}


{% block content %}
    <div class="page-center">
        <div class="page-center-in">
            <div class="container-fluid">
                <form class="sign-box" method="post" action="">
                    <header class="sign-title">Reset Password</header>
                    {% if get.code %}
                        <div class="form-group">
                            <input type="password" name="password" class="form-control" placeholder="Password"/>
                            <input type="hidden" name="code" class="form-control" placeholder="Password" value="{{ get.code }}"/>
                        </div>
                    {% else %}
                        <div class="form-group">
                            <input type="text" name="email" class="form-control" placeholder="E-Mail"/>
                        </div>
                    {% endif %}
                    <div class="form-group">
                        <div class="float-left">
                            <a href="{{ globals.uri }}user/login">Log In</a>
                        </div>
                        {% if get.code %}
                            <div class="float-right">
                                <a href="{{ globals.uri }}user/reset">Send Code</a>
                            </div>
                        {% endif %}
                    </div>
                    <button type="submit" class="btn btn-rounded">Reset</button>
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