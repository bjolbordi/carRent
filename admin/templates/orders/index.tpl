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
                    <form action="{{ globals.uri ~ 'orders/' }}">
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
                            <h2>Order List</h2>
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
                        <th>Amount</th>
                        <th>Firstname</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>PipeDrive Status</th>
                        <th>Created date</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    {% for p in items %}
                        <tr data-id="{{ p.product_id }}">
                            <td class="table-check">
                                <div class="checkbox checkbox-only">
                                    <input type="checkbox" id="table-check-1"/>
                                    <label for="table-check-1"></label>
                                </div>
                            </td>
                            <td>{{ p.order_id }}</td>
                            <td>{{ p.amount }}</td>
                            <td>{{ p.user_first_name }}</td>
                            <td>{{ p.user_phone }}</td>
                            <td>{{ p.user_email }}</td>
                            <td>{{ p.status_id == 1 ? '<span class="color-green">PipeDrive</span>' : '<span class="color-red">PipeDrive</span>' }}</td>
                            <td>{{ p.insert_date }}</td>
                            <td class="">
                                <div class="btn-group" role="group" aria-label="...">
                                    <a href="{{ globals.uri }}orders/detail/{{ p.order_id }}/" class="btn btn-default btn-sm"><i
                                                class="fa fa-search-plus"></i></a>
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
                paginationPath: globals.uri ~ 'orders/?' ~ Url ~ '&page=',
                contentCount: ContentCount,
                showAlwaysFirstAndLast: true
                } only %}
            </nav>
        </div>
        <!--.container-fluid-->
    </div><!--.page-content-->
{% endblock content %}

{% block footer %}
    <script src="{{ constants.URL }}templates/assets/js/lib/jgrowl/jquery.jgrowl.js"></script>
    <script src="{{ constants.URL }}templates/assets/views/portfolio/js/portfolio.js"></script>
{% endblock footer %}
