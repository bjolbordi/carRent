{% extends "index.tpl" %}

{% block content %}
    <div class="page-content">
        <div class="container-fluid">
            <form action="" method="post" enctype='multipart/form-data'>
                <header class="section-header">
                    <div class="tbl">
                        <div class="tbl-row">
                            <div class="tbl-cell">
                                <h2>{{ menuItem.title }} - Edit Category</h2>

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
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Title</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control"
                                                                           name="{{ lang }}[title]"
                                                                           placeholder="Name"
                                                                           value="{{ category[lang].title }}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Description</label>

                                                                <div class="">
                                                                    <textarea class="form-control"
                                                                              name="{{ lang }}[desc]">{{  category[lang].desc }}</textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        {% endfor %}
                                        <div class="card-block row">
                                            <div class="col-md-6 col-xs-12">
                                                <div class="form-group">
                                                    <label class="form-control-label">Parent Category</label>
                                                    <select  class="form-control" name="parent_id">
                                                        <option value="0">None</option>
                                                        {% for p in parents %}
                                                            <option value="{{ p.category_id }}" {{ p.category_id == category[1].parent_id ? 'selected' }}>{{ p.title }}</option>
                                                        {% endfor %}
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-4 col-xs-12">
                                                <div class="form-group row">
                                                    <div class="col-md-12">
                                                        <label class="form-control-label">Featured
                                                            <div class="checkbox checkbox-only">
                                                                <input id="featured" type="checkbox" name="{{ lang }}[featured]"
                                                                       value="1" {% if category[1].featured %} checked {% endif %}>
                                                                <label for="featured"></label>
                                                            </div>
                                                        </label>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 md-mb-30 md-mt-30">
                                                Photo Size: ({{ constants.CATEGORY_WIDTH_L }}X{{ constants.CATEGORY_HEIGHT_L }})
                                            </div>
                                            <div class="col-md-12">
                                                {% if category[1].image %}
                                                    {% set src = '<img src="' ~ constants.SITE_URL ~ 'upload/category/' ~ category[1].image ~ '" height="50"/>' %}
                                                {% else %}
                                                    {% set src = '<img src="' ~ constants.URL ~ 'templates/assets/img/no-image.png" height="50"/>' %}
                                                {% endif %}
                                                <div class="form-group row">
                                                    <div class="col-md-12">

                                                        <div class="col-md-8">
                                                            <div class="col-md-3">
                                                                {{ src | raw }}
                                                            </div>
                                                            <label class="btn btn-primary" for="my-file-selector">
                                                                <i class="fa fa-paperclip"></i>
                                                                <input id="my-file-selector" type="file" name="image" style="display:none;" onchange="$('#upload-file-info').html($(this).val());">
                                                                Upload Image
                                                            </label>
                                                            <span class='label label-info' id="upload-file-info"></span>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        {% if message %}
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="alert alert-success alert-no-border alert-close alert-dismissible fade in"
                                                         role="alert">
                                                        <button type="button" class="close" data-dismiss="alert"
                                                                aria-label="Close">
                                                            <span aria-hidden="true">×</span>
                                                        </button>
                                                        {{ message }}
                                                    </div>
                                                </div>
                                            </div>
                                        {% endif %}
                                    </div>
                                    <!--.tab-content-->
                                </section>
                                <!--.tabs-section-->

                            </div>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group pull-right">
                            <button type="submit" class="btn btn-inline">Save</button>
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
