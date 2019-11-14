<!DOCTYPE html>
<html>

<head>
    <!-- Basic -->
    <meta charset="utf-8">
    <title>Perfume Shop</title>
    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="WellDone - Responsive HTML5 Template">
    <meta name="author" content="etheme.com">
    <link rel="shortcut icon" href="favicon.ico">
    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="../assets/css/build/style.min.css">

    <!--[if IE]>
        <link rel="stylesheet" href="css/ie.css">
        <![endif]-->
    <!--[if lte IE 8]>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.3.0/respond.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.js"></script>
        <![endif]-->

    <!-- Modernizr -->
    <script src="../assets/js/build/plugins/modernizr/modernizr.min.js"></script>
</head>

<body>
    <div id="loader-wrapper" class="loader-off">
        <div id="loader"></div>
    </div>
    <!-- Modal Search -->
    <div class="overlay overlay-scale">
        <button type="button" class="overlay-close"> ✕ </button>
        <div class="overlay__content">
            <form id="search-form" class="search-form outer" action="#" method="post">
                <div class="input-group input-group--wd">
                    <input type="text" class=" input--full" placeholder="პროდუქციის ძებნა ...">
                    <span class="input-group__bar"></span> </div>
                <button class="btn btn--wd text-uppercase wave waves-effect">მოძებნე</button>
            </form>
        </div>
    </div>
    <!-- / end Modal Search -->

    <div class="wrapper">
        <!-- Header section -->
        <header class="header header--sticky">
            <div class="header-line hidden-xs">
                <div class="container">
                    <div class="pull-left">
                        <div class="social-links social-links--colorize">
                            <ul>
                                <li class="social-links__item">
                                    <a class="icon icon-facebook" href="#"></a>
                                </li>
                                <li class="social-links__item">
                                    <a class="icon icon-twitter" href="#"></a>
                                </li>
                                <li class="social-links__item">
                                    <a class="icon icon-google" href="#"></a>
                                </li>
                                <li class="social-links__item">
                                    <a class="icon icon-pinterest" href="#"></a>
                                </li>
                                <li class="social-links__item">
                                    <a class="icon icon-mail" href="#"></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="pull-right">
                        <div class="user-links">
                            <ul>
                                <li class="user-links__item user-links__item--separate">
                                    <a href="#" class="">ჩვენს შესახებ</a> &bull; <a href="#" class="">კონტაქტი</a> &bull; <a href="#" class="">დახმარება</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header__dropdowns-container">
                <div class="header__dropdowns">
                    <div class="header__search pull-left"> <a href="#" class="btn dropdown-toggle btn--links--dropdown header__dropdowns__button search-open"><span class="icon icon-search"></span></a> </div>
                    <div class="header__cart pull-left"><span class="header__cart__indicator hidden-xs">$0.00</span>
                        <div class="dropdown pull-right"><a href="#" class="btn dropdown-toggle btn--links--dropdown header__cart__button header__dropdowns__button" data-toggle="dropdown"><span class="icon icon-bag-alt"></span><span class="badge badge--menu">2</span></a>
                            <div class="dropdown-menu animated fadeIn shopping-cart" role="menu">
                                <div class="shopping-cart__settings">
                                    <a href="#" class="icon icon-gear"></a>
                                </div>
                                <div class="shopping-cart__top text-uppercase">ჩემი კალათა (2)</div>
                                <ul>
                                    <li class='shopping-cart__item'>
                                        <div class="shopping-cart__item__image pull-left">
                                            <a href="#"><img src="../assets/images/products/product.jpg" alt="" /></a>
                                        </div>
                                        <div class="shopping-cart__item__info">
                                            <div class="shopping-cart__item__info__title">
                                                <h2 class="text-uppercase"><a href="#">გასაყიდი პროდუქტი</a></h2>
                                            </div>
                                            <div class="shopping-cart__item__info__option">ფერი: ლურჯი</div>
                                            <div class="shopping-cart__item__info__option">ზომა: S</div>
                                            <div class="shopping-cart__item__info__price">$84.00</div>
                                            <div class="shopping-cart__item__info__qty">რაობა:1</div>
                                            <div class="shopping-cart__item__info__delete">
                                                <a href="#" class="icon icon-clear"></a>
                                            </div>
                                        </div>
                                    </li>
                                    <li class='shopping-cart__item'>
                                        <div class="shopping-cart__item__image pull-left">
                                            <a href="#"><img src="../assets/images/products/product.jpg" alt="" /></a>
                                        </div>
                                        <div class="shopping-cart__item__info">
                                            <div class="shopping-cart__item__info__title">
                                                <h2 class="text-uppercase"><a href="#">გასაყიდი პროდუქტი</a></h2>
                                            </div>
                                            <div class="shopping-cart__item__info__option">ფერი: ლურჯი</div>
                                            <div class="shopping-cart__item__info__option">ზომა: S</div>
                                            <div class="shopping-cart__item__info__price">$84.00</div>
                                            <div class="shopping-cart__item__info__qty">რაობა:1</div>
                                            <div class="shopping-cart__item__info__delete">
                                                <a href="#" class="icon icon-clear"></a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <div class="shopping-cart__bottom">
                                    <div class="pull-left">ჯამი: <span class="shopping-cart__total"> $130.00</span></div>
                                    <div class="pull-right">
                                        <button class="btn btn--wd text-uppercase">შეკვეთა</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="dropdown pull-right"> <a href="#" class="btn dropdown-toggle btn--links--dropdown header__dropdowns__button" data-toggle="dropdown"><span class="icon icon-dots"></span></a>
                        <ul class="dropdown-menu ul-row animated fadeIn" role="menu">
                            <li class='li-col currency'>
                                <h4>Currency</h4>
                                <ul>
                                    <li class="currency__item active"><a href="#"><span>$</span>US Dollar</a></li>
                                    <li class="currency__item"><a href="#"><span>€</span>Euro</a></li>
                                    <li class="currency__item"><a href="#"><span>£</span>British Pound</a></li>
                                    <li class="currency__item"><a href="#"><span>¥</span>Japanese Yen</a></li>
                                    <li class="currency__item"><a href="#"><span>₹</span>Indian Rupee</a></li>
                                </ul>
                            </li>
                            <li class='li-col languages languages--flag'>
                                <h4>Language</h4>
                                <ul>
                                    <li class="languages__item active"><a href="#"><span class="languages__item__flag flag"><img src="../assets/images/flags/gb.png" alt=""/></span><span class="languages__item__label">En</span></a></li>
                                    <li class="languages__item"><a href="#"><span class="languages__item__flag flag"><img src="../assets/images/flags/de.png" alt=""/></span><span class="languages__item__label">De</span></a></li>
                                    <li class="languages__item"><a href="#"><span class="languages__item__flag flag"><img src="../assets/images/flags/fr.png" alt=""/></span><span class="languages__item__label">Fr</span></a></li>
                                </ul>
                            </li>
                            <li class='li-col list-user-menu'>
                                <h4>My Account</h4>
                                <ul>
                                    <li><a href="#">Account</a></li>
                                    <li><a href="#">Wishlist</a></li>
                                    <li><a href="#">Compare</a></li>
                                    <li><a href="#">Checkout</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <nav class="navbar navbar-wd" id="navbar">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" id="slide-nav"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                        <!--  Logo  -->
                        <a class="logo" href="index.html"> <img class="logo-default" src="../assets/../assets/images/logo.png" alt="" /> <img class="logo-mobile" src="../assets/images/logo-mobile.png" alt="" /> <img class="logo-transparent" src="../assets/images/logo-transparent.png" alt="" /> </a>
                        <!-- End Logo -->
                    </div>
                    <div class="pull-left search-focus-fade" id="slidemenu">
                        <div class="slidemenu-close visible-xs">✕</div>
                        <ul class="nav navbar-nav">
                            <li> <a href="index.html" class="dropdown-toggle"><span class="link-name">პარფიუმერია</span><span class="caret caret--dots"></span></a>
                                <ul class="dropdown-menu animated fadeIn" role="menu">
                                    <li><a href="index-layout1.html">არომატები ქალბატონებისთვის</a></li>
                                    <li><a href="index-layout2.html">არომატები მამაკაცებისთვის</a></li>
                                </ul>
                            </li>
                            <li> <a href="index.html" class="dropdown-toggle"><span class="link-name">არომატები</span><span class="caret caret--dots"></span></a>
                                <ul class="dropdown-menu animated fadeIn" role="menu">
                                    <li><a href="index.html">მამაკაცებისთვის</a></li>
                                    <li><a href="index.html">ქალბატონებისთვის</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="dropdown-toggle"><span class="link-name">სპრეი და ლოსიონი</span><span class="caret caret--dots"></span></a>
                                <ul class="dropdown-menu animated fadeIn" role="menu">
                                    <li><a href="blog.html">ლოსიონი</a></li>
                                    <li><a href="blog.html">ლოსიონი</a></li>
                                    <li><a href="blog.html">ლოსიონი</a></li>
                                    <li><a href="blog.html">ლოსიონი</a></li>
                                </ul>
                            </li>
                            <li><a href="listing.html" class="dropdown-toggle"><span class="link-name">შეთავაზება</span><span class="caret caret--dots"></span></a>
                                <ul class="dropdown-menu animated fadeIn" role="menu">
                                    <li><a href="listing.html">ნაკრები სპეციალურ ფასად</a></li>
                                    <li><a href="listing-open-filter.html">სპეიალური შეთავაზება</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <!-- End Header section -->
