{% extends "index.tpl" %}

{% block content %}
    <!-- Breadcrumb section -->
    <section class="breadcrumbs  hidden-xs">
        <div class="container">
            <ol class="breadcrumb breadcrumb--wd pull-left">
                <li><a href="{{ globals.uri }}">{{ langs.main }}</a></li>
                <li class="active"><a href="{{ globals.uri }}{{ globals.controller }}">{{ CurrentMenu.title }}</a></li>
            </ol>
        </div>
    </section>
    <section class="content news__content">
        <div class="container"><!-- <a id="load-more" href="#">load more</a> -->
            <div class="posts-isotope">
                {% for n in News %}
                    <!-- Post start -->
                    <div class="post post--column col-md-3 col-sm-6  col-xs-12">
                        <a class="post__image" href="{{ globals.uri }}news/detail/{{ n.id }}">
                            <img src="{{ constants.UPLOAD }}news/s_{{ n.image }}" alt="">
                        </a>
                        <div class="post__view-btn">
                            <div class="text-center">
                                <a class="btn btn--round" href="{{ globals.uri }}news/detail/{{ n.id }}"><span class="icon icon-eye"></span></a>
                            </div>
                        </div>
                            <h5 class="post__title text-uppercase"><a href="{{ globals.uri }}news/detail/{{ n.id }}">{{ n.title }}</a></h5>
                            <div class="post__text">
                                {% set text = n.text|length > 150 ? n.text|slice(0, 150) ~ '...' : n.text %}
                                {{ text | raw }}
                            </div>
                        <div class="divider divider--xs"></div>
                            <div class="post__meta">
                                <span class="post__meta__date pull-left">
                                <span class="icon icon-clock"></span>{{ n.published_date | date("d/m/Y") }}</span> 
                                <span class="post__meta__author pull-right">
                                <span class="icon icon-user-circle"></span>
                                <a href="#">Admin</a>
                                </span>
                            </div>
                        <!-- end post -->
                    </div>
                {% endfor %}
            </div>
        </div>
    </section>
    <div class="pagination-div text-center">
        {% include 'inc/pagination.tpl' with {
        currentPage: Page,
        perPage: PerPage,
        paginationPath: globals.uri ~ 'news/?page=',
        contentCount: Count,
        showAlwaysFirstAndLast: false
        } only %}
    </div>
    <div class="clearfix"></div>
{% endblock %}