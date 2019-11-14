{% extends "index.tpl" %}

{% block content %}
    <div class="page-content">
        <div class="container-fluid">
            <form action="" method="post" enctype='multipart/form-data'>
                <header class="section-header">
                    <div class="tbl">
                        <div class="tbl-row">
                            <div class="tbl-cell">
                                <h2>{{ menuItem.title }} - New Attribute</h2>

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
                                                                           value="{{ post.title }}"
                                                                           data-validation="[NOTEMPTY]" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        {% endfor %}
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label class="form-control-label">Attribute type</label>
                                                    <select  class="form-control" name="type_id">
                                                        {% for t in types %}
                                                            <option value="{{ t.type_id }}">{{ t.title }}</option>
                                                        {% endfor %}
                                                    </select>
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
