{% extends "index.tpl" %}

{% block content %}
    <div class="page-content">
        <div class="container-fluid">
            <form action="" method="post">
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
                                                                <label class="form-control-label">Message Text</label>

                                                                <div class="">
                                                                    <textarea class="form-control"
                                                                              name="{{ lang }}[text]">{{ data[lang].text }}</textarea>
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
                                        <div class="col-md-12">
                                            <div class="col-md-3">
                                                <div class="form-group row">
                                                    <div class="col-md-12">
                                                        <label class="form-control-label">Enabled
                                                            <div class="checkbox checkbox-only">
                                                                <input id="status_id" type="checkbox" name="status_id"
                                                                       value="1" {% if data[1].status_id %} checked {% endif %}>
                                                                <label for="status_id"></label>
                                                            </div>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group row">
                                                    <div class="col-md-12">
                                                        <label class="form-control-label">Offline Site
                                                            <div class="checkbox checkbox-only">
                                                                <input id="offline" type="checkbox" name="offline"
                                                                       value="1" {% if data[1].offline %} checked {% endif %}>
                                                                <label for="offline"></label>
                                                            </div>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <div class="col-md-12">
                                                        <label class="form-control-label">IP Address (For multiple use ",")</label>
                                                        <input class="form-control"  type="text" name="ip_address" placeholder="" value="{{ data[1].ip_address }}"/>
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
                            <button type="button" class="btn btn-inline btn-default">Cancel</button>
                            <button type="submit" class="btn btn-inline">Change</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
{% endblock content %}