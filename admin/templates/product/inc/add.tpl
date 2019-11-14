{% extends "index.tpl" %}

{% block header %}
    <link rel="stylesheet" href="{{ constants.URL }}templates/assets/css/lib/jgrowl/jquery.jgrowl.css">
    <link rel="stylesheet" href="{{ constants.URL }}templates/assets/js/lib/bootstrap-fileinput-master/css/fileinput.css">
{% endblock header %}

{% block content %}
    <div class="page-content">
        <div class="container-fluid">
            <form action="" method="post" enctype='multipart/form-data'>
                <header class="section-header">
                    <div class="tbl">
                        <div class="tbl-row">
                            <div class="tbl-cell">
                                <h2>{{ menuItem.title }} - New Product</h2>

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
                                    <div class="tabs-section-nav">
                                        <div class="tbl">
                                            <ul class="nav" role="tablist">
                                                <li class="nav-item">
                                                    <a class="nav-link active"
                                                       href="#tabs-general" role="tab"
                                                       data-toggle="tab">
                                                        <span class="nav-link-in">General</span>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link"
                                                       href="#tabs-photos" role="tab"
                                                       data-toggle="tab">
                                                        <span class="nav-link-in">Photos</span>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link"
                                                       href="#tabs-variants" role="tab"
                                                       data-toggle="tab">
                                                        <span class="nav-link-in">Variants</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="tab-content">
                                        <!-- General -->
                                        <div role="tabpanel" class="tab-pane fade in active" id="tabs-general">
                                            <!--.tabs-section-nav-->
                                            <div class="col-lg-3 row">
                                                <div class="tabs-section-nav">
                                                    <div class="tbl">
                                                        <ul class="nav" role="tablist">
                                                            {% for key,lang in json_decode(constants.LANGS, true) %}
                                                                {% set lang = lang.id %}
                                                                <li class="nav-item">
                                                                    <a class="nav-link {% if loop.index == 1 %} active {% endif %}"
                                                                       href="#tabs-2-tab-{{ lang }}" role="tab"
                                                                       data-toggle="tab">
                                                                        <span class="nav-link-in">{{ key }}</span>
                                                                    </a>
                                                                </li>
                                                            {% endfor %}
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--.tabs-section-nav-->
                                            <div class="tab-content">
                                                {% for lang in json_decode(constants.LANGS, true) %}
                                                    {% set lang = lang.id %}
                                                    <div role="tabpanel"
                                                         class="tab-pane fade in {% if loop.index == 1 %} active {% endif %}"
                                                         id="tabs-2-tab-{{ lang }}">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group row">
                                                                    <div class="col-md-12">
                                                                        <label class="form-control-label">Title</label>

                                                                        <div class="">
                                                                            <input type="text" class="form-control"
                                                                                   name="{{ lang }}[title]"
                                                                                   placeholder="Name"
                                                                                   value="{{ post.title }}">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group row">
                                                                    <div class="col-md-12">
                                                                        <label class="form-control-label">Description</label>

                                                                        <div class="">
                                                                    <textarea class="form-control ckeditor"
                                                                              name="{{ lang }}[desc]">{{ post.desc }}</textarea>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                {% endfor %}
                                            </div>

                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Featured</label>

                                                            <div class="checkbox checkbox-only">
                                                                <input id="featured" type="checkbox"
                                                                       name="featured"
                                                                       value="1">
                                                                <label for="featured"></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Price</label>
                                                            <div>
                                                                <input type="text" class="form-control"
                                                                       name="price"
                                                                       placeholder="Price"
                                                                       value="0">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Sale (Price)</label>
                                                            <div>
                                                                <input type="text" class="form-control"
                                                                       name="sale"
                                                                       placeholder="Sale"
                                                                       value="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Sale End Date</label>

                                                            <div class="date">
                                                                <input type="text" class="form-control datetimepicker-1"
                                                                       name="sale_end_date"
                                                                       placeholder="Name"
                                                                       value="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 col-xs-12">
                                                    <div class="form-group">
                                                        <label class="form-control-label">Brand</label>
                                                        <select  class="select2" name="brand_id">
                                                            <option value="0">None</option>
                                                            {% for b in brands %}
                                                                <option value="{{ b.brand_id }}">{{ b.title }}</option>
                                                            {% endfor %}
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 col-xs-12">
                                                    <div class="form-group">
                                                        <label class="form-control-label">Category</label>
                                                        <select  class="select2" name="categories[]" multiple="multiple">
                                                            {% for c in categories %}
                                                                <option value="{{ c.category_id }}">{{ c.title }}</option>
                                                            {% endfor %}
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Photos -->
                                        <div role="tabpanel" class="tab-pane fade in" id="tabs-photos">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="control-label"> Upload Image</label>
                                                            <input id="my-file-selector" class="file-loading" type="file" name="images[]"  multiple>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Variants -->
                                        <div role="tabpanel" class="tab-pane fade in" id="tabs-variants">
                                            variants
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
    <script type="text/javascript" src="{{ constants.URL }}templates/assets/js/lib/bootstrap-fileinput-master/plugins/sortable.min.js"></script>
    <script type="text/javascript" src="{{ constants.URL }}templates/assets/js/lib/bootstrap-fileinput-master/fileinput.js"></script>
    <script type="text/javascript">
        $("#my-file-selector").fileinput({
            uploadUrl: "{{ globals.uri }}product/UploadImage/{{ product_id }}",
            uploadAsync: false,
            minFileCount: 1,
            maxFileCount: 12,
            overwriteInitial: false,
            showCaption: true,
            showClose: false,
            showUpload: true,
            showCancel: false,
            allowedFileExtensions: ['jpg','png'],
            previewSettings: {
                image: { width: "auto", height: "160px"}
            },
        }).on('filesorted', function(e, params) {
            console.log('File sorted params', params);
        }).on('fileuploaded', function(e, params) {
            console.log(params);
        });
    </script>
{% endblock footer %}
