{% extends "index.tpl" %}

{% block content %}
    <div class="page-content">
        <div class="container-fluid">
            <form action="" method="post" enctype='multipart/form-data'>
                <header class="section-header">
                    <div class="tbl">
                        <div class="tbl-row">
                            <div class="tbl-cell">
                                <h2>{{ menuItem.title }}</h2>

                                <div class="subtitle"></div>
                            </div>
                        </div>
                    </div>
                </header>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-md-12">
                                <section class="tabs-section">
                                    <div class="tabs-section-nav">
                                        <div class="tbl">
                                            <ul class="nav" role="tablist">
                                                {% for key,lang in json_decode(constants.LANGS, true) %}
                                                    {% set lang = lang.id %}
                                                    <li class="nav-item">
                                                        <a class="nav-link {% if loop.index == 1 %} active {% endif %}"
                                                           href="#tabs-2-tab-{{ lang }}" role="tab"
                                                           data-toggle="tab">
                                                            <span class="nav-link-in">{{ key }}</span>
                                                        </a>
                                                    </li>
                                                {% endfor %}
                                            </ul>
                                        </div>
                                    </div>
                                    <!--.tabs-section-nav-->
                                    <div class="tab-content">
                                        {% for lang in json_decode(constants.LANGS, true) %}
                                            {% set lang = lang.id %}
                                            <div role="tabpanel"
                                                 class="tab-pane fade in {% if loop.index == 1 %} active {% endif %}"
                                                 id="tabs-2-tab-{{ lang }}">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Slider Link</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control"
                                                                           name="{{ lang }}[slider_link]"
                                                                           placeholder="Name" value="{{ slider[lang].slider_link }}"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Caption</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control"
                                                                           name="{{ lang }}[slider_caption]"
                                                                           placeholder="Address" value="{{ slider[lang].slider_caption }}"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Html</label>

                                                                <div class="">
                                                                    <textarea class="form-control ckeditor"
                                                                              name="{{ lang }}[slider_html]">{{ slider[lang].slider_html }}</textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        {% endfor %}
                                    </div>
                                    <!--.tab-content-->
                                </section>
                                <!--.tabs-section-->
                                <div class="card">
                                    <div class="card-block row">
                                        <div class="col-md-12 col-xs-12">
                                            <div class="form-group">
                                                <label class="form-control-label">Category</label>
                                                <select  class="select2" name="categories[]" multiple="multiple">
                                                    {% for c in categories %}
                                                        <option value="{{ c.category_id }}" {{ sliderCategories[c.category_id] ? 'selected' }}>{{ c.title }}</option>
                                                    {% endfor %}
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-xs-12">
                                            <div class="form-group">
                                                <label class="form-control-label">Brand</label>
                                                <select  class="form-control" name="brand_id">
                                                    <option value="0">None</option>
                                                    {% for b in brands %}
                                                        <option value="{{ b.brand_id }}" {{ b.brand_id == slider[1].brand_id ? 'selected' }}>{{ b.title }}</option>
                                                    {% endfor %}
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group row">
                                                <div class="col-md-12">
                                                    <label class="form-control-label">Home Page
                                                        <div class="checkbox checkbox-only">
                                                            <input id="home" type="checkbox" name="home"
                                                                   value="1" {% if slider[1].home %} checked {% endif %}>
                                                            <label for="home"></label>
                                                        </div>
                                                    </label>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group row">
                                                <div class="col-md-12">
                                                    <label class="form-control-label">Open link new tab
                                                        <div class="checkbox checkbox-only">
                                                            <input id="slider_link_blank" type="checkbox" name="target_blank"
                                                                   value="1" {% if slider[1].target_blank %} checked {% endif %}>
                                                            <label for="slider_link_blank"></label>
                                                        </div>
                                                    </label>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-xs-12">
                                            <div class="col-md-12 md-mb-30">
                                                Photo Sizes: Small ({{ constants.SLIDER_WIDTH_S }}X{{ constants.SLIDER_HEIGHT_S }}),
                                                Large ({{ constants.SLIDER_WIDTH_L }}X{{ constants.SLIDER_HEIGHT_L }})
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            {% if slider[1].slider_image %}
                                                {% set src = '<img class="img-thumbnail" src="' ~ constants.SITE_URL ~ 'upload/slider/' ~ slider[1].slider_image ~ '" height="50"/>' %}
                                            {% else %}
                                                {% set src = '<img class="img-thumbnail" src="' ~ constants.URL ~ 'templates/assets/img/no-image.png" height="50"/>' %}
                                            {% endif %}
                                            <div class="form-group">
                                                <div class="col-md-3 md-mb-20">
                                                    <div class="row">{{ src | raw }}</div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <label class="btn btn-primary" for="my-file-selector">
                                                        <i class="fa fa-paperclip"></i>
                                                        <input id="my-file-selector" type="file" name="slider_image" style="display:none;" onchange="$('#upload-file-info').html($(this).val());">
                                                        Upload Image
                                                    </label>
                                                    <span class='label label-info' id="upload-file-info"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            {% if message %}
                                                <div class="alert alert-success alert-no-border alert-close alert-dismissible fade in" role="alert">
                                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                        <span aria-hidden="true">×</span>
                                                    </button>
                                                    {{ message }}
                                                </div>
                                            {% endif %}
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group pull-right">
                            <button type="button" class="btn btn-inline btn-default">Cancel</button>
                            <button type="submit" class="btn btn-inline">Change</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
{% endblock content %}
{% block footer %}
    <script type="text/javascript" src="{{ constants.URL }}editor/ckeditor/ckeditor.js"></script>
{% endblock footer %}