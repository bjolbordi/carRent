{% extends "index.tpl" %}

{% block facebook %}
    <!--<meta property="fb:app_id" content="361736430535656" /> -->
    <meta property="og:type" content="website"/>
    <meta property="og:title" content="{{ Post.title }}"/>
    <meta property="og:description" content="{{ Post.text }}"/>
    <meta property="og:url" content="{{ globals.uri }}product/detail/{{ Product.product_id }}/{{ Product.variant_id }}"/>
    {% for i in Images %}
        <meta property="og:image" content="{{ constants.UPLOAD }}product/m_{{ i.photo_name }}"/>
    {% endfor %}
{% endblock %}

{% block content %}
   <!-- mt main start here -->
            <main id="mt-main">
                <!-- Mt Product Detial of the Page -->
                <section class="mt-product-detial wow fadeInUp" data-wow-delay="0.4s">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <!-- Slider of the Page -->
                                <div class="slider">
                                    <!-- Comment List of the Page -->
                                    <ul class="list-unstyled comment-list">
                                        <li><a href="#"><i class="fa fa-heart"></i>27</a></li>
                                        <li><a href="#"><i class="fa fa-comments"></i>12</a></li>
                                        <li><a href="#"><i class="fa fa-share-alt"></i>14</a></li>
                                    </ul>
                                    <!-- Comment List of the Page end -->
                                    <!-- Product Slider of the Page -->
                                    <div class="product-slider">
                                        {% for i in Images %}
                                        <div class="slide">
                                            <img src="{{ constants.UPLOAD }}product/l_{{ i.photo_name }}" alt="image descrption">
                                        </div>
                                        {% endfor %}
                                    </div>
                                    <!-- Product Slider of the Page end -->
                                    <!-- Pagg Slider of the Page -->
                                    <ul class="list-unstyled slick-slider pagg-slider">
                                        {% for i in Images %}
                                        <li><div class="img"><img src="{{ constants.UPLOAD }}product/s_{{ i.photo_name }}" alt="image description"></div></li>
                                        {% endfor %}
                                    </ul>
                                    <!-- Pagg Slider of the Page end -->
                                </div>
                                <!-- Slider of the Page end -->
                                <!-- Detail Holder of the Page -->
                                <div class="detial-holder">
                                    <!-- Breadcrumbs of the Page -->
                                    <ul class="list-unstyled breadcrumbs">
                                        <li><a href="#">Chairs <i class="fa fa-angle-right"></i></a></li>
                                        <li>Products</li>
                                    </ul>
                                    <!-- Breadcrumbs of the Page end -->
                                    <h2>{{ Product.title }}</h2>
                                    <!-- Rank Rating of the Page -->
                                    <div class="rank-rating">
                                        <ul class="list-unstyled rating-list">
                                            <li><a href="#"><i class="fa fa-star"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o"></i></a></li>
                                        </ul>
                                    </div>
                                    <!-- Rank Rating of the Page end -->
                                    <ul class="list-unstyled list">
                                        <li><a href="#"><i class="fa fa-share-alt"></i>SHARE</a></li>
                                        <!-- <li><a href="#"><i class="fa fa-exchange"></i>COMPARE</a></li> -->
                           <!--              <li><a href="#"><i class="fa fa-heart"></i>ADD TO WISHLIST</a></li> -->
                                    </ul>
                                    <div class="txt-wrap">
                                        {{ Product.desc | raw }}
                                    </div>
                                    <div class="text-holder">
                                        {% if Product.sale > 0 %}
                                        <span class="price">{{ langs.valute_symbol }} {{ Product.price - (Product.price*Product.sale)/100 }} <del>{{ Product.price }}</del></span>
                                        {% else %}
                                        <span class="price">{{ langs.valute_symbol }} {{ Product.price }}</span>
                                        {% endif %}

                                    </div>
                                    <!-- Product Form of the Page -->
                                    <form action="#" class="product-form">
                                        <fieldset>
                                            <div class="row-val">
                                                <label for="qty">{{ langs.quantity }}</label>
                                                <input type="number" id="qty" placeholder="{{ Product.quantity }}">
                                            </div>
                                            <div class="row-val">
                                                <button class="btn btn--wd text-uppercase {% if Product.quantity <= 0 %}disabled{% else %}ajax-to-cart detail{% endif %}" data-product-id="{{ Product.product_id }}" data-variant-id="{{ Product.variant_id }}">{{ langs.cart_add }}</button>
                                            </div>
                                        </fieldset>
                                    </form>
                                    <!-- Product Form of the Page end -->
                                </div>
                                <!-- Detail Holder of the Page end -->
                            </div>
                        </div>
                    </div>
                </section><!-- Mt Product Detial of the Page end -->
                <div class="product-detail-tab wow fadeInUp" data-wow-delay="0.4s">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <ul class="mt-tabs text-center text-uppercase">
                                    <li><a href="#tab1" class="active">DESCRIPTION</a></li>
                                    <li><a href="#tab3">REVIEWS (12)</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div id="tab1">
                                        {{ Product.desc | raw }}
                                    </div>
                                    <div id="tab3">
                                        <div class="product-comment">
                                            <div class="mt-box">
                                                <div class="mt-hold">
                                                    <ul class="mt-star">
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                    <span class="name">John Wick</span>
                                                    <time datetime="2016-01-01">09:10 Nov, 19 2016</time>
                                                </div>
                                                <p>Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit sse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non</p>
                                            </div>
                                            <div class="mt-box">
                                                <div class="mt-hold">
                                                    <ul class="mt-star">
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                    <span class="name">John Wick</span>
                                                    <time datetime="2016-01-01">09:10 Nov, 19 2016</time>
                                                </div>
                                                <p>Usmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit sse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non</p>
                                            </div>
                                            <form action="#" class="p-commentform">
                                                <fieldset>
                                                    <h2>Add  Comment</h2>
                                                    <div class="mt-row">
                                                        <label>Rating</label>
                                                        <ul class="mt-star">
                                                            <li><i class="fa fa-star"></i></li>
                                                            <li><i class="fa fa-star"></i></li>
                                                            <li><i class="fa fa-star-o"></i></li>
                                                            <li><i class="fa fa-star-o"></i></li>
                                                        </ul>
                                                    </div>
                                                    <div class="mt-row">
                                                        <label>Name</label>
                                                        <input type="text" class="form-control">
                                                    </div>
                                                    <div class="mt-row">
                                                        <label>E-Mail</label>
                                                        <input type="text" class="form-control">
                                                    </div>
                                                    <div class="mt-row">
                                                        <label>Review</label>
                                                        <textarea class="form-control"></textarea>
                                                    </div>
                                                    <button type="submit" class="btn-type4">ADD REVIEW</button>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- related products start here -->
                {% if SimilarProducts | length %}
                <div class="related-products wow fadeInUp" data-wow-delay="0.4s">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                            <h2>{{ langs.similar_products }}</h2>
                                <div class="row">
                                    <div class="col-xs-12">
                                        {% for p in SimilarProducts %}
                                            <!-- mt product1 center start here -->
                                            <div class="mt-product1 mt-paddingbottom20">
                                                <div class="box">
                                                    <div class="b1">
                                                        <div class="b2">
                                                            <a href="{{ globals.uri }}product/detail/{{ p.product_id }}/{{ p.variant_id }}">
                                                                {% if p.image %}
                                                                    {% set src = constants.UPLOAD ~ 'product/s_' ~ p.image %}
                                                                {% else %}
                                                                    {% set src = constants.THEME ~ 'assets/images/products/no_photo_s.jpg' %}
                                                                {% endif %}
                                                                <img src="{{src}}" alt="image description">
                                                            </a>
                                                            <span class="caption">
                                                                {% if p.sale > 0 %}
                                                                    <span class="off">{{ p.sale }}%</span>
                                                                {% endif %}
                                                                {% if p.days_left > -7 %}
                                                                    <span class="new">{{ langs.new }}</span>
                                                                {% endif %}
                                                            </span>
                                                            <ul class="mt-stars">
                                                                <li><i class="fa fa-star"></i></li>
                                                                <li><i class="fa fa-star"></i></li>
                                                                <li><i class="fa fa-star"></i></li>
                                                                <li><i class="fa fa-star-o"></i></li>
                                                            </ul>
                                                            <ul class="links">
                                                                <li><a href="#"><i class="icon-handbag"></i><span>Add to Cart</span></a></li>
                                                                <li><a href="#"><i class="icomoon icon-heart-empty"></i></a></li>
                                                                <li><a href="#"><i class="icomoon icon-exchange"></i></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="txt">
                                                    <strong class="title"><a href="{{ globals.uri }}product/detail/{{ p.product_id }}/{{ p.variant_id }}">{{ p.title }}</a></strong>
                                                    <span class="price"><i class="fa fa-eur"></i> <span>{{ p.price }}</span></span>
                                                </div>
                                            </div><!-- mt product1 center end here -->
                                        {% endfor %}
                                        <!-- mt product1 center start here -->
                                        <div class="mt-product1 mt-paddingbottom20">
                                            <div class="box">
                                                <div class="b1">
                                                    <div class="b2">
                                                        <a href="product-detail.html"><img src="images/products/img04.jpg" alt="image description"></a>
                                                        <span class="caption">
                                                            <span class="off">15% Off</span>
                                                            <span class="new">NEW</span>
                                                        </span>
                                                        <ul class="mt-stars">
                                                            <li><i class="fa fa-star"></i></li>
                                                            <li><i class="fa fa-star"></i></li>
                                                            <li><i class="fa fa-star"></i></li>
                                                            <li><i class="fa fa-star-o"></i></li>
                                                        </ul>
                                                        <ul class="links">
                                                            <li><a href="#"><i class="icon-handbag"></i><span>Add to Cart</span></a></li>
                                                            <li><a href="#"><i class="icomoon icon-heart-empty"></i></a></li>
                                                            <li><a href="#"><i class="icomoon icon-exchange"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="txt">
                                                <strong class="title"><a href="product-detail.html">Bombi Chair</a></strong>
                                                <span class="price"><i class="fa fa-eur"></i> <span>200,00</span></span>
                                            </div>
                                        </div><!-- mt product1 center end here -->
                                </div>
                            </div>
                        </div>
                    </div><!-- related products end here -->
                </div>
                {% endif %}
            </main><!-- mt main end here -->
{% endblock %}

{% block footer %}
    <script src="{{ constants.THEME }}assets/js/build/plugins/elevatezoom/jquery.elevatezoom.min.js{{ constants.ver }}"></script>
    <script src="{{ constants.THEME }}assets/js/build/view/product/product.min.js{{ constants.ver }}"></script>
{% endblock %}