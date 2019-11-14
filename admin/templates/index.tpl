<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Admin</title>

    <link href="{{ constants.URL }}templates/assets/img/favicon.png" rel="icon" type="image/png">
    <link rel="stylesheet" href="{{ constants.URL }}templates/assets/css/lib/font-awesome/font-awesome.min.css">
    <link rel="stylesheet" href="{{ constants.URL }}templates/assets/css/lib/bootstrap-sweetalert/sweetalert.css">
    <link rel="stylesheet" href="{{ constants.URL }}templates/assets/css/lib/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="{{ constants.URL }}templates/assets/css/lib/jqueryui/jquery-ui.min.css">
    <link rel="stylesheet" href="{{ constants.URL }}templates/assets/css/less-space.css">
    <link rel="stylesheet" href="{{ constants.URL }}templates/assets/css/main.css">
    <link rel="stylesheet" href="{{ constants.URL }}templates/assets/css/custom.css">
    {% block head %}
    {% endblock head %}
    <script>
        var ADMIN_URL = '{{ constants.URL }}';
        var SITE_URL = '{{ constants.SITE_URL }}';
        var LANG = '{{ globals.lang.code }}';
        var LANG_ID = '{{ globals.lang.id }}';
    </script>
</head>
<body class="with-side-menu">
{% block header %}

{% endblock header %}
<header class="site-header">
    <div class="container-fluid">
        <a href="{{ globals.uri }}" class="site-logo">
            <img class="hidden-md-down" src="{{ constants.URL }}templates/assets/img/logo-2.png" alt="">
            <img class="hidden-lg-up" src="{{ constants.URL }}templates/assets/img/logo-2-mob.png" alt=""></a>
        <button class="hamburger hamburger--htla">
            <span>toggle menu</span>
        </button>
        <div class="site-header-content">
            <div class="site-header-content-in">
                <div class="site-header-shown">
                    <div class="dropdown user-menu">
                        <button class="dropdown-toggle" id="dd-user-menu" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="{{ constants.URL }}templates/assets/img/avatar-2-64.png" alt=""></button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dd-user-menu">
                            <a class="dropdown-item" href="{{ constants.SITE_URL }}" target="_blank">
                                <span class="font-icon glyphicon glyphicon-globe"></span>
                                Preview
                            </a>
                            <a class="dropdown-item" href="{{ globals.uri }}user/logout/">
                                <span class="font-icon glyphicon glyphicon-log-out"></span>
                                Logout
                            </a>
                        </div>
                    </div>
                    <!-- <button type="button" class="burger-right"><i class="font-icon-menu-addl"></i> -->
                    </button>
                </div>
                <!--.site-header-shown-->
                <div class="mobile-menu-right-overlay"></div>
            </div>
            <!--site-header-content-in-->
        </div>
        <!--.site-header-content-->
    </div>
    <!--.container-fluid-->
</header>
<!--.site-header-->
<div class="mobile-menu-left-overlay"></div>
<nav class="side-menu">
    <ul class="side-menu-list">
        {% for menuId in menu.parents[0] %}
            <li class="blue">
                <a href="{{ globals.uri }}{{ menu.items[menuId].alias }}"> <i class="fa {{ menu.items[menuId].icon }}"></i>
                    <span class="lbl">{{ menu.items[menuId].title }}</span>
                </a>
            </li>
            {% for ChildId in menu.parents[menu.items[menuId].id] %}
                <li class="blue">
                    <a href="{{ globals.uri }}{{ menu.items[ChildId].alias }}"> <i class="fa {{ menu.items[ChildId].icon }}"></i>
                        <span class="lbl">{{ menu.items[ChildId].title }}</span>
                    </a>
                </li>
            {% endfor %}
        {% endfor %}

    </ul>
</nav>
<!--.side-menu-->
{% block content %}

{% endblock content %}
<!--.page-content-->
<script src="{{ constants.URL }}templates/assets/js/lib/jquery/jquery.min.js"></script>
<script src="{{ constants.URL }}templates/assets/js/lib/tether/tether.min.js"></script>
<script src="{{ constants.URL }}templates/assets/js/lib/bootstrap/bootstrap.min.js"></script>
<script src="{{ constants.URL }}templates/assets/js/lib/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="{{ constants.URL }}templates/assets/js/plugins.js"></script>
<script src="{{ constants.URL }}templates/assets/js/lib/bootstrap-select/bootstrap-select.min.js"></script>
<script src="{{ constants.URL }}templates/assets/js/lib/select2/select2.full.min.js"></script>
<script src="{{ constants.URL }}templates/assets/js/lib/jquery-tag-editor/jquery.caret.min.js"></script>
<script src="{{ constants.URL }}templates/assets/js/lib/jquery-tag-editor/jquery.tag-editor.js"></script>
<script src="{{ constants.URL }}templates/assets/js/lib/bootstrap-sweetalert/sweetalert.min.js"></script>
<script src="{{ constants.URL }}templates/assets/js/lib/html5-form-validation/jquery.validation.min.js"></script>
<script src="{{ constants.URL }}templates/assets/js/lib/daterangepicker/daterangepicker.js"></script>
<script src="{{ constants.URL }}templates/assets/js/lib/jqueryui/jquery-ui.min.js"></script>
<script src="{{ constants.URL }}templates/assets/js/lib/jqueryui/jquery-sortable.js"></script>
<script src="{{ constants.URL }}templates/assets/js/lib/colorpicker/bootstrap-colorpicker.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="{{ constants.URL }}templates/assets/js/app.js{{ constants.ver }}"></script>
{% block footer %}
{% endblock footer %}
</body>
</html>
