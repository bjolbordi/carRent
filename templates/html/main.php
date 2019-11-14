<?php
  include "header/header.php"
?>

<div id="pageContent" class="page-content">
            <section class="content" id="slider">

            </section>

            <!-- END REVOLUTION SLIDER -->

            <!-- End Slider section -->
            <!-- Content section -->
            <section class="content">
                <div class="container">
                    <div class="row hide-outer-animation">
                        <div class="col-md-7 col-lg-8">
                            <div class="text-center">
                                <div class="banner banner--image hover-squared animation" data-animation="fadeInLeft" data-animation-delay="0s" onclick="location.href='#';"> <img src="../assets/images/banner-01-new.jpg" alt="" class="img-responsive" />
                                    <div class="banner--image__text banner--image__text--left banner--image__text--light text-center">
                                        <h5>Get Contemporary</h5>
                                        <h3 id="responsive_headline"><strong>The High Halter</strong></h3>
                                        <h6>Frame your face and shoulders with the silhouette of season<br>
                                            <strong>Up to 65% OFF</strong></h6>
                                    </div>
                                    <div class="product-category__hover caption"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 col-lg-4">
                            <div class="banner banner--icon hover-squared animation" data-animation="fadeInRight" data-animation-delay="0s" onclick="location.href='#';">
                                <div class="banner--icon__icon"> <span class="icon icon-sales"></span> </div>
                                <div class="banner--icon__text text-center">
                                    <h4 class="text-uppercase">ფასდაკლება</h4>
                                    <div class="banner--icon__text__divider"></div>
                                    <div class="text-uppercase saless">დაზოგეთ 70%-ზე მეტი, თქვენს საყვარელ პროდუქტზე</div>
                                </div>
                                <div class="product-category__hover caption"></div>
                            </div>
                            <div class="banner banner--icon banner--last banner--light hover-squared animation" data-animation="fadeInRight" data-animation-delay="0s" onclick="location.href='#';">
                                <div class="banner--icon__icon"> <span class="icon icon-box"></span> </div>
                                <div class="banner--icon__text text-center">
                                    <h4 class="text-uppercase">დღის შეთავაზება</h4>
                                    <div class="banner--icon__text__divider"></div>
                                    <div class="text-uppercase saless">დაზოგეთ 70%-ზე მეტი, თქვენს საყვარელ პროდუქტზე</div>
                                </div>
                                <div class="product-category__hover caption"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="content">
                <div class="container">

                    <!-- Modal -->
                    <div class="modal quick-view zoom" id="quickView" style="opacity: 1">
                        <div class="modal-dialog">
                            <div id="modalLoader-wrapper">
                                <div id="modalLoader"></div>
                            </div>
                            <div class="modal-content">
                            </div>
                        </div>
                    </div>
                    <!-- /.modal -->

                    <h2 class="text-center text-uppercase">პოპულარული პროდუქტები</h2>
                    <div class="row product-carousel mobile-special-arrows animated-arrows product-grid four-in-row">
                        <div class="product-preview-wrapper">
                            <div class="product-preview">
                                <div class="product-preview__image">
                                    <a href="product.html"><img src="../assets/images/products/product-empty.png" data-lazy="../assets/images/products/product-1.jpg" alt="" /></a>
                                </div>
                                <div class="product-preview__label product-preview__label--left product-preview__label--new"><span>ახალი</span></div>
                                <div class="product-preview__label product-preview__label--right product-preview__label--sale"><span>sale<br>
                -10%</span></div>
                                <div class="product-preview__info text-center">
                                    <div class="product-preview__info__btns"><a href="#" class="btn btn--round ajax-to-cart"><span class="icon-ecommerce"></span></a> <a href="quick-view.html" class="btn btn--round btn--dark btn-quickview" data-toggle="modal" data-target="#quickView"><span class="icon icon-eye"></span></a></div>
                                    <div class="product-preview__info__title">
                                        <h2><a href="#">გასაყიდი პროდუქტი</a></h2>
                                    </div>
                                    <div class="rating"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span></div>
                                    <ul class="options-swatch options-swatch--color">
                                        <li><a href="#"><span class="swatch-label"><img src="../assets/images/colors/blue.png" width="10" height="10" alt=""/></span></a></li>
                                        <li><a href="#"><span class="swatch-label"><img src="../assets/images/colors/yellow.png" width="10" height="10" alt=""/></span></a></li>
                                        <li><a href="#"><span class="swatch-label"><img src="../assets/images/colors/green.png" width="10" height="10" alt=""/></span></a></li>
                                        <li><a href="#"><span class="swatch-label"><img src="../assets/images/colors/dark-grey.png" width="10" height="10" alt=""/></span></a></li>
                                        <li><a href="#"><span class="swatch-label"><img src="../assets/images/colors/grey.png" width="10" height="10" alt=""/></span></a></li>
                                        <li><a href="#"><span class="swatch-label"><img src="../assets/images/colors/red.png" width="10" height="10" alt=""/></span></a></li>
                                        <li><a href="#"><span class="swatch-label"><img src="../assets/images/colors/white.png" width="10" height="10" alt=""/></span></a></li>
                                    </ul>
                                    <div class="price-box "><span class="price-box__new">$65.00</span> <span class="price-box__old">$84.00</span></div>
                                    <div class="product-preview__info__description">
                                        <p>Nulla at mauris leo. Donec quis ex elementum, tincidunt elit quis, cursus tortor. Sed sollicitudin enim metus, ut hendrerit orci dignissim venenatis.</p>
                                        <p>Suspendisse consectetur odio diam, ut consequat quam aliquet at.</p>
                                    </div>
                                    <div class="product-preview__info__link"><a href="#" class="compare-link"><span class="icon icon-bars"></span><span class="product-preview__info__link__text">შედარება</span></a> <a href="#" class="ajax-to-wishlist"><span class="icon icon-favorite"></span><span class="product-preview__info__link__text">რჩეულებში დამატება</span></a>
                                        <a
                                            href="#" class="btn btn--wd buy-link"><span class="icon icon-ecommerce"></span><span class="product-preview__info__link__text">Add to cart</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="product-preview-wrapper">
                            <div class="product-preview">
                                <div class="product-preview__image">
                                    <a href="product.html"><img src="../assets/images/products/product-empty.png" data-lazy="../assets/images/products/product-2.jpg" alt="" /></a>
                                </div>
                                <div class="product-preview__info text-center">
                                    <div class="product-preview__info__btns"><a href="#" class="btn btn--round ajax-to-cart"><span class="icon-ecommerce"></span></a> <a href="quick-view.html" class="btn btn--round btn--dark btn-quickview" data-toggle="modal" data-target="#quickView"><span class="icon icon-eye"></span></a></div>
                                    <div class="product-preview__info__title">
                                        <h2><a href="#">გასაყიდი პროდუქტი</a></h2>
                                    </div>
                                    <div class="rating"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span></div>
                                    <ul class="options-swatch options-swatch--color">
                                        <li class="color-blue"></li>
                                        <li class="color-yellow"></li>
                                        <li class="color-green"></li>
                                        <li class="color-dark-grey"></li>
                                        <li class="color-grey"></li>
                                        <li class="color-red"></li>
                                        <li class="color-white"></li>
                                    </ul>
                                    <div class="price-box"><span class="price-box__new">$65.00</span> <span class="price-box__old">$84.00</span></div>
                                    <div class="product-preview__info__description">
                                        <p>Nulla at mauris leo. Donec quis ex elementum, tincidunt elit quis, cursus tortor. Sed sollicitudin enim metus, ut hendrerit orci dignissim venenatis.</p>
                                        <p>Suspendisse consectetur odio diam, ut consequat quam aliquet at.</p>
                                    </div>
                                    <div class="product-preview__info__link"><a href="#" class="compare-link"><span class="icon icon-bars"></span><span class="product-preview__info__link__text">შედარება</span></a> <a href="#" class="ajax-to-wishlist"><span class="icon icon-favorite"></span><span class="product-preview__info__link__text">რჩეულებში დამატება</span></a>
                                        <a
                                            href="#" class="btn btn--wd buy-link"><span class="icon icon-ecommerce"></span><span class="product-preview__info__link__text">Add to cart</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="product-preview-wrapper">
                            <div class="product-preview">
                                <div class="product-preview__image">
                                    <a href="product.html"><img src="../assets/images/products/product-empty.png" data-lazy="../assets/images/products/product-3.jpg" alt="" /></a>
                                </div>
                                <div class="product-preview__info text-center">
                                    <div class="product-preview__info__btns"><a href="#" class="btn btn--round ajax-to-cart"><span class="icon-ecommerce"></span></a>
                                        <a href="quick-view-2.html" class="btn btn--round btn--dark btn-quickview" data-toggle="modal" data-target="#quickView"><span class="icon icon-eye"></span></a>
                                    </div>
                                    <div class="product-preview__info__title">
                                        <h2><a href="#">Other Quick VIEW</a></h2>
                                    </div>
                                    <div class="rating"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span></div>
                                    <div class="price-box">$65.00</div>
                                    <div class="product-preview__info__description">
                                        <p>Nulla at mauris leo. Donec quis ex elementum, tincidunt elit quis, cursus tortor. Sed sollicitudin enim metus, ut hendrerit orci dignissim venenatis.</p>
                                        <p>Suspendisse consectetur odio diam, ut consequat quam aliquet at.</p>
                                    </div>
                                    <div class="product-preview__info__link"><a href="#" class="compare-link"><span class="icon icon-bars"></span><span class="product-preview__info__link__text">შედარება</span></a> <a href="#" class="ajax-to-wishlist"><span class="icon icon-favorite"></span><span class="product-preview__info__link__text">რჩეულებში დამატება</span></a>
                                        <a
                                            href="#" class="btn btn--wd buy-link"><span class="icon icon-ecommerce"></span><span class="product-preview__info__link__text">Add to cart</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="product-preview-wrapper">
                            <div class="product-preview">
                                <div class="product-preview__image">
                                    <a href="product.html"><img src="../assets/images/products/product-empty.png" data-lazy="../assets/images/products/product-4.jpg" alt="" /></a>
                                    <div class="countdown_box">
                                        <div class="countdown_inner">
                                            <div class="title">სპეც შეთავაზება </div>
                                            <div id="countdown1"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-preview__info text-center">
                                    <div class="product-preview__info__btns"><a href="#" class="btn btn--round ajax-to-cart"><span class="icon-ecommerce"></span></a> <a href="quick-view.html" class="btn btn--round btn--dark btn-quickview" data-toggle="modal" data-target="#quickView"><span class="icon icon-eye"></span></a></div>
                                    <div class="product-preview__info__title">
                                        <h2><a href="#">გასაყიდი პროდუქტი</a></h2>
                                    </div>
                                    <div class="rating"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span></div>
                                    <div class="price-box">$65.00</div>
                                    <div class="product-preview__info__description">
                                        <p>Nulla at mauris leo. Donec quis ex elementum, tincidunt elit quis, cursus tortor. Sed sollicitudin enim metus, ut hendrerit orci dignissim venenatis.</p>
                                        <p>Suspendisse consectetur odio diam, ut consequat quam aliquet at.</p>
                                    </div>
                                    <div class="product-preview__info__link"><a href="#" class="compare-link"><span class="icon icon-bars"></span><span class="product-preview__info__link__text">შედარება</span></a> <a href="#" class="ajax-to-wishlist"><span class="icon icon-favorite"></span><span class="product-preview__info__link__text">რჩეულებში დამატება</span></a>
                                        <a
                                            href="#" class="btn btn--wd buy-link"><span class="icon icon-ecommerce"></span><span class="product-preview__info__link__text">Add to cart</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="product-preview-wrapper">
                            <div class="product-preview">
                                <div class="product-preview__image">
                                    <a href="product.html"><img src="../assets/images/products/product-empty.png" data-lazy="../assets/images/products/product-5.jpg" alt="" /></a>
                                    <div class="product-preview__outstock">გაყიდულია</div>
                                </div>
                                <div class="product-preview__info text-center">
                                    <div class="product-preview__info__btns"><a href="#" class="btn btn--round ajax-to-cart"><span class="icon-ecommerce"></span></a> <a href="quick-view.html" class="btn btn--round btn--dark btn-quickview" data-toggle="modal" data-target="#quickView"><span class="icon icon-eye"></span></a></div>
                                    <div class="product-preview__info__title">
                                        <h2><a href="#">გასაყიდი პროდუქტი</a></h2>
                                    </div>`
                                    <div class="rating"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span></div>
                                    <div class="price-box">$65.00</div>
                                    <div class="product-preview__info__description">
                                        <p>Nulla at mauris leo. Donec quis ex elementum, tincidunt elit quis, cursus tortor. Sed sollicitudin enim metus, ut hendrerit orci dignissim venenatis.</p>
                                        <p>Suspendisse consectetur odio diam, ut consequat quam aliquet at.</p>
                                    </div>
                                    <div class="product-preview__info__link"><a href="#" class="compare-link"><span class="icon icon-bars"></span><span class="product-preview__info__link__text">შედარება</span></a> <a href="#" class="ajax-to-wishlist"><span class="icon icon-favorite"></span><span class="product-preview__info__link__text">რჩეულებში დამატება</span></a>
                                        <a
                                            href="#" class="btn btn--wd buy-link"><span class="icon icon-ecommerce"></span><span class="product-preview__info__link__text">Add to cart</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="product-preview-wrapper">
                            <div class="product-preview">
                                <div class="product-preview__image">
                                    <a href="product.html"><img src="../assets/images/products/product-empty.png" data-lazy="../assets/images/products/product-6.jpg" alt="" /></a>
                                </div>
                                <div class="product-preview__info text-center">
                                    <div class="product-preview__info__btns"><a href="#" class="btn btn--round ajax-to-cart"><span class="icon-ecommerce"></span></a> <a href="quick-view.html" class="btn btn--round btn--dark btn-quickview" data-toggle="modal" data-target="#quickView"><span class="icon icon-eye"></span></a></div>
                                    <div class="product-preview__info__title">
                                        <h2><a href="#">გასაყიდი პროდუქტი</a></h2>
                                    </div>
                                    <div class="rating"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span></div>
                                    <div class="price-box">$65.00</div>
                                    <div class="product-preview__info__description">
                                        <p>Nulla at mauris leo. Donec quis ex elementum, tincidunt elit quis, cursus tortor. Sed sollicitudin enim metus, ut hendrerit orci dignissim venenatis.</p>
                                        <p>Suspendisse consectetur odio diam, ut consequat quam aliquet at.</p>
                                    </div>
                                    <div class="product-preview__info__link"><a href="#" class="compare-link"><span class="icon icon-bars"></span><span class="product-preview__info__link__text">შედარება</span></a> <a href="#" class="ajax-to-wishlist"><span class="icon icon-favorite"></span><span class="product-preview__info__link__text">რჩეულებში დამატება</span></a>
                                        <a
                                            href="#" class="btn btn--wd buy-link"><span class="icon icon-ecommerce"></span><span class="product-preview__info__link__text">Add to cart</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="product-preview-wrapper">
                            <div class="product-preview">
                                <div class="product-preview__image">
                                    <a href="product.html"><img src="../assets/images/products/product-empty.png" data-lazy="../assets/images/products/product-7.jpg" alt="" /></a>
                                </div>
                                <div class="product-preview__info text-center">
                                    <div class="product-preview__info__btns"><a href="#" class="btn btn--round ajax-to-cart"><span class="icon-ecommerce"></span></a> <a href="quick-view.html" class="btn btn--round btn--dark btn-quickview" data-toggle="modal" data-target="#quickView"><span class="icon icon-eye"></span></a></div>
                                    <div class="product-preview__info__title">
                                        <h2><a href="#">გასაყიდი პროდუქტი</a></h2>
                                    </div>
                                    <div class="rating"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span></div>
                                    <div class="price-box">$65.00</div>
                                    <div class="product-preview__info__description">
                                        <p>Nulla at mauris leo. Donec quis ex elementum, tincidunt elit quis, cursus tortor. Sed sollicitudin enim metus, ut hendrerit orci dignissim venenatis.</p>
                                        <p>Suspendisse consectetur odio diam, ut consequat quam aliquet at.</p>
                                    </div>
                                    <div class="product-preview__info__link"><a href="#" class="compare-link"><span class="icon icon-bars"></span><span class="product-preview__info__link__text">შედარება</span></a> <a href="#" class="ajax-to-wishlist"><span class="icon icon-favorite"></span><span class="product-preview__info__link__text">რჩეულებში დამატება</span></a>
                                        <a
                                            href="#" class="btn btn--wd buy-link"><span class="icon icon-ecommerce"></span><span class="product-preview__info__link__text">Add to cart</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="product-preview-wrapper">
                            <div class="product-preview">
                                <div class="product-preview__image">
                                    <a href="product.html"><img src="../assets/images/products/product-empty.png" data-lazy="../assets/images/products/product-8.jpg" alt="" /></a>
                                </div>
                                <div class="product-preview__info text-center">
                                    <div class="product-preview__info__btns"><a href="#" class="btn btn--round ajax-to-cart"><span class="icon-ecommerce"></span></a> <a href="quick-view.html" class="btn btn--round btn--dark btn-quickview" data-toggle="modal" data-target="#quickView"><span class="icon icon-eye"></span></a></div>
                                    <div class="product-preview__info__title">
                                        <h2><a href="#">გასაყიდი პროდუქტი</a></h2>
                                    </div>
                                    <div class="rating"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span></div>
                                    <div class="price-box">$65.00</div>
                                    <div class="product-preview__info__description">
                                        <p>Nulla at mauris leo. Donec quis ex elementum, tincidunt elit quis, cursus tortor. Sed sollicitudin enim metus, ut hendrerit orci dignissim venenatis.</p>
                                        <p>Suspendisse consectetur odio diam, ut consequat quam aliquet at.</p>
                                    </div>
                                    <div class="product-preview__info__link"><a href="#" class="compare-link"><span class="icon icon-bars"></span><span class="product-preview__info__link__text">შედარება</span></a> <a href="#" class="ajax-to-wishlist"><span class="icon icon-favorite"></span><span class="product-preview__info__link__text">რჩეულებში დამატება</span></a>
                                        <a
                                            href="#" class="btn btn--wd buy-link"><span class="icon icon-ecommerce"></span><span class="product-preview__info__link__text">Add to cart</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="content content--fill">
                <div class="container">
                    <h2 class="text-center text-uppercase">კატეგორიები</h2>
                    <div class="product-category-carousel mobile-special-arrows animated-arrows slick">
                        <div class="product-category hover-squared">
                            <a href="#"><img src="../assets/images/category-empty.png" data-lazy="../assets/images/category-img-01.jpg" alt="#"></a>
                            <div class="product-category__hover caption"></div>
                            <div class="product-category__info">
                                <div class="product-category__info__ribbon">
                                    <h5 class="product-category__info__ribbon__title">კაცის სვიტრი</h5>
                                    <div class="product-category__info__ribbon__count">დარჩენილია 32</div>
                                </div>
                            </div>
                        </div>
                        <div class="product-category hover-squared">
                            <a href="#"><img src="../assets/images/category-empty.png" data-lazy="../assets/images/category-img-02.jpg" alt="#"></a>
                            <div class="product-category__hover caption"></div>
                            <div class="product-category__info">
                                <div class="product-category__info__ribbon">
                                    <h5 class="product-category__info__ribbon__title">კაცის სვიტრი</h5>
                                    <div class="product-category__info__ribbon__count">დარჩენილია 32</div>
                                </div>
                            </div>
                        </div>
                        <div class="product-category hover-squared">
                            <a href="#"><img src="../assets/images/category-empty.png" data-lazy="../assets/images/category-img-03.jpg" alt="#"></a>
                            <div class="product-category__hover caption"></div>
                            <div class="product-category__info">
                                <div class="product-category__info__ribbon">
                                    <h5 class="product-category__info__ribbon__title">კაცის სვიტრი</h5>
                                    <div class="product-category__info__ribbon__count">დარჩენილია 32</div>
                                </div>
                            </div>
                        </div>
                        <div class="product-category hover-squared">
                            <a href="#"><img src="../assets/images/category-empty.png" data-lazy="../assets/images/category-img-04.jpg" alt="#"></a>
                            <div class="product-category__hover caption"></div>
                            <div class="product-category__info">
                                <div class="product-category__info__ribbon">
                                    <h5 class="product-category__info__ribbon__title">კაცის სვიტრი</h5>
                                    <div class="product-category__info__ribbon__count">დარჩენილია 32</div>
                                </div>
                            </div>
                        </div>
                        <div class="product-category hover-squared">
                            <a href="#"><img src="../assets/images/category-empty.png" data-lazy="../assets/images/category-img-05.jpg" alt="#"></a>
                            <div class="product-category__hover caption"></div>
                            <div class="product-category__info">
                                <div class="product-category__info__ribbon">
                                    <h5 class="product-category__info__ribbon__title">კაცის სვიტრი</h5>
                                    <div class="product-category__info__ribbon__count">დარჩენილია 32</div>
                                </div>
                            </div>
                        </div>
                        <div class="product-category hover-squared">
                            <a href="#"><img src="../assets/images/category-empty.png" data-lazy="../assets/images/category-img-01.jpg" alt="#"></a>
                            <div class="product-category__hover caption"></div>
                            <div class="product-category__info">
                                <div class="product-category__info__ribbon">
                                    <h5 class="product-category__info__ribbon__title">კაცის სვიტრი</h5>
                                    <div class="product-category__info__ribbon__count">დარჩენილია 32</div>
                                </div>
                            </div>
                        </div>
                        <div class="product-category hover-squared">
                            <a href="#"><img src="../assets/images/category-empty.png" data-lazy="../assets/images/category-img-02.jpg" alt="#"></a>
                            <div class="product-category__hover caption"></div>
                            <div class="product-category__info">
                                <div class="product-category__info__ribbon">
                                    <h5 class="product-category__info__ribbon__title">კაცის სვიტრი</h5>
                                    <div class="product-category__info__ribbon__count">დარჩენილია 32</div>
                                </div>
                            </div>
                        </div>
                        <div class="product-category hover-squared">
                            <a href="#"><img src="../assets/images/category-empty.png" data-lazy="../assets/images/category-img-03.jpg" alt="#"></a>
                            <div class="product-category__hover caption"></div>
                            <div class="product-category__info">
                                <div class="product-category__info__ribbon">
                                    <h5 class="product-category__info__ribbon__title">კაცის სვიტრი</h5>
                                    <div class="product-category__info__ribbon__count">დარჩენილია 32</div>
                                </div>
                            </div>
                        </div>
                        <div class="product-category hover-squared">
                            <a href="#"><img src="../assets/images/category-empty.png" data-lazy="../assets/images/category-img-04.jpg" alt="#"></a>
                            <div class="product-category__hover caption"></div>
                            <div class="product-category__info">
                                <div class="product-category__info__ribbon">
                                    <h5 class="product-category__info__ribbon__title">კაცის სვიტრი</h5>
                                    <div class="product-category__info__ribbon__count">დარჩენილია 32</div>
                                </div>
                            </div>
                        </div>
                        <div class="product-category hover-squared">
                            <a href="#"><img src="../assets/images/category-empty.png" data-lazy="../assets/images/category-img-05.jpg" alt="#"></a>
                            <div class="product-category__hover caption"></div>
                            <div class="product-category__info">
                                <div class="product-category__info__ribbon">
                                    <h5 class="product-category__info__ribbon__title">კაცის სვიტრი</h5>
                                    <div class="product-category__info__ribbon__count">დარჩენილია 32</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="content content--parallax top-null" data-image="../assets/images/parallax-bg.jpg">
                <div class="container">
                    <div class="blog-widget">
                        <h2 class="blog-widget__title text-uppercase">From The Blog</h2>
                        <div class="blog-carousel mobile-special-arrows  animated-arrows">
                            <div class="blog-widget__item">
                                <div class="blog-widget__item__image-cell pull-left"><img src="../assets/images/blog-author-img-01.jpg" alt="" /></div>
                                <div class="blog-widget__item__offset-text pull-right">
                                    <h3 class="blog-widget__item__offset-text__title text-uppercase">uismod, turpis sollicitudin lobortis </h3>
                                    <div class="blog-widget__item__offset-text__date"><span>Friday, 29 May 2015</span></div>
                                    <div class="blog-widget__item__offset-text__teaser">
                                        <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                    </div>
                                    <a href="#" class="btn btn--wd">READ MORE</a> </div>
                            </div>
                            <div class="blog-widget__item">
                                <div class="blog-widget__item__image-cell pull-left"><img src="../assets/images/blog-author-img-01.jpg" alt="" /></div>
                                <div class="blog-widget__item__offset-text pull-right">
                                    <h3 class="blog-widget__item__offset-text__title text-uppercase">nostrud exercitation ullamco</h3>
                                    <div class="blog-widget__item__offset-text__date"><span>Friday, 29 May 2015</span></div>
                                    <div class="blog-widget__item__offset-text__teaser">
                                        <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                    </div>
                                    <a href="#" class="btn btn--wd">READ MORE</a> </div>
                            </div>
                            <div class="blog-widget__item">
                                <div class="blog-widget__item__image-cell pull-left"><img src="../assets/images/blog-author-img-01.jpg" alt="" /></div>
                                <div class="blog-widget__item__offset-text pull-right">
                                    <h3 class="blog-widget__item__offset-text__title text-uppercase">tempor incididunt ut labore</h3>
                                    <div class="blog-widget__item__offset-text__date"><span>Friday, 29 May 2015</span></div>
                                    <div class="blog-widget__item__offset-text__teaser">
                                        <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                    </div>
                                    <a href="#" class="btn btn--wd">READ MORE</a> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="content content--fill top-null">
                <div class="container">
                    <h2 class="text-center text-uppercase">ჩვენი ბრენდები</h2>
                    <div class="brands brands-carousel animated-arrows mobile-special-arrows">
                        <div class="brands__item">
                            <a href="#"><img src="../assets/images/brand-empty.png" data-lazy="../assets/images/brand-01.png" alt="" /></a>
                        </div>
                        <div class="brands__item">
                            <a href="#"><img src="../assets/images/brand-empty.png" data-lazy="../assets/images/brand-02.png" alt="" /></a>
                        </div>
                        <div class="brands__item">
                            <a href="#"><img src="../assets/images/brand-empty.png" data-lazy="../assets/images/brand-03.png" alt="" /></a>
                        </div>
                        <div class="brands__item">
                            <a href="#"><img src="../assets/images/brand-empty.png" data-lazy="../assets/images/brand-04.png" alt="" /></a>
                        </div>
                        <div class="brands__item">
                            <a href="#"><img src="../assets/images/brand-empty.png" data-lazy="../assets/images/brand-05.png" alt="" /></a>
                        </div>
                        <div class="brands__item">
                            <a href="#"><img src="../assets/images/brand-empty.png" data-lazy="../assets/images/brand-06.png" alt="" /></a>
                        </div>
                        <div class="brands__item">
                            <a href="#"><img src="../assets/images/brand-empty.png" data-lazy="../assets/images/brand-07.png" alt="" /></a>
                        </div>
                        <div class="brands__item">
                            <a href="#"><img src="../assets/images/brand-empty.png" data-lazy="../assets/images/brand-01.png" alt="" /></a>
                        </div>
                        <div class="brands__item">
                            <a href="#"><img src="../assets/images/brand-empty.png" data-lazy="../assets/images/brand-02.png" alt="" /></a>
                        </div>
                        <div class="brands__item">
                            <a href="#"><img src="../assets/images/brand-empty.png" data-lazy="../assets/images/brand-03.png" alt="" /></a>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End Content section -->
        </div>
<?php 
  include "footer/footer.php"
?>
