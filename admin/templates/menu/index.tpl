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
                        <a href="{{ globals.uri }}menu/add/" class="btn btn-primary btn-md"><i
                                    class="fa fa-plus fa-sm"></i> Add Menu</a>
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
                            <h2>Menu List</h2>
                        </div>
                    </div>
                </header>
                <div class="container-fluid">
                    <div class="container-fluid">

                        <ul id="sortable" class="sortable level-1">
                            {% for menuId in data.parents[0] %}
                                    <li data-id="{{ data.items[menuId].id }}">
                                        <table class="table menu">
                                            <tr>
                                                <td class="col-lg-1">#{{ data.items[menuId].id }}</td>
                                                <td class="col-lg-3">{{ data.items[menuId].alias }}</td>
                                                <td class="col-lg-3">{{ data.items[menuId].title }}</td>
                                                <td class="col-lg-2">{{ data.items[menuId].view }} {{ data.items[menuId].home ? '<span class="color-red"> (Home Page)</span>' }}</td>
                                                <td class="col-lg-3">
                                                    <div class="btn-group pull-right" role="group" aria-label="...">
                                                        <a href="{{ globals.uri }}menu/edit/{{ data.items[menuId].id }}/"
                                                           class="btn btn-default btn-sm"><i
                                                                    class="fa fa-edit"></i></a>
                                                        <a href="{{ globals.uri }}menu/remove/{{ data.items[menuId].id }}/"
                                                           class="btn btn-danger btn-sm remove"
                                                           data-id="{{ data.items[menuId].id }}"><i class="fa fa-remove"></i></a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                        <ul id="sortable" class="sortable level-2">
                                            {% if  data.parents[data.items[menuId].id] | length %}
                                                {% for ChildId in data.parents[data.items[menuId].id] %}
                                                        <li data-id="{{ data.items[ChildId].id }}">
                                                            <table class="table menu">
                                                                <tr>
                                                                    <td class="col-lg-1">#{{ data.items[ChildId].id }}</td>
                                                                    <td class="col-lg-3">{{ data.items[ChildId].alias }}</td>
                                                                    <td class="col-lg-3">{{ data.items[ChildId].title }}</td>
                                                                    <td class="col-lg-2">{{ data.items[ChildId].view }} {{ data.items[menuId].home ? '<span class="color-red"> (Home Page)</span>' }}</td>
                                                                    <td class="col-lg-3">
                                                                        <div class="btn-group pull-right" role="group" aria-label="...">
                                                                            <a href="{{ globals.uri }}menu/edit/{{ data.items[ChildId].id }}/"
                                                                               class="btn btn-default btn-sm"><i
                                                                                        class="fa fa-edit"></i></a>
                                                                            <a href="{{ globals.uri }}menu/remove/{{ data.items[ChildId].id }}/"
                                                                               class="btn btn-danger btn-sm remove"
                                                                               data-id="{{ data.items[ChildId].id }}"><i class="fa fa-remove"></i></a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <ul  id="sortable" class="sortable level-3">
                                                                {% if  data.parents[data.items[ChildId].id] | length %}
                                                                    {% for ChildId_02 in data.parents[data.items[ChildId].id] %}
                                                                        <li data-id="{{ data.items[ChildId_02].id }}">
                                                                            <table class="table menu">
                                                                                <tr>
                                                                                    <td class="col-lg-1">#{{ data.items[ChildId_02].id }}</td>
                                                                                    <td class="col-lg-3">{{ data.items[ChildId_02].alias }}</td>
                                                                                    <td class="col-lg-3">{{ data.items[ChildId_02].title }}</td>
                                                                                    <td class="col-lg-2">{{ data.items[ChildId_02].view }} {{ data.items[menuId].home ? '<span class="color-red"> (Home Page)</span>' }}</td>
                                                                                    <td class="col-lg-3">
                                                                                        <div class="btn-group pull-right" role="group" aria-label="...">
                                                                                            <a href="{{ globals.uri }}menu/edit/{{ data.items[ChildId_02].id }}/"
                                                                                               class="btn btn-default btn-sm"><i
                                                                                                        class="fa fa-edit"></i></a>
                                                                                            <a href="{{ globals.uri }}menu/remove/{{ data.items[ChildId_02].id }}/"
                                                                                               class="btn btn-danger btn-sm remove"
                                                                                               data-id="{{ data.items[ChildId_02].id }}"><i class="fa fa-remove"></i></a>
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </li>
                                                                    {% endfor %}
                                                                {% endif %}
                                                            </ul>
                                                        </li>
                                                {% endfor %}
                                            {% endif %}
                                        </ul>
                                    </li>
                            {% endfor %}
                        </ul>
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
    <script src="{{ constants.URL }}templates/assets/views/menu/js/menu.js"></script>
{% endblock footer %}
