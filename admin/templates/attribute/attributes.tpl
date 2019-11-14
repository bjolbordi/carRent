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
                    <div class="tbl-cell">
                        <a href="{{ globals.uri }}attribute/addattribute/" class="btn btn-primary btn-md"><i
                                class="fa fa-plus fa-sm"></i> Add Attribute</a>
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
                            <h2>Attributes List</h2>
                        </div>
                    </div>
                </header>
                <div class="box-typical-body">
                  <div class="table-responsive">
                    <table id="table-edit" class="table table-hover sortable">
                    <thead>
                    <tr>
                        <th class="table-check">
                            <div class="checkbox checkbox-only">
                                <input type="checkbox" id="table-check-head"/>
                                <label for="table-check-head"></label>
                            </div>
                        </th>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Type</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody data-url="attribute">
                    {% for a in attributes %}
                        <tr data-id="{{ a.attr_id }}">
                            <td class="table-check">
                                <div class="checkbox checkbox-only">
                                    <input type="checkbox" id="table-check-1"/>
                                    <label for="table-check-1"></label>
                                </div>
                            </td>
                            <td>{{ a.attr_id }}</td>
                            <td><a href="{{ globals.uri }}attribute/items/{{ a.attr_id }}/">{{ a.title }}</a></td>
                            <td>{{ a.attr_type }}</td>
                            <td class="">
                                <div class="btn-group" role="group" aria-label="...">
                                    <a href="{{ globals.uri }}attribute/editattribute/{{ a.attr_id }}/" class="btn btn-default btn-sm"><i
                                                class="fa fa-edit"></i></a>
                                    <a href="{{ globals.uri }}attribute/removeattribute/{{ a.attr_id }}/"
                                       class="btn btn-danger btn-sm remove" data-id="{{ a.attr_id }}"><i class="fa fa-remove"></i></a>
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

        </div>
        <!--.container-fluid-->
    </div><!--.page-content-->
{% endblock content %}

{% block footer %}
    <script src="{{ constants.URL }}templates/assets/js/lib/jgrowl/jquery.jgrowl.js"></script>
    <script src="{{ constants.URL }}templates/assets/views/attribute/js/attribute.js"></script>
{% endblock footer %}
