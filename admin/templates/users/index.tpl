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
                    <div class="form-group">
                        <a href="{{ globals.uri }}users/add/" class="btn btn-primary btn-md"><i
                                    class="fa fa-plus fa-sm"></i> Add User</a>
                    </div>
                </div>
                <form action="{{ globals.uri ~ 'users/' }}">
                    <div class="col-md-4 text-right">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                </div>
                                <input type="text" name="word" class="form-control" placeholder="UserName, Email, ID" value="{{ get.word }}">
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
        <br>
        <div class="container-fluid">
            <section class="box-typical">
                <header class="box-typical-header">
                    <div class="tbl-row">
                        <div class="tbl-cell tbl-cell-title">
                            <h2>Users List</h2>
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
                        <th>UserName</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    {% for user in users %}
                        {% if user.role == 1 %}
                            {% set role = '<span class="color-red">Super Admin</span>' %}
                        {% elseif user.role == 2 %}
                            {% set role = 'Admin' %}
                        {% else %}
                            {% set role = 'Normal User' %}
                        {% endif %}

                        {% if user.status == 1 %}
                            {% set status = '<span class="color-green">Active</span>' %}
                        {% elseif user.status == 0 %}
                            {% set status = '<span class="color-red">Inactive</span>' %}
                        {% else %}
                            {% set status = '<span class="color-red">Banned</span>' %}
                        {% endif %}
                        <tr>
                            <td class="table-check">
                                <div class="checkbox checkbox-only">
                                    <input type="checkbox" id="table-check-1"/>
                                    <label for="table-check-1"></label>
                                </div>
                            </td>
                            <td>{{ user.id }}</td>
                            <td>{{ user.username }}</td>
                            <td>{{ user.email }}</td>
                            <td>{{ role | raw }}</td>
                            <td>{{ status | raw }}</td>
                            <td class="">
                                <div class="btn-group" role="group" aria-label="...">
                                    <a href="{{ globals.uri }}users/edit/{{ user.id }}/" class="btn btn-default btn-sm"><i
                                                class="fa fa-edit"></i></a>
                                    <a href="{{ globals.uri }}users/remove/{{ user.id }}/"
                                       class="btn btn-danger btn-sm remove" data-id="{{ user.id }}"><i class="fa fa-remove"></i></a>
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
                paginationPath: globals.uri ~ 'users/?' ~ Url ~ '&page=',
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
