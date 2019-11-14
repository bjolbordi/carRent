{% extends "index.tpl" %}

{% block header %}
    <link rel="stylesheet" href="{{ constants.URL }}templates/assets/css/lib/jgrowl/jquery.jgrowl.css">
    <link rel="stylesheet" href="{{ constants.URL }}templates/assets/js/lib/bootstrap-fileinput-master/css/fileinput.css">
{% endblock header %}

{% block content %}
    <div class="page-content">
        <div class="container-fluid">
            <!-- Modal HTML -->
            <div id="myModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- Content will be loaded here from "remote.php" file -->
                    </div>
                </div>
            </div>
            <form action="" method="post" enctype='multipart/form-data'>
                <header class="section-header">
                    <div class="tbl">
                        <div class="tbl-row">
                            <div class="tbl-cell">
                                <h2>{{ menuItem.title }} - Edit Product</h2>
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
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="tab-content">
                                        <!-- General -->


                                        </div>
                                        <!-- Photos -->
                                        <div role="tabpanel" class="tab-pane fade in" id="tabs-photos">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="control-label md-mb-15"> Photo Sizes: Small ({{ constants.PRODUCT_WIDTH_S }}X{{ constants.PRODUCT_HEIGHT_S }}),
                                                                Medium ({{ constants.PRODUCT_WIDTH_M }}X{{ constants.PRODUCT_HEIGHT_M }}),
                                                                Large ({{ constants.PRODUCT_WIDTH_L }}X{{ constants.PRODUCT_HEIGHT_L }})</label>
                                                            <input id="my-file-selector" class="file-loading" type="file" name="images[]"  multiple>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Variants -->

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
    <script type="text/javascript" src="{{ constants.URL }}templates/assets/js/lib/jqueryui/jquery.autocomplete.js"></script>
    <script type="text/javascript" src="{{ constants.URL }}templates/assets/views/product/js/product.js"></script>
    <script type="text/javascript">
        var photos = [];
        var config = [];
        {% for img in images %}
            photos.push('{{ constants.SITE_URL }}upload/product/s_{{ img.photo_name }}');
            config.push({caption: "{{ img.photo_name }}", size: "{{ img.size }}", url: "{{ globals.uri }}product/RemoveImage/{{ img.photo_id }}", key: {{ img.photo_id }} });
        {% endfor %}

        $("#my-file-selector").fileinput({
            uploadUrl: "{{ globals.uri }}product/UploadImage/{{ item[1].product_id }}",
            uploadAsync: false,
            minFileCount: 1,
            maxFileCount: 50,
            overwriteInitial: false,
            initialPreview: photos,
            initialPreviewAsData: true, // identify if you are sending preview data only and not the raw markup
            initialPreviewFileType: 'image', // image is the default and can be overridden in config below
            initialPreviewConfig: config,
            showCaption: true,
            showClose: false,
            showUpload: true,
            showCancel: false,
            allowedFileExtensions: ['jpg','png'],
            previewSettings: {
                image: { width: "ato", height: "160px"}
            },
        }).on('filesorted', function(e, params) {
            $.ajax({
                type: 'POST',
                data: params,
                url: ADMIN_URL + LANG + '/product/SortImages/',
                success: function(data){
                    console.log(data);
                }
            });
        }).on('fileuploaded', function(e, params) {
        });
    </script>
{% endblock footer %}

