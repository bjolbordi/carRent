{% extends "index.tpl" %}

{% block content %}
    <section class="breadcrumbs  hidden-xs">
        <div class="container">
            <ol class="breadcrumb breadcrumb--wd pull-left">
                <li><a href="{{ globals.uri }}">{{ langs.main }}</a></li>
                <li class="active">{{ data.title }}</li>
            </ol>
        </div>
    </section>
    <section class="content">
        <div class="container">
            <div class="single-div">
                {{ data.text | raw }}
            </div>
        </div>
    </section>
{% endblock %}