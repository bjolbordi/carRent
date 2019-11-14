{% extends "index.tpl" %}

{% block content %}
    <div class="inner-page-banner" style="background: url('{{ constants.THEME }}assets/img/inner-banner/listing-banner.jpg') top center no-repeat; background-size: cover;">
        <div class="rq-overlay"></div>
        <div class="container">
          <div class="rq-title-container bredcrumb-title text-center">
            <h2 class="rq-title">My Auto Rent</h2>
           <!--  <ol class="breadcrumb rq-subtitle secondary">
              <li><a href="#">Home</a></li>
              <li class="active">Car Listing</li>
            </ol> -->
          </div>
        </div>
      </div> <!-- /. inner pagebanner -->
      <div class="rq-page-content">
        <div class="rq-content-block gray-bg small-padding-top">
          <div class="container">
 
            <div class="rq-listing-top-bar-filter-option">
              
              <div class="rq-grid-list-view-option">
                <a class="active" href="#" data-class="rq-listing-grid"><i class="ion-grid"></i></a>
                <a href="#" data-class="rq-listing-list"><i class="ion-navicon"></i></a>
              </div>
            </div>

            <div class="rq-car-listing-wrapper">
              <div class="rq-listing-choose rq-listing-grid">
                <div class="row">
                  <div class="col-md-4 col-sm-6">
                    <div class="listing-single">
                      <div class="listing-img">
                        <img src="img/car-listing-grid/toyota.jpg" alt="">
                      </div>
                      <div class="listing-details">
                        <h5 class="car-brand">Toyota</h5>
                        <h3 class="car-name"><a href="listing-detail.html">Toyota Prius</a></h3>
                        <ul class="rating-list">
                          <li><i class="ion-star"></i></li>
                          <li><i class="ion-star"></i></li>
                          <li><i class="ion-star"></i></li>
                          <li><i class="ion-star"></i></li>
                          <li><i class="ion-star"></i></li>
                        </ul>
                        <ul>
                          <li>Class: <span>Premium</span></li>
                          <li>Air Condition: <span>Yes</span></li>
                          <li>Body Style: <span>Sedan</span></li>
                          <li>Transmission: <span>Automatic</span></li>
                        </ul>
                        <div class="listing-footer">
                          <span><a href="#">Details</a></span>
                          <span>
                            Starting at <span class="price">$28</span> / day
                          </span>
                        </div>

                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 col-sm-6">
                    <div class="listing-single">
                      <div class="listing-img">
                        <img src="img/car-listing-grid/toyotab.jpg" alt="">
                      </div>
                      <div class="listing-details">
                        <h5 class="car-brand">Toyota</h5>
                        <h3 class="car-name"><a href="listing-detail1.html">Toyota Prius</a></h3>
                        <ul class="rating-list">
                          <li><i class="ion-star"></i></li>
                          <li><i class="ion-star"></i></li>
                          <li><i class="ion-star"></i></li>
                          <li><i class="ion-star"></i></li>
                          <li><i class="ion-star"></i></li>
                        </ul>
                        <ul>
                          <li>Class: <span>Premium</span></li>
                          <li>Air Condition: <span>Yes</span></li>
                          <li>Body Style: <span>Sedan</span></li>
                          <li>Transmission: <span>Automatic</span></li>
                        </ul>
                        <div class="listing-footer">
                          <span><a href="#">Details</a></span>
                          <span>
                            Starting at <span class="price">$28</span> / day
                          </span>
                        </div>

                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 col-sm-6">
                    <div class="listing-single">
                      <div class="listing-img">
                        <img src="img/car-listing-grid/toyotac.jpg" alt="">
                      </div>
                      <div class="listing-details">
                        <h5 class="car-brand">Toyota</h5>
                        <h3 class="car-name"><a href="listing-detail2.html">Toyota Vitz</a></h3>
                        <ul class="rating-list">
                          <li><i class="ion-star"></i></li>
                          <li><i class="ion-star"></i></li>
                          <li><i class="ion-star"></i></li>
                          <li><i class="ion-star"></i></li>
                          <li><i class="ion-star"></i></li>
                        </ul>
                        <ul>
                          <li>Class: <span>Suv</span></li>
                          <li>Air Condition: <span>Yes</span></li>
                          <li>Body Style: <span>Hatchback</span></li>
                          <li>Transmission: <span>Automatic</span></li>
                        </ul>
                        <div class="listing-footer">
                          <span><a href="#">Details</a></span>
                          <span>
                            Starting at <span class="price">$28</span> / day
                          </span>
                        </div>

                      </div>
                    </div>
                  </div>
                  
                </div>
              </div>
              <!-- <div class="rq-pagination">
                <nav>
                  <ul class="rq-pagination-list">
                    <li class="pagin-text">
                      <a href="#" aria-label="Previous">
                        <span aria-hidden="true"><i class="arrow_left"></i> Prev</span>
                      </a>
                    </li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a class="center-dot" href="#">...</a></li>
                    <li><a href="#">12</a></li>
                    <li class="pagin-text">
                      <a href="#" aria-label="Next">
                        <span aria-hidden="true">next <i class="arrow_right"></i></span>
                      </a>
                    </li>
                  </ul>
                </nav>
              </div> -->
            </div>

          </div>
        </div>  <!-- /.rq-content-block -->
      </div>
{% endblock %}