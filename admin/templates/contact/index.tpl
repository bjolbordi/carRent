{% extends "index.tpl" %}

{% block content %}
    <div class="page-content">
        <div class="container-fluid">
            <form action="" method="post">
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
                                    <!--.tabs-section-nav-->
                                    <div class="tab-content">
                                        {% for lang in json_decode(constants.LANGS, true) %}
                                            {% set lang = lang.id %}
                                            <div role="tabpanel"
                                                 class="tab-pane fade in {% if loop.index == 1 %} active {% endif %}"
                                                 id="tabs-2-tab-{{ lang }}">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Name</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control"
                                                                           name="{{ lang }}[contact_name]"
                                                                           placeholder="Name" value="{{ contact[lang].contact_name }}"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Address</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control"
                                                                           name="{{ lang }}[contact_address]"
                                                                           placeholder="Address" value="{{ contact[lang].contact_address }}"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Description</label>

                                                                <div class="">
                                                                    <textarea class="form-control ckeditor"
                                                                              name="{{ lang }}[contact_desc]">{{ contact[lang].contact_desc }}</textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Phone</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control" name="{{ lang }}[contact_phone1]"
                                                                           placeholder="Phone" value="{{ contact[lang].contact_phone1 }}"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Phone 2</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control" name="{{ lang }}[contact_phone2]"
                                                                           placeholder="Phone 2" value="{{ contact[lang].contact_phone2 }}"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Phone 3</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control" name="{{ lang }}[contact_phone3]"
                                                                           placeholder="Phone 3" value="{{ contact[lang].contact_phone3 }}"></div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Email</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control" name="{{ lang }}[contact_email1]"
                                                                           placeholder="Email" value="{{ contact[lang].contact_email1 }}"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Email 2</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control" name="{{ lang }}[contact_email2]"
                                                                           placeholder="Email 2" value="{{ contact[lang].contact_email2 }}"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Skype</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control" name="{{ lang }}[contact_skype]"
                                                                           placeholder="Skype" value="{{ contact[lang].contact_skype }}"></div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Site</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control" name="{{ lang }}[contact_site]"
                                                                           placeholder="Site" value="{{ contact[lang].contact_site }}"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Facebook</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control" name="{{ lang }}[contact_facebook]"
                                                                           placeholder="Facebook" value="{{ contact[lang].contact_facebook }}"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Twitter</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control" name="{{ lang }}[contact_twitter]"
                                                                           placeholder="Twitter" value="{{ contact[lang].contact_twitter }}"></div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Youtube</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control" name="{{ lang }}[contact_youtube]"
                                                                           placeholder="Youtube" value="{{ contact[lang].contact_youtube }}"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Google plus</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control" name="{{ lang }}[contact_google]"
                                                                           placeholder="Google plus" value="{{ contact[lang].contact_google }}"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Instagram</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control" name="{{ lang }}[contact_instagram]"
                                                                           placeholder="Instagram" value="{{ contact[lang].contact_instagram }}"></div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">Behance</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control" name="{{ lang }}[contact_behance]"
                                                                           placeholder="Behance" value="{{ contact[lang].contact_behance }}"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <label class="form-control-label">LinkedIn</label>

                                                                <div class="">
                                                                    <input type="text" class="form-control" name="{{ lang }}[contact_linkedin]"
                                                                           placeholder="LinkedIn" value="{{ contact[lang].contact_linkedin }}"></div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        {% endfor %}
                                    </div>
                                    <!--.tab-content-->
                                </section>
                                <!--.tabs-section-->
                                <div class="card">
                                    <div class="card-block row">
                                        <div class="col-md-12">
                                            <div class="gllpLatlonPicker">
                                                <div class="form-group">
                                                    <div style="height:300px;" class="gllpMap"></div>
                                                </div>

                                                <div class="form-group">
                                                    <h6>Google map cordinates </h6>
                                                </div>

                                                <div class="form-group col-md-4">
                                                    <input type="text" class="form-control gllpLatitude"
                                                           name="latitude" value="{{ latitude }}"
                                                           placeholder="Latitude"/>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <input type="text" class="form-control gllpLongitude"
                                                           name="longitude" value="{{ longitude }}"
                                                           placeholder="Longitude"/>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <input type="text" class="form-control gllpZoom" name="zoom"
                                                           value="{{ zoom }}"/>
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
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyAbFuepJJ9CxjpIwK8A8OW9kxvL9OWm9Ts"></script>
    <script src="{{ constants.URL }}templates/assets/js/lib/location-picker/jquery.locationpicker.js"></script>
    <script src="{{ constants.URL }}templates/assets/views/contact/js/contact.js"></script>
{% endblock footer %}
