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
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Title</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control"
                                                                           name="{{ lang }}[title]"
                                                                           placeholder="Name"
                                                                           value="{{ pages[lang].title }}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Text</label>

                                                                <div class="">
                                                                    <textarea class="form-control ckeditor"
                                                                              name="{{ lang }}[text]">{{ pages[lang].text }}</textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        {% endfor %}
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <div class="col-md-12">
                                                        <label class="form-control-label">Show title
                                                            <div class="checkbox checkbox-only">
                                                                <input id="show_title" type="checkbox"
                                                                       name="show_title"
                                                                       value="1" {% if pages[1].show_title %} checked {% endif %}>
                                                                <label for="show_title"></label>
                                                            </div>
                                                        </label>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <div class="col-md-12">
                                                        <label class="form-control-label">Published
                                                            <div class="checkbox checkbox-only">
                                                                <input id="published" type="checkbox"
                                                                       name="published"
                                                                       value="1" {% if pages[1].published %} checked {% endif %}>
                                                                <label for="published"></label>
                                                            </div>
                                                        </label>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <div class="col-md-12">
                                                        <label class="form-control-label">Published Date</label>

                                                        <div class="date">
                                                            <input type="text" class="form-control datetimepicker-1"
                                                                   name="published_date"
                                                                   placeholder="Name"
                                                                   value="{{ pages[1].published_date }}">
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
