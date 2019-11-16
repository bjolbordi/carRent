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
                                                                                   name="{{ lang }}[car_title]"
                                                                                   placeholder="Name"
                                                                                   value="{{ post.car_title }}">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <div class="form-group row">
                                                                    <div class="col-md-12">
                                                                        <label class="form-control-label">Car Model</label>

                                                                        <div class="">
                                                                            <input type="text" class="form-control"
                                                                                   name="{{ lang }}[car_model]"
                                                                                   placeholder="Name"
                                                                                   value="{{ post.car_model }}">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <div class="form-group row">
                                                                    <div class="col-md-12">
                                                                        <label class="form-control-label">Car Class</label>

                                                                        <div class="">
                                                                            <input type="text" class="form-control"
                                                                                   name="{{ lang }}[car_class]"
                                                                                   placeholder="Name"
                                                                                   value="{{ post.car_class }}">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <div class="form-group row">
                                                                    <div class="col-md-12">
                                                                        <label class="form-control-label">Car Body Style</label>

                                                                        <div class="">
                                                                            <input type="text" class="form-control"
                                                                                   name="{{ lang }}[car_bstyle]"
                                                                                   placeholder="Name"
                                                                                   value="{{ post.car_bstyle }}">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <div class="form-group row">
                                                                    <div class="col-md-12">
                                                                        <label class="form-control-label">Car Transmission</label>

                                                                        <div class="">
                                                                            <input type="text" class="form-control"
                                                                                   name="{{ lang }}[car_transmission]"
                                                                                   placeholder="Name"
                                                                                   value="{{ post.car_transmission }}">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Seats</label>
                                                            <div>
                                                                <input type="text" class="form-control"
                                                                       name="{{ lang }}[car_seats]"
                                                                       placeholder="Seats"
                                                                       value="0">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Luggage</label>
                                                            <div>
                                                                <input type="text" class="form-control"
                                                                       name="{{ lang }}[car_luggage]"
                                                                       placeholder="Luggage"
                                                                       value="0">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Mileage</label>
                                                            <div>
                                                                <input type="text" class="form-control"
                                                                       name="{{ lang }}[car_mileage]"
                                                                       placeholder="Mileage"
                                                                       value="0">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Fuel</label>
                                                            <div>
                                                                <input type="text" class="form-control"
                                                                       name="{{ lang }}[car_fuel]"
                                                                       placeholder="Fuel"
                                                                       value="">
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
                                                                              name="{{ lang }}[car_desc]">{{ post.desc }}</textarea>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                {% endfor %}
                                            </div>

                                            <div class="row">
                                                
                                                <div class="col-md-12">
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
                                                            <label class="form-control-label">Airconditions</label>

                                                            <div class="checkbox checkbox-only">
                                                                <input id="airconditions" type="checkbox"
                                                                       name="airconditions"
                                                                       value="1" checked>
                                                                <label for="airconditions"></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Music</label>

                                                            <div class="checkbox checkbox-only">
                                                                <input id="music" type="checkbox"
                                                                       name="music"
                                                                       value="1" checked>
                                                                <label for="music"></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Water</label>

                                                            <div class="checkbox checkbox-only">
                                                                <input id="water" type="checkbox"
                                                                       name="water"
                                                                       value="1" checked>
                                                                <label for="water"></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Audio input</label>

                                                            <div class="checkbox checkbox-only">
                                                                <input id="audio_input" type="checkbox"
                                                                       name="audio_input"
                                                                       value="1" checked>
                                                                <label for="audio_input"></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Climat Control</label>

                                                            <div class="checkbox checkbox-only">
                                                                <input id="climate_control" type="checkbox"
                                                                       name="climate_control"
                                                                       value="1" checked>
                                                                <label for="climate_control"></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Child Seats</label>

                                                            <div class="checkbox checkbox-only">
                                                                <input id="child_seats" type="checkbox"
                                                                       name="child_seats"
                                                                       value="1" checked>
                                                                <label for="child_seats"></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Aux</label>

                                                            <div class="checkbox checkbox-only">
                                                                <input id="aux" type="checkbox"
                                                                       name="aux"
                                                                       value="1" checked>
                                                                <label for="aux"></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Bluetooth</label>

                                                            <div class="checkbox checkbox-only">
                                                                <input id="bluetooth" type="checkbox"
                                                                       name="bluetooth"
                                                                       value="1" checked>
                                                                <label for="bluetooth"></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Car Kit</label>

                                                            <div class="checkbox checkbox-only">
                                                                <input id="car_kit" type="checkbox"
                                                                       name="car_kit"
                                                                       value="1" checked>
                                                                <label for="car_kit"></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">GPS</label>

                                                            <div class="checkbox checkbox-only">
                                                                <input id="gps" type="checkbox"
                                                                       name="gps"
                                                                       value="1" checked>
                                                                <label for="gps"></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Seat Belts</label>

                                                            <div class="checkbox checkbox-only">
                                                                <input id="seat_belts" type="checkbox"
                                                                       name="seat_belts"
                                                                       value="1" checked>
                                                                <label for="seat_belts"></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Onboard Computer</label>

                                                            <div class="checkbox checkbox-only">
                                                                <input id="onboard_computer" type="checkbox"
                                                                       name="onboard_computer"
                                                                       value="1" checked>
                                                                <label for="onboard_computer"></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label class="form-control-label">Remote Central Looking</label>

                                                            <div class="checkbox checkbox-only">
                                                                <input id="remote_central_looking" type="checkbox"
                                                                       name="remote_central_looking"
                                                                       value="1" checked>
                                                                <label for="remote_central_looking"></label>
                                                            </div>
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
