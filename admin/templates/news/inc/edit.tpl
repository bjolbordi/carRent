{% extends "index.tpl" %}

{% block content %}
    <div class="page-content">
        <div class="container-fluid">
            <form action="" method="post" enctype='multipart/form-data'>
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
                                <section class="tabs-section">
                                    <!--.tabs-section-nav-->
                                    <div class="tab-content">
                                        <div class="row">
                                            <div class="col-md-12 md-mb-30">
                                                Photo Sizes: Small ({{ constants.NEWS_WIDTH_S }}X{{ constants.NEWS_HEIGHT_S }}),
                                                Large ({{ constants.NEWS_WIDTH_L }}X{{ constants.NEWS_HEIGHT_L }})
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <label class="btn btn-primary" for="my-file-selector">
                                                            <i class="fa fa-paperclip"></i>
                                                            <input id="my-file-selector" type="file" name="images[]" style="display:none;" onchange="$('#upload-file-info').html($(this).val());" multiple>
                                                            Upload Image
                                                        </label>
                                                        <span class='label label-info' id="upload-file-info"></span>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            {% if images | length > 0 %}
                                                                {% for img in images %}
                                                                    {% set cover = '' %}
                                                                    {% if img.content_photo_cover %}
                                                                        {% set cover = 'cover' %}
                                                                    {% endif %}
                                                                    <div class="image-div col-md-2 {{ cover }}" id="{{ img.content_photo_id }}">
                                                                        <img class="img-thumbnail" src="{{ constants.SITE_URL }}upload/news/s_{{ img.content_photo_name }}" alt="">
                                                                        <div class="image-action text-center">
                                                                            <div class="cover-image btn btn-sm" data-url="{{ globals.uri }}news/coverimage">Cover</div>
                                                                            <div class="remove-image btn btn-danger btn-sm" data-url="{{ globals.uri }}news/removeimage">Delete</div>
                                                                        </div>
                                                                    </div>
                                                                {% endfor %}
                                                            {% else %}
                                                                Photos not found.
                                                            {% endif %}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        {% if message %}
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="alert alert-success alert-no-border alert-close alert-dismissible fade in"
                                                         role="alert">
                                                        <button type="button" class="close" data-dismiss="alert"
                                                                aria-label="Close">
                                                            <span aria-hidden="true">×</span>
                                                        </button>
                                                        {{ message }}
                                                    </div>
                                                </div>
                                            </div>
                                        {% endif %}
                                    </div>
                                    <!--.tab-content-->
                                </section>
                                <!--.tabs-section-->

                            </div>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group pull-right">
                            <button type="submit" class="btn btn-inline">Save</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
{% endblock content %}

{% block footer %}
    <script type="text/javascript" src="{{ constants.URL }}editor/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="{{ constants.URL }}templates/assets/views/product/js/product.js"></script>
{% endblock footer %}
