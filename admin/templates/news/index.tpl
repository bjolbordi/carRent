{% extends "index.tpl" %}

{% block header %}
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
            <div class="row">
                <div class="col-md-7 tbl-cell">
                    <a href="{{ globals.uri }}news/add/" class="btn btn-primary btn-md"><i
                            class="fa fa-plus fa-sm"></i> Add Gallery</a>
                </div>
            </div>
        </div>
        <br>
        <div class="container-fluid">
            <section class="box-typical">
                <header class="box-typical-header">
                    <div class="tbl-row">
                        <div class="tbl-cell tbl-cell-title">
                            <h2>News List</h2>
                        </div>
                    </div>
                </header>
                <div class="box-typical-body">
                  <div class="table-responsive">
                    <table id="table-edit" class="table table-hover ">
                    <thead>
                    <tr>
                        <th class="table-check">
                            <div class="checkbox checkbox-only">
                                <input type="checkbox" id="table-check-head"/>
                                <label for="table-check-head"></label>
                            </div>
                        </th>
                        <th>ID</th>
                        <th>Created date</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    {% for p in news %}
                        <tr>
                            <td class="table-check">
                                <div class="checkbox checkbox-only">
                                    <input type="checkbox" id="table-check-1"/>
                                    <label for="table-check-1"></label>
                                </div>
                            </td>
                            <td>{{ p.id }}</td>
                            <td>{{ p.created_date }}</td>
                            <td class="">
                                <div class="btn-group" role="group" aria-label="...">
                                    <a href="{{ globals.uri }}news/edit/{{ p.id }}/" class="btn btn-default btn-sm"><i
                                                class="fa fa-edit"></i></a>
                                    <a href="{{ globals.uri }}news/remove/{{ p.id }}/"
                                       class="btn btn-danger btn-sm remove" data-id="{{ p.id }}"><i class="fa fa-remove"></i></a>
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
                paginationPath: globals.uri ~ 'news/?' ~ Url ~ '&page=',
                contentCount: ContentCount,
                showAlwaysFirstAndLast: true
                } only %}
            </nav>
        </div>
        <!--.container-fluid-->
    </div><!--.page-content-->
{% endblock content %}
