{% extends "index.tpl" %}

{% block content %}

<div id="pageContent" class="page-content page-content--fill">
    <section class="breadcrumbs  hidden-xs">
        <div class="container">
            <ol class="breadcrumb breadcrumb--wd pull-left">
                <li><a href="{{ globals.uri }}">{{ langs.main }}</a></li>
                <li class="active"><a>{{ langs.products }}</a></li>
            </ol>
        </div>
    </section>
    <section class="content top-null">
        <div>
            <div class="category-outer">
                <div class="category-slider single-slider">
                    <ul>
                        {% for s in Slides %}
                            <li>
                                <a href="{{ s.slider_link ? s.slider_link : 'javascript:return false;' }}" {{ s.target_blank ? 'target="_blank"' }}>
                                    <img src="{{ constants.UPLOAD }}slider/l_{{ s.slider_image }}" alt="" />
                                </a>
                            </li>
                        {% endfor %}
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <section class="content" id="ajax-content">
        <div class="container">
            <div class="filters-row row">
                <div class="col-sm-6 col-md-6 col-lg-6 row">
                    <a class="btn btn--wd btn--with-icon btn--sm wave" id="showFilterMobile"><span class="icon icon-filter"></span>Filter</a>
                    <div class="filters-row__select">
                        <label>{{ langs.sort }}: </label>
                        <select class="selectpicker sort-select" data-style="select--wd select--wd--sm" data-width="160">
                            <option value="{{ globals.uri }}product/?{{ BuildFilterUrl('sort', 'views,desc', true) }}" {{ get.sort == 'views,desc' ? 'selected' }}>{{ langs.rating }} - {{ langs.desc }}</option>
                            <option value="{{ globals.uri }}product/?{{ BuildFilterUrl('sort', 'views,asc', true) }}" {{ get.sort == 'views,asc' ? 'selected' }}>{{ langs.rating }} - {{ langs.asc }}</option>
                            <option value="{{ globals.uri }}product/?{{ BuildFilterUrl('sort', 'price,desc', true) }}" {{ get.sort == 'price,desc' ? 'selected' }}>{{ langs.price }} - {{ langs.desc }}</option>
                            <option value="{{ globals.uri }}product/?{{ BuildFilterUrl('sort', 'price,asc', true) }}"  {{ get.sort == 'price,asc' ? 'selected' }}>{{ langs.price }} - {{ langs.asc }}</option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-6 row">
                    {% include 'inc/pagination.tpl' with {
                    currentPage: Page,
                    perPage: PerPage,
                    paginationPath: globals.uri ~ 'product/?' ~ Url ~ '&page=',
                    contentCount: Count,
                    showAlwaysFirstAndLast: false,
                    ulClass: 'pull-right'
                    } only %}
                </div>
            </div>
            <div class="outer open">
                <div class="ajax-loader"></div>
                <div class="col-md-3 row">
                    <div id="filtersCol" class="filters-col">
                        <div class="filters-col__close" id="filtersColClose"><a href="#" class="icon icon-clear"></a></div>
                        <div class="filters-col__collapse open">
                            <h4 class="filters-col__collapse__title text-uppercase">{{ langs.category }}</h4>
                            <div class="filters-col__collapse__content">
                                <ul class="filter-list">
                                    {% set GetCategory = get.category | split(',') %}
                                    {%  for c in FilterCategories %}
                                        <li class="checkbox-group">
                                            <input class="filter-checkbox" type="checkbox" {{ c.category_id in GetCategory ? 'checked' }} id="checkBox-{{ c.category_id }}"
                                                   data-url="{{ globals.uri }}product/?{{ BuildFilterUrl('category', c.category_id) }}"
                                                   data-reset-url="{{ globals.uri }}product/?{{ ResetFilterUrl('category', c.category_id) }}"
                                            >
                                            <label for="checkBox-{{ c.category_id }}">
                                                <span class="check"></span>
                                                <span class="box"></span> {{ c.title }}  ({{ c.count }})
                                            </label>
                                        </li>
                                    {% endfor %}
                                </ul>
                            </div>
                        </div>
                        <div class="filters-col__collapse open">
                            <h4 class="filters-col__collapse__title text-uppercase">{{ langs.brand }}</h4>
                            <div class="filters-col__collapse__content">
                                <ul class="filter-list">
                                    {% set GetBrand = get.brand | split(',') %}
                                    {%  for b in FilterBrands %}
                                        <li class="checkbox-group">
                                            <input class="filter-checkbox" type="checkbox" {{ b.brand_id in GetBrand ? 'checked' }} id="checkBox-brand-{{ b.brand_id }}"
                                                   data-url="{{ globals.uri }}product/?{{ BuildFilterUrl('brand', b.brand_id) }}"
                                                   data-reset-url="{{ globals.uri }}product/?{{ ResetFilterUrl('brand', b.brand_id) }}"
                                            >
                                            <label for="checkBox-brand-{{ b.brand_id }}">
                                                <span class="check"></span>
                                                <span class="box"></span> {{ b.title }}  ({{ b.count }})
                                            </label>
                                        </li>
                                    {% endfor %}
                                </ul>
                            </div>
                        </div>
                        <div class="filters-col__collapse open">
                            <h4 class="filters-col__collapse__title text-uppercase">{{ langs.in_stock }}</h4>
                            <div class="filters-col__collapse__content">
                                <ul class="filter-list">
                                    {% set GetStock = get.stock | split(',') %}
                                    {%  for s in FilterStock %}
                                        <li class="checkbox-group">
                                            {% if s.stock == "1" %}
                                                <input class="filter-checkbox" type="checkbox" id="stock-{{s.stock}}" {{ 1 in GetStock ? 'checked' }}
                                                       data-url="{{ globals.uri }}product/?{{ BuildFilterUrl('stock', s.stock) }}"
                                                       data-reset-url="{{ globals.uri }}product/?{{ ResetFilterUrl('stock', s.stock) }}"
                                                >
                                                <label for="stock-{{s.stock}}"> <span class="check"></span> <span class="box"></span> {{ langs.in_stock }}  ({{s.qty}}) </label>
                                            {% else %}
                                                <input class="filter-checkbox" type="checkbox" id="stock-{{s.stock}}" {{ 2 in GetStock ? 'checked' }}
                                                       data-url="{{ globals.uri }}product/?{{ BuildFilterUrl('stock', s.stock) }}"
                                                       data-reset-url="{{ globals.uri }}product/?{{ ResetFilterUrl('stock', s.stock) }}"
                                                >
                                                <label for="stock-{{s.stock}}"> <span class="check"></span> <span class="box"></span> {{ langs.not_in_stock }}  ({{s.qty}}) </label>
                                            {% endif %}
                                        </li>
                                    {% endfor %}
                                </ul>
                            </div>
                        </div>
                        {% for key, colors in FilterColors %}
                            <div class="filters-col__collapse open">
                                <h4 class="filters-col__collapse__title text-uppercase">{{ key }}</h4>
                                <div class="filters-col__collapse__content">
                                    <ul class="filter-list">
                                        {% set GetColor = get.color | split(',') %}
                                        {%  for c in colors %}
                                            <li class="checkbox-group color tooltip-link" title="{{ c.title }}">
                                                <input class="filter-checkbox" type="checkbox" {{ c.color_id in GetColor ? 'checked' }} id="checkBox-attr-{{ c.color_id }}"
                                                       data-url="{{ globals.uri }}product/?{{ BuildFilterUrl('color', c.color_id) }}"
                                                       data-reset-url="{{ globals.uri }}product/?{{ ResetFilterUrl('color', c.color_id) }}"
                                                >
                                                <label for="checkBox-attr-{{ c.color_id }}">
                                                    <span class="check"></span>
                                                    <span class="box" style="background-color:{{ c.color }};"></span>
                                                </label>
                                            </li>
                                        {% endfor %}
                                    </ul>
                                </div>
                            </div>
                        {% endfor %}
                        {% for key, attrs in FilterAttrs %}
                            <div class="filters-col__collapse open">
                                <h4 class="filters-col__collapse__title text-uppercase">{{ key }}</h4>
                                <div class="filters-col__collapse__content">
                                    <ul class="filter-list">
                                        {% set GetAttr = get.attr | split(',') %}
                                        {%  for a in attrs %}
                                            <li class="checkbox-group">
                                                <input class="filter-checkbox" type="checkbox" {{ a.attr_value_id in GetAttr ? 'checked' }} id="checkBox-attr-{{ a.attr_value_id }}"
                                                       data-url="{{ globals.uri }}product/?{{ BuildFilterUrl('attr', a.attr_value_id) }}"
                                                       data-reset-url="{{ globals.uri }}product/?{{ ResetFilterUrl('attr', a.attr_value_id) }}"
                                                >
                                                <label for="checkBox-attr-{{ a.attr_value_id }}">
                                                    <span class="check"></span>
                                                    <span class="box" {% if a.color %}style="background-color:{{ a.color }};"{% endif %}></span>
                                                    {{ a.title }}  ({{ a.count }})
                                                </label>
                                            </li>
                                        {% endfor %}
                                    </ul>
                                </div>
                            </div>
                        {% endfor %}
                        <div class="filters-col__collapse open">
                            <h4 class="filters-col__collapse__title text-uppercase">{{ langs.price }}</h4>
                            <div class="filters-col__collapse__content">
                                <input id="priceMin" type="hidden" value="{{ FilterPrice.min_price|number_format }}">
                                <input id="priceMax" type="hidden" value="{{ FilterPrice.max_price|number_format }}">
                                <input id="priceFrom" type="hidden" value="{{ get.price_from ? get.price_from|number_format : FilterPrice.min_price|number_format }}">
                                <input id="priceTo" type="hidden" value="{{  get.price_to ? get.price_to|number_format : FilterPrice.max_price|number_format }}">
                                <input id="priceUrl" type="hidden" value="{{ globals.uri }}product/?{{ ResetFilterUrl('price', '') }}">
                                <div id="priceSlider" class="price-slider"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 product-container">
                        {% if Products | length == 0 %}
                            <div class="col-md-12 text-center row md-mt-15 product-not-found"><h5>{{ langs.products_not_found }}</h5></div>
                        {% endif %}
                        {% for p in Products %}
                            <div class="col-md-4 col-sm-6 col-xs-12">
                                <div class="product-preview">
                                    <div class="product-preview__image">
                                        <a href="{{ globals.uri }}product/detail/{{ p.product_id }}/{{ p.variant_id }}">
                                            {% if p.image %}
                                                {% set src = constants.UPLOAD ~ 'product/s_' ~ p.image %}
                                            {% else %}
                                                {% set src = constants.THEME ~ 'assets/images/products/no_photo_s.jpg' %}
                                            {% endif %}
                                            <img class="img-loading" src="{{ src }}" data-lazy="{{ src }}" alt=""/></a>
                                        {% if p.sale > 0 and p.sale_end_date > 0 %}
                                            <div class="countdown_box">
                                                <div class="countdown_inner">
                                                    <div class="title">{{ langs.spec_deal }}</div>
                                                    <div class="countdown" data-countdown="{{ p.sale_end_date | date("Y-m-d H:i:s") }}"></div>
                                                </div>
                                            </div>
                                        {% endif %}
                                    </div>
                                    {% if p.days_left > -7 %}
                                        <div class="product-preview__label product-preview__label--left product-preview__label--new"><span>{{ langs.new }}</span></div>
                                    {% endif %}
                                    {% if p.sale > 0 %}
                                        <div class="product-preview__label product-preview__label--right product-preview__label--sale"><span>sale</span></div>
                                    {% endif %}
                                    <div class="product-preview__info text-center">
                                        <div class="product-preview__info__btns">
                                            <a href="#" class="btn btn--round ajax-to-cart" data-product-id="{{ p.product_id }}" data-variant-id="{{ p.variant_id }}" data-quantity="{{ p.quantity }}">
                                                <span class="icon-ecommerce"></span>
                                            </a>
                                            <a href="{{ globals.uri }}product/detail/{{ p.product_id }}/{{ p.variant_id }}" class="btn btn--round btn--dark">
                                                <span class="icon icon-eye"></span>
                                            </a>
                                        </div>
                                        <div class="product-preview__info__title">
                                            <h2><a href="{{ globals.uri }}product/detail/{{ p.product_id }}/{{ p.variant_id }}">{{ p.title }}</a></h2>
                                        </div>
                                        <div class="price-box">
                                            {% if p.sale > 0 %}
                                                <span class="price-box__new">{{ p.sale }}{{ langs.valute_symbol }} </span>
                                                <span class="price-box__old"> {{ p.price }}{{ langs.valute_symbol }}</span>
                                            {% elseif p.price > 0 %}
                                                <span class="price-box__new">{{ p.price }}{{ langs.valute_symbol }}</span>
                                            {% else %}
                                                <span class="price-box__new">&nbsp;</span>
                                            {% endif %}
                                        </div>
                                        <div class="product-preview__info__description">
                                            {{ p.desc }}
                                        </div>
                                        <div class="product-preview__info__link">
                                            <a href="#" class="ajax-to-wishlist {{ p.product_id in FavoritesArray ? 'active' }}" data-product-id="{{ p.product_id }}">
                                                <span class="icon icon-favorite"></span>
                                                <span class="product-preview__info__link__text">{{ langs.save_product }}</span>
                                            </a>
                                            <a href="#" class="btn btn--wd buy-link ajax-to-cart" data-product-id="{{ p.product_id }}" data-variant-id="{{ p.variant_id }}" data-quantity="{{ p.variant_quantity ? p.variant_quantity : p.quantity}}"><span class="icon icon-ecommerce"></span><span class="product-preview__info__link__text">{{ langs.cart_add }}</span></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="divider divider--xs"></div>
                            </div>
                        {% endfor %}
                </div>
            </div>
            <div class="col-sm-12 row">
                {% include 'inc/pagination.tpl' with {
                currentPage: Page,
                perPage: PerPage,
                paginationPath: globals.uri ~ 'product/?' ~ Url ~ '&page=',
                contentCount: Count,
                showAlwaysFirstAndLast: false,
                ulClass: 'pull-right'
                } only %}
            </div>
        </div>
    </section>

</div>
    
{% endblock %}

{% block footer %}
    <script src="{{ constants.THEME }}assets/js/build/plugins/nouislider/nouislider.min.js{{ constants.ver }}"></script>
{% endblock %}