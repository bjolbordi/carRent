{% extends "index.tpl" %}

{% block facebook %}
    <!--<meta property="fb:app_id" content="361736430535656" /> -->
    <meta property="og:type" content="website"/>
    <meta property="og:title" content="{{ Post.title }}"/>
    <meta property="og:description" content="{{ Post.text }}"/>
    <meta property="og:url" content="{{ globals.uri }}news/detail/{{ Post.id }}"/>
    {% for i in Images %}
        <meta property="og:image" content="{{ constants.UPLOAD }}news/m_{{ i.content_photo_name }}"/>
    {% endfor %}
{% endblock %}

{% block content %}
    <div id="fb-root"></div>
    <script>(function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/ka_GE/sdk.js#xfbml=1&version=v2.8&appId=263078360543200";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
    <!-- Breadcrumb section -->
    <section class="breadcrumbs  hidden-xs">
        <div class="container">
            <ol class="breadcrumb breadcrumb--wd pull-left">
                <li><a href="{{ globals.uri }}">{{ langs.main }}</a></li>
                <li><a href="{{ globals.uri }}{{ globals.controller }}">{{ CurrentMenu.title }}</a></li>
                <li class="active"><a>{{ Post.title }}</a></li>
            </ol>
        </div>
    </section>
    <section class="content news__content">
        {% if Images | length %}
            <div class="container">
                <div class="category-slider single-slider">
                    <ul>
                        {% for i in Images %}
                            <li><img src="{{ constants.UPLOAD }}news/l_{{ i.content_photo_name }}" alt=""></li>
                        {% endfor %}
                    </ul>
                </div>
            </div>
        {% endif %}
        <div class="container blog-post-content">
            <div>
                <h2 class="">{{ Post.title }}</h2>
                <div class="">{{ Post.published_date | date("d/m/Y") }}</div>
            </div>
            <div>
                {{ Post.text | raw }}
                {{ Post.moretext | raw }}
            </div>
            <div class="divider divider--sm"></div>
            <div>
                <span class="share-span">{{ langs.share }}:
                     <div class="fb-share-button" data-href="{{ globals.uri }}news/detail/{{ Post.id }}" data-layout="button_count" data-size="small" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" ></a></div>
                </span>
            </div>
        </div>
        {% if SimilarNews | length %}
            <section class="content content--fill">
                <div class="container">
                    <h2 class="text-center text-uppercase">{{ langs.similar_news }}</h2>
                    <div class="product-category-carousel mobile-special-arrows animated-arrows slick">
                        {% for n in SimilarNews %}
                            <div class="product-category hover-squared"> <a href="{{ globals.uri }}news/detail/{{ n.id }}"><img src="{{ constants.UPLOAD }}news/s_{{ n.image }}" alt="{{ n.title }}"></a>
                                <div class="product-category__hover caption"></div>
                                <div class="product-category__info">
                                    <div class="product-category__info__ribbon">
                                        <h5 class="product-category__info__ribbon__title">{{ n.title }}</h5>
                                        <div class="product-category__info__ribbon__count"></div>
                                    </div>
                                </div>
                            </div>
                        {% endfor %}
                    </div>
                </div>
            </section>
        {% endif %}
        <div class="divider divider--md"></div>
        <div class="container">
            <div class="fb-comments" data-href="{{ globals.uri }}news/detail/{{ Post.id }}" data-width="100%" data-numposts="5" data-order-by="reverse_time">
            </div>
        </div>
    </section>
{% endblock %}