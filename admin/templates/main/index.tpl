{% extends "index.tpl" %}


{% block header %}
{% endblock header %}



{% block content %}
    <div class="page-content">
        <div class="container-fluid">
            <header class="section-header">
                <div class="tbl">
                    <div class="tbl-row">
                        <div class="tbl-cell">
                            <h2>Home Page</h2>

                            <div class="subtitle">Change slider images and caption. Change content text</div>
                        </div>
                    </div>
                </div>
            </header>
            <div class="row">
                <div class="col-xl-12">
                    <div class="row">
                        <div class="col-sm-6">
                            <article class="statistic-box red">
                                <div>
                                    <div class="number">{{ admins }}</div>
                                    <div class="caption"><div>Admins count</div></div>
                                    <div class="percent">
                                        <div class="arrow up"></div>
                                        <p>15%</p>
                                    </div>
                                </div>
                            </article>
                        </div><!--.col-->
                        <div class="col-sm-6">
                            <article class="statistic-box purple">
                                <div>
                                    <div class="number">{{ users }}</div>
                                    <div class="caption"><div>Users count</div></div>
                                    <div class="percent">
                                        <div class="arrow down"></div>
                                        <p>11%</p>
                                    </div>
                                </div>
                            </article>
                        </div><!--.col-->
                        <div class="col-sm-6">
                            <article class="statistic-box yellow">
                                <div>
                                    <div class="number">{{ pages }}</div>
                                    <div class="caption"><div>Pages count</div></div>
                                    <div class="percent">
                                        <div class="arrow down"></div>
                                        <p>5%</p>
                                    </div>
                                </div>
                            </article>
                        </div><!--.col-->
                        <div class="col-sm-6">
                            <article class="statistic-box green">
                                <div>
                                    <div class="number">{{ slides }}</div>
                                    <div class="caption"><div>Slides count</div></div>
                                    <div class="percent">
                                        <div class="arrow up"></div>
                                        <p>84%</p>
                                    </div>
                                </div>
                            </article>
                        </div><!--.col-->
                    </div><!--.row-->
                </div>
            </div>
        </div>
    </div>
{% endblock content %}


{% block footer %}
{% endblock footer %}
