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
                                <!--.tabs-section-->
                                <div class="card">
                                    <div class="card-block row">
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <div class="col-md-12">
                                                    <label class="form-control-label">Code</label>
                                                        <div class="">
                                                            <textarea class="form-control"
                                                                      name="code" rows="10">{{ data.code }}</textarea>
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
                            <button type="submit" class="btn btn-inline">Change</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
{% endblock content %}