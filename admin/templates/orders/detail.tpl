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
                        <a href="{{ globals.uri }}orders/" class="btn btn-primary btn-md"><i
                                    class="fa fa-arrow-left fa-sm"></i> Back</a>
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
                            <h2>Order Products</h2>
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
                        <th>Product ID</th>
                        <th>Title</th>
                        <th>Variation</th>
                        <th>Amount</th>
                        <th>Quantity</th>
                        <th>SKU</th>
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
                            <td>{{ p.product_id }}</td>
                            <td>{{ p.title }}</td>
                            <td>{{ p.attr }}</td>
                            <td>{{ p.price }} ({{ p.product_price }})</td>
                            <td>{{ p.quantity }}</td>
                            <td>{{ p.sku ? p.sku : p.variant.sku }}</td>
                            <td>{{ p.insert_date }}</td>
                            <td class="">
                                <div class="btn-group" role="group" aria-label="...">
                                    <a href="{{ constants.SITE_URL }}{{ constants.DEFAULT_LANG }}/product/detail/{{ p.product_id }}/{{  p.variant_id }}" class="btn btn-default btn-sm" target="_blank"><i
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
        </div>
        <!--.container-fluid-->
    </div><!--.page-content-->
{% endblock content %}

{% block footer %}
    <script src="{{ constants.URL }}templates/assets/js/lib/jgrowl/jquery.jgrowl.js"></script>
    <script src="{{ constants.URL }}templates/assets/views/portfolio/js/portfolio.js"></script>
{% endblock footer %}
