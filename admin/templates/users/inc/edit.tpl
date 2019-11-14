{% extends "index.tpl" %}

{% block header %}
{% endblock header %}

{% block content %}
    <div class="page-content">
        <div class="container-fluid">
            <header class="section-header">
                <div class="tbl">
                    <div class="tbl-row">
                        <div class="tbl-cell text-center">
                            <h2>{{ menuItem.title }}</h2>

                            <div class="subtitle"></div>
                        </div>
                    </div>
                </div>
            </header>
            <div class="row">
                <form action="" method="post">
                    <div class="col-md-6 col-md-offset-3">
                        <section class="card">
                            <header class="card-header card-header-lg center-block">
                                Edit User
                            </header>
                            <div class="card-block center-block">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group row">
                                            <div class="col-md-12">
                                                <div class="">
                                                    <input type="text" class="form-control" name="username" placeholder="UserName" value="{{ user.username }}" data-validation="[MIXED, L>=4, L<=24]" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-12">
                                                <div class="">
                                                    <input type="email" class="form-control" name="email" placeholder="Email" value="{{ user.email }}" data-validation="[EMAIL]">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-12">
                                                <div class="">
                                                    <input type="password" class="form-control" name="password" placeholder="Password">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-12">
                                                <div class="">
                                                    <input type="password" class="form-control" name="password2" placeholder="Repeat Password" data-validation="[V==password]" data-validation-message="Passwords not match">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-12">
                                                <div class="">
                                                    <label>User Discount Percent</label>
                                                    <select class="form-control" name="discount">
                                                        {% for i in range (0, 99) %}
                                                            <option value="{{ i }}" {{ i == user.discount ? 'selected' }}>{{ i }} %</option>
                                                        {% endfor %}
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-12">
                                                <div class="">
                                                    <label>User Status</label>
                                                    <select class="form-control" name="status">
                                                        <option value="0">Inactive</option>
                                                        <option value="1" {{ user.status == 1 ? 'selected' }}>Active</option>
                                                        <option value="2" {{ user.status == 2 ? 'selected' }}>Banned</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-12">
                                                <div class="">
                                                    <label>User Role</label>
                                                    <select class="form-control" name="role">
                                                        {% if user.role == 1 %}
                                                            <option value="1">Super Admin</option>
                                                        {% else %}
                                                            <option value="2">Admin</option>
                                                            <option value="3" {{ user.role == 3 ? 'selected' }}>Normal user</option>
                                                        {% endif %}
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        {% if message %}
                                        <div class="alert alert-danger alert-no-border alert-close alert-dismissible fade in" role="alert">
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                            {{ message }}
                                        </div>
                                        {% endif %}
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group pull-right">
                                            <button type="submit" class="btn btn-inline">Save</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </form>
            </div>
        </div>
    </div>
{% endblock content %}


{% block footer %}
{% endblock footer %}
