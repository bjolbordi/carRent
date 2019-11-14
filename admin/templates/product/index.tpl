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
                    <div class="col-md-7 tbl-cell">
                        <a href="{{ globals.uri }}product/add/" class="btn btn-primary btn-md"><i
                                class="fa fa-plus fa-sm"></i> Add Product</a>
                    </div>
                    <form action="{{ globals.uri ~ 'product/' }}">
                        <div class="col-md-4 text-right">
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                    </div>
                                    <input type="text" name="word" class="form-control" placeholder="Search Keword" value="{{ get.word }}">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1 text-right">
                            <div class="form-group">
                                <button type="submit" class="btn btn-rounded btn-inline btn-primary">Search</button>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
        <br>
        <div class="container-fluid">
            <section class="box-typical">
                <header class="box-typical-header">
                    <div class="tbl-row">
                        <div class="tbl-cell tbl-cell-title">
                            <h2>Product List</h2>
                        </div>
                    </div>
                </header>
                <div class="box-typical-body">
                  <div class="table-responsive">
                    <table id="table-edit" class="table table-hover">
                    <thead>
                    <tr>
                        <th class="table-check">
                            <div class="checkbox checkbox-only">
                                <input type="checkbox" id="table-check-head"/>
                                <label for="table-check-head"></label>
                            </div>
                        </th>
                        <th>ID</th>
                        <th>image</th>
                        <th>Title</th>
                        <th>Status</th>
                        <th>PipeDrive</th>
                        <th>Views</th>
                        <th>Created date</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    {% for p in items %}
                        {% if p.image %}
                            {% set src = '<img src="' ~ constants.SITE_URL ~ 'upload/product/s_' ~ p.image ~ '" height="50"/>' %}
                        {% else %}
                            {% set src = '<img src="' ~ constants.URL ~ 'templates/assets/img/no-image.png" height="50"/>' %}
                        {% endif %}
                        <tr data-id="{{ p.product_id }}">
                            <td class="table-check">
                                <div class="checkbox checkbox-only">
                                    <input type="checkbox" id="table-check-1"/>
                                    <label for="table-check-1"></label>
                                </div>
                            </td>
                            <td>{{ p.product_id }}</td>
                            <td>{{ src | raw }}</td>
                            <td>{{ p.title }}</td>
                            <td>{{ p.status_id == 1 ? '<span class="color-green">Published</span>' : '<span class="color-red">Disabled</span>' }}</td>
                            <td>{{ p.pipedrive_id > 0 ? '<span class="color-green">PipeDrive</span>' : '<span class="color-red">PipeDrive</span>' }}</td>
                            <td>{{ p.views }}</td>
                            <td>{{ p.created_date }}</td>
                            <td class="">
                                <div class="btn-group" role="group" aria-label="...">
                                    <a href="{{ globals.uri }}product/edit/{{ p.product_id }}/" class="btn btn-default btn-sm"><i
                                                class="fa fa-edit"></i></a>
                                    <a href="{{ globals.uri }}product/remove/{{ p.product_id }}/"
                                       class="btn btn-danger btn-sm remove" data-id="{{ p.product_id }}"><i class="fa fa-remove"></i></a>
                                </div>
                            </td>
                        </tr>
                    {% endfor %}
                    </tbody>
                </table>
                </div>
              </div>
            </section>
            <!--.box-typical-->
            <nav>
                {% include 'inc/pagination.tpl' with {
                currentPage: Page,
                perPage: constants.CONTENT_PER_PAGE,
                paginationPath: globals.uri ~ 'product/?' ~ Url ~ '&page=',
                contentCount: ContentCount,
                showAlwaysFirstAndLast: true
                } only %}
            </nav>
        </div>
        <!--.container-fluid-->
    </div><!--.page-content-->
{% endblock content %}

{% block footer %}
{% endblock footer %}
