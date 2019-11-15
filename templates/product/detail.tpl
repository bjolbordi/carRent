{% extends "index.tpl" %}

{% block facebook %}
    <!--<meta property="fb:app_id" content="361736430535656" /> -->
    <meta property="og:type" content="website"/>
    <meta property="og:title" content="{{ Post.title }}"/>
    <meta property="og:description" content="{{ Post.text }}"/>
    <meta property="og:url" content="{{ globals.uri }}product/detail/{{ Product.product_id }}"/>
    {% for i in Images %}
        <meta property="og:image" content="{{ constants.UPLOAD }}product/{{ i.photo_name }}"/>
    {% endfor %}
{% endblock %}

{% block content %}
   <div class="rq-page-content"> <!-- start of page content -->
        <div class="rq-listing-details">
          <div class="rq-listing-single"> <!-- start of banner slider -->
            <!-- <div class="rq-listing-gallery-post">
              <div class="rq-gallery-content">
                <div class="details-slider owl-carousel">
                  <div class="item">
                    <img src="img/car-listing-grid/toyota1.jpg" alt="">
                  </div>
                  <div class="item">
                    <img src="img/car-listing-grid/toyota2.jpg" alt="">
                  </div>
                  <div class="item">
                    <img src="img/car-listing-grid/toyota3.jpg" alt="">
                  </div>
                </div>
              </div>
            </div> -->
          </div> <!-- end of banner slider -->
          <div class="rq-content-block">
            <div class="container">
              <div class="rq-title-container bredcrumb-title text-center"> <!-- start of breadcrumb -->
                <h1 class="rq-title light">Car listing details</h1>
   <!--              <ol class="breadcrumb secondary rq-subtitle">
                  <li><a href="#">Home</a></li>
                  <li><a href="#">Car listing</a></li>
                  <li class="active">Car Listing Details</li>
                </ol> -->
              </div> <!-- end of breadcrumb -->
              <div class="rq-listing-promo-wrapper">
                <div class="row"> <!-- start of listing promo -->
                  <div class="col-md-12">
                    <div class="rq-listing-promo-content">
                      <div class="rq-listing-item">
                        <img src="{{ constants.THEME }}assets/img/listing-icon1.png" alt="">
                        <h6 class="rq-listing-item-title">Mileage</h6>
                        <h4 class="rq-listing-item-number">{{ Product.car_mileage }}</h4>
                      </div>
                      <div class="rq-listing-item">
                        <img src="{{ constants.THEME }}assets/img/listing-icon2.png" alt="">
                        <h6 class="rq-listing-item-title">Transmission</h6>
                        <h4 class="rq-listing-item-number">{{ Product.car_transmission }}</h4>
                      </div>
                      <div class="rq-listing-item">
                        <img src="{{ constants.THEME }}assets/img/listing-icon3.png" alt="">
                        <h6 class="rq-listing-item-title">Seats</h6>
                        <h4 class="rq-listing-item-number">{{ Product.car_seats }}</h4>
                      </div>
                      <div class="rq-listing-item">
                        <img src="{{ constants.THEME }}assets/img/listing-icon4.png" alt="">
                        <h6 class="rq-listing-item-title">Luggage</h6>
                        <h4 class="rq-listing-item-number">{{ Product.car_luggage }}</h4>
                      </div>
                      <div class="rq-listing-item">
                        <img src="{{ constants.THEME }}assets/img/listing-icon5.png" alt="">
                        <h6 class="rq-listing-item-title">Fuel</h6>
                        <h4 class="rq-listing-item-number">{{ Product.car_fuel }}</h4>
                      </div>
                    </div>
                  </div>
                </div> <!-- end of listing promo -->
              </div>
              <div class="rq-feature-tab">
                <div class="rq-blog-listing">
                  <!-- Nav tabs -->
                  <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#listing_tab_hor_1" aria-controls="listing_tab_hor_1" role="tab" data-toggle="tab">Features</a></li>
                    <!-- <li role="presentation" ><a href="#listing_tab_hor_2" aria-controls="listing_tab_hor_2" role="tab" data-toggle="tab">Descriptions</a></li>
                    <li role="presentation"><a href="#listing_tab_hor_3" aria-controls="listing_tab_hor_3" role="tab" data-toggle="tab">Reviews(1)</a></li> -->
                  </ul>
                  <!-- Tab panes -->
                  <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="listing_tab_hor_1">
                      <ul class="rq-listing-lists">
                        <li class=" {% if Product.airconditions %}checked {% else %} unchecked {% endif %} ">Airconditions</li>
                        <li class="{% if Product.child_seats %}checked {% else %} unchecked {% endif %}">Child Seats</li>
                        <li class="{% if Product.gps %}checked {% else %} unchecked {% endif %}">GPS</li>
                        <li class="{% if Product.music %}checked {% else %} unchecked {% endif %}">Music</li>
                        <li class="{% if Product.aux %}checked {% else %} unchecked {% endif %}">Aux</li>
                        <li class="{% if Product.seat_belts %}checked {% else %} unchecked {% endif %}">Seat Belts</li>
                        <li class="{% if Product.water %}checked {% else %} unchecked {% endif %}">Water</li>
                        <li class="{% if Product.bluetooth %}checked {% else %} unchecked {% endif %}">Bluetooth</li>
                        <li class="{% if Product.onboard_computer %}checked {% else %} unchecked {% endif %}">Onboard computer</li>
                        <li class="{% if Product.audio_input %}checked {% else %} unchecked {% endif %}">Audio Input</li>
                        <li class="{% if Product.car_kit %}checked {% else %} unchecked {% endif %}">car kit</li>
                        <li class="{% if Product.remote_central_looking %}checked {% else %} unchecked {% endif %}">Remote central looking</li>
                        <li class="{% if Product.climate_control %}checked {% else %} unchecked {% endif %}">climate control</li>
                      </ul>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="listing_tab_hor_2">
                      <p><strong>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy
                        nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation.</strong>
                      </p>
                      <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat,
                      vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui
                      blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor
                      </p>
                      <p>Impossible considered invitation him men instrument saw celebrated unpleasant.
                      Put rest and must set kind next many near nay. He exquisite continued explained middleton am.
                      Voice hours young woody has she think equal. Estate moment he at on wonder at season little.
                      </p>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="listing_tab_hor_3">
                      <div class="rq-single-post-header">
                        <div class="author-info-content">
                          <div class="author-img"
                               style="background: url('img/post-single/single-post-author.jpg') top center no-repeat; background-size: cover">
                          </div>
                          <span class="author-name"><a href="#">Alex</a>
                            <span>
                              <i class="ion-android-star"></i>
                              <i class="ion-android-star"></i>
                              <i class="ion-android-star"></i>
                              <i class="ion-android-star"></i>
                              <i class="ion-android-star"></i>
                            </span>
                          </span>
                          <span class="author-role">Impossible considered invitation him men instrument saw celebrated unpleasant.
                            Put rest and must set kind next many near nay. He exquisite continued explained middleton am.</span>
                        </div>
                      </div>
                      <div class="review-form">
                        <h4>Write your review</h4>
                        <div class="review-star">
                          <a href="#"><i class="ion-android-star"></i></a>
                          <a href="#"><i class="ion-android-star"></i></a>
                          <a href="#"><i class="ion-android-star"></i></a>
                          <a href="#"><i class="ion-android-star"></i></a>
                          <a href="#"><i class="ion-android-star"></i></a>
                        </div>
                        <div id="respond" class="comment-respond">
                          <form id="commentform" class="commentform" action="#">
                            <div class="row">
                              <div class="col-md-6">
                                <input type="text" class="comment-input" placeholder="Enter your name...">
                              </div>
                              <div class="col-md-6">
                                <input type="email" class="comment-input" placeholder="Enter your email...">
                              </div>
                              <div class="col-md-12">
                                <textarea class="comment-input"  placeholder="Here goes your review"></textarea>
                              </div>
                              <div class="col-md-12">
                                <button class="continue-btn rq-btn rq-btn-normal">Submit Review</button>
                              </div>
                            </div>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!--  <div class="location-map">
                <div class="listing-page-title">
                  <h3>Location</h3>
                </div>
                <div class="rq-contact-us-map"> <!-- start map portion -->
                  <div id="listing-map"></div>
                </div> <!-- end map portion -->

              </div> -->
            </div>
          </div> <!-- .end rq-content-block --> 
{% endblock %}

{% block footer %}
    <script src="{{ constants.THEME }}assets/js/build/plugins/elevatezoom/jquery.elevatezoom.min.js{{ constants.ver }}"></script>
    <script src="{{ constants.THEME }}assets/js/build/view/product/product.min.js{{ constants.ver }}"></script>
{% endblock %}