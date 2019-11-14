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
                                                                <label class="form-control-label">Menu title</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control"
                                                                           name="{{ lang }}[title]"
                                                                           data-validation="[NOTEMPTY]"
                                                                           placeholder="Title" value="{{ data[lang].title }}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Meta title</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control"
                                                                           name="{{ lang }}[metatitle]"
                                                                           placeholder="Meta title" value="{{ data[lang].metatitle }}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Meta keywords</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control"
                                                                           name="{{ lang }}[metakey]"
                                                                           placeholder="keywords" value="{{ data[lang].metakey }}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Meta
                                                                    description</label>

                                                                <div class="">
                                                                    <textarea class="form-control"
                                                                              name="{{ lang }}[metadesc]">{{ data[lang].metadesc }}</textarea>
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
                                        <div class="col-md-6 col-xs-12">
                                            <div class="form-group">
                                                <label class="form-control-label">Menu type</label>
                                                <select id="views" class="form-control" name="view">
                                                    {% for view in views %}
                                                        {% if view == data[1].view %}
                                                            <option value="{{ view }}" selected>{{ view }}</option>
                                                        {% else %}
                                                            <option value="{{ view }}">{{ view }}</option>
                                                        {% endif %}
                                                    {% endfor %}
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <div class="form-group">
                                                <label class="form-control-label">Content</label>
                                                <select id="content" class="form-control" name="content" data-id="{{ data[1].content }}">
                                                    <option value="0">None</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-control-label">Alias</label>

                                                <div class="">
                                                    <input type="text" class="form-control"
                                                           name="alias"
                                                           data-validation="[NOTEMPTY]"
                                                           placeholder="Alias (URL)" value="{{ data[1].alias }}"></div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <div class="form-group">
                                                <label class="form-control-label">Parent menu</label>
                                                <select  class="form-control" name="parent">
                                                    <option value="0">None</option>
                                                    {% for p in parents if p.id !=  data[1].id %}
                                                        {% if p.id == data[1].parent %}
                                                            <option value="{{ p.id }}" selected>{{ p.title }}</option>
                                                        {% else %}
                                                            <option value="{{ p.id }}">{{ p.title }}</option>
                                                        {% endif %}
                                                    {% endfor %}
                                                </select>
                                            </div>
                                        </div>


                                        <div class="col-md-3">
                                            <div class="form-group row">
                                                <div class="col-md-12">
                                                    <label class="form-control-label">Home Page
                                                        <div class="checkbox checkbox-only">
                                                            <input id="home" type="checkbox" name="home"
                                                                   value="1" {% if data[1].home %} checked {% endif %}>
                                                            <label for="home"></label>
                                                        </div>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group row">
                                                <div class="col-md-12">
                                                    <label class="form-control-label">Published
                                                        <div class="checkbox checkbox-only">
                                                            <input id="published" type="checkbox" name="published"
                                                                   value="1" {% if data[1].published %} checked {% endif %}>
                                                            <label for="published"></label>
                                                        </div>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <div class="col-md-2">
                                                    <label class="form-control-label">Remove image
                                                        <div class="checkbox checkbox-only">
                                                            <input id="remove" type="checkbox" name="remove"
                                                                   value="1">
                                                            <label for="remove"></label>
                                                        </div>
                                                    </label>
                                                </div>

                                                {% if data[1].image %}
                                                    {% set src = '<img src="' ~ constants.SITE_URL ~ 'upload/menu/' ~ data[1].image ~ '" height="50"/>' %}
                                                {% else %}
                                                    {% set src = '<img src="' ~ constants.URL ~ 'templates/assets/img/no-image.png" height="50"/>' %}
                                                {% endif %}
                                                <div class="col-md-10">
                                                    <div class="col-md-8">
                                                        <div class="col-md-6">
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
                            <a href="{{ globals.uri }}menu/"><button  type="button" class="btn btn-inline btn-default">Cancel</button></a>
                            <button type="submit" class="btn btn-inline">Change</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
{% endblock content %}

{% block footer %}
    <script src="{{ constants.URL }}templates/assets/views/menu/js/menu.js"></script>
{% endblock footer %}

