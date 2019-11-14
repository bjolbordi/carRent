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
                        <a href="{{ globals.uri }}attribute/additem/{{ globals.route[3] }}/" class="btn btn-primary btn-md"><i
                                class="fa fa-plus fa-sm"></i> Add Attribute value</a>
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
                            <h2>Attribute values List</h2>
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
                        <th>Color</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody data-url="attribute/items/{{ globals.route[3] }}">
                    {% for v in items %}
                        <tr data-id="{{ v.attr_value_id }}">
                            <td class="table-check">
                                <div class="checkbox checkbox-only">
                                    <input type="checkbox" id="table-check-1"/>
                                    <label for="table-check-1"></label>
                                </div>
                            </td>
                            <td>{{ v.attr_value_id }}</td>
                            <td>{{ v.title }}</td>
                            <td style="{{ v.color ? 'background-color:' ~ v.color }}"><span class="{{ v.color ? 'btn' }}">{{ v.color }}</span></td>
                            <td class="">
                                <div class="btn-group" role="group" aria-label="...">
                                    <a href="{{ globals.uri }}attribute/edititem/{{ v.attr_id }}/{{ v.attr_value_id }}/" class="btn btn-default btn-sm"><i
                                                class="fa fa-edit"></i></a>
                                    <a href="{{ globals.uri }}attribute/removeitem/{{ v.attr_value_id }}/"
                                       class="btn btn-danger btn-sm remove" data-id="{{ v.attr_value_id }}"><i class="fa fa-remove"></i></a>
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
