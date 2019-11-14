{% extends "index.tpl" %}

{% block header %}
    <link rel="stylesheet" href="{{ constants.URL }}templates/assets/css/lib/jgrowl/jquery.jgrowl.css">
{% endblock header %}

{% block content %}
    <div class="page-content">
        <div class="container-fluid">
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
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-2">
                        <div class="tbl-cell">
                            <a href="{{ constants.SITE_URL ~ constants.DEFAULT_LANG }}/cron/langsgenerator/" target="_blank" class="btn btn-primary btn-md"><i
                                        class="fa fa-plus fa-sm"></i> Generate Langs</a>
                        </div>
                    </div>
                    <div class="col-md-3 col-md-offset-right-7">
                    <div class="form-group row">
                        <div class="col-md-12">
                            <div class="">
                                <input type="search" class="form-control search" name="word" placeholder="Search" value="">
                            </div>
                        </div>
                    </div>
                        </div>
                </div>

            </div>
        </div>
        <br>
        <div class="container-fluid">
            <section class="box-typical">
                <header class="box-typical-header">
                    <div class="tbl-row">
                        <div class="tbl-cell tbl-cell-title">
                            <h2>Languages List</h2>
                        </div>
                    </div>
                </header>
                <div class="box-typical-body">
                  <div class="table-responsive">
                    <table id="table-edit" class="table table-hover ">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Lang var</th>
                        {% for key,lang in json_decode(constants.LANGS, true) %}
                            <th>{{ key }}</th>
                        {% endfor %}
                    </tr>
                    </thead>
                    <tbody id="langs-tbody">
                    {% for l in langs %}
                        <tr>
                            <td>{{ l.id }}</td>
                            <td>{{ l.lang_var }}</td>
                            {% for key,lang in json_decode(constants.LANGS, true) %}
                                <td><textarea class="form-control lang-textarea" data-id="{{ l.id }}" data-lang="{{ key }}" data-content="Language saved" data-placement="top">{{ l["lang_"~ key] }}</textarea></td>
                            {% endfor %}
                        </tr>
                    {% endfor %}
                    </tbody>
                </table>
                </div>
              </div>
            </section>
            <!--.box-typical-->

        </div>
        <!--.container-fluid-->
    </div><!--.page-content-->
{% endblock content %}


{% block footer %}
    <script src="{{ constants.URL }}templates/assets/js/lib/jgrowl/jquery.jgrowl.js"></script>
    <script src="{{ constants.URL }}templates/assets/views/translate/js/translate.js"></script>
{% endblock footer %}
