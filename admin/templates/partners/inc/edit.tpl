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
                                <div class="card">
                                    <div class="card-block row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <div class="col-md-12">
                                                    <label class="form-control-label">Partner Link</label>

                                                    <div class="">
                                                        <input type="text" class="form-control"
                                                               name="url"
                                                               data-validation="[NOTEMPTY]"
                                                               placeholder="url" value="{{ partner.url }}"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 md-mb-30">
                                            Photo Size: ({{ constants.PARTNER_WIDTH_L }}X{{ constants.PARTNER_HEIGHT_L }})
                                        </div>
                                        <div class="col-md-12">
                                            {% if partner.image %}
                                                {% set src = '<img src="' ~ constants.SITE_URL ~ 'upload/partners/' ~ partner.image ~ '" height="50"/>' %}
                                            {% else %}
                                                {% set src = '<img src="' ~ constants.URL ~ 'templates/assets/img/no-image.png" height="50"/>' %}
                                            {% endif %}
                                            <div class="form-group row">
                                                <div class="col-md-12">

                                                    <div class="col-md-8">
                                                        <div class="col-md-3">
                                                            {{ src | raw }}
                                                        </div>
                                                        <label class="btn btn-primary" for="my-file-selector">
                                                            <i class="fa fa-paperclip"></i>
                                                            <input id="my-file-selector" type="file" name="image" style="display:none;" onchange="$('#upload-file-info').html($(this).val());"
                                                                   data-validation="[NOTEMPTY]"
                                                                   data-validation-message="Please select image" >
                                                            Upload Image
                                                        </label>
                                                        <span class='label label-info' id="upload-file-info"></span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            {% if message %}
                                                <div class="alert alert-success alert-no-border alert-close alert-dismissible fade in" role="alert">
                                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                        <span aria-hidden="true">×</span>
                                                    </button>
                                                    {{ message }}
                                                </div>
                                            {% endif %}
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group pull-right">
                            <button type="button" class="btn btn-inline btn-default">Cancel</button>
                            <button type="submit" class="btn btn-inline">Change</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
{% endblock content %}
{% block footer %}
    <script type="text/javascript" src="{{ constants.URL }}editor/ckeditor/ckeditor.js"></script>
{% endblock footer %}