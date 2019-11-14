{% extends "index.tpl" %}

{% block content %}
    <div id="pageContent">
        <!-- Breadcrumb section -->
        <section class="breadcrumbs  hidden-xs">
            <div class="container">
                <ol class="breadcrumb breadcrumb--wd pull-left">
                    <li><a href="{{ globals.uri }}">{{ langs.main }}</a></li>
                    <li class="active">Error</li>
                </ol>
            </div>
        </section>
        <div class="divider divider--xs"></div>
        <!-- Content section -->
        <section class="content">
            <div class="container">
                <div class="not-found-box">
                    <div class="not-found-box__image">
                        <img src="{{ constants.THEME }}assets/images/page-404.png" alt="">
                        <div class="not-found-box__text">
                            <h2 class="text-left">{{ langs.page_not_found | raw }}</h2>
                            <h4 class="text-left">{{ langs.page_not_found_text | raw }}</h4>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Content section -->
    </div>
{% endblock %}