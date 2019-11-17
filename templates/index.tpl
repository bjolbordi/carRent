{% spaceless %}
    <!DOCTYPE html>
    <html lang="{{ globals.lang.code }}">
    <head>

        <title>{{ meta.title }}</title>
        <!-- Favicon -->
        <link rel="icon" type="image/png" href="{{ constants.THEME }}assets/images/favicon.png{{ constants.ver }}" async/>
        <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900,900italic%7cMontserrat:400,700%7cOxygen:400,300,700' rel='stylesheet' type='text/css'>
        <!-- Meta tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="language" content="{{ globals.lang.code }}"/>
        <meta name="description" content="{{ meta.desc }}"/>
        <meta name="keywords" content="{{ meta.key }}"/>
        <meta name="owner" content="fufala.ge"/>
        <meta name="copyright" content="Copyright &copy; {{ date('Y') }} fufala.ge"/>
        <!-- Facebook Meta tags -->
        {% block facebook %}
        {% endblock %}
        <!-- Mobile Specific Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- include the site stylesheet -->

        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="{{ constants.THEME }}assets/css/turbo.style.css">
        <!-- include the site stylesheet -->

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        
        <!--[if IE]>
        <link rel="stylesheet" href="css/ie.css">
        <![endif]-->
        <!--[if lte IE 8]>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.3.0/respond.js{{ constants.ver }}"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.js{{ constants.ver }}"></script>
        <![endif]-->
        <!-- Modernizr -->
        <style>
            {% block css %}

            {% endblock %}
        </style>
        {% block head %}

        {% endblock %}
        <script type="text/javascript">
            var LANG_ID = {{ globals.lang.id }};
            var LANG = '{{ globals.lang.code }}';
            var THEME = '{{ constants.THEME }}';
            var URL = '{{ globals.url }}';
            var URI = '{{ globals.uri }}';
        </script>
    </head>
<body>
    <div id="fakeloader">
      <div class="spinner5">
        <div class="cube1"></div>
        <div class="cube2"></div>
      </div>
    </div>


    
    <div id="main-wrapper">
        <header class="header">
          <nav class="navbar navbar-default" id="sticker">
            <div class="container">
              <!-- Brand and toggle get grouped for better mobile display -->
              <div class="navbar-header">

                <a class="navbar-brand" href="index.html">LAPE<img src="{{ constants.THEME }}assets/img/company-logo.png" alt=""/></a>
              </div>

              <!-- Collect the nav links, forms, and other content for toggling -->
              <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                  <li class="dropdown">
                    <a href="{{ globals.uri }}main" role="button" aria-haspopup="true" aria-expanded="false">Home </a>

                  </li>
                  <li class="dropdown">
                    <a href="{{ globals.uri }}about">About</a>
                  </li>
                  <li class="dropdown">
                    <a href="{{ globals.uri }}contact">Contact</a>
                  </li>
                </ul>
              </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
          </nav>
        </header> <!-- end header -->


        {% block content %}
        
        {% endblock %}
        
    </div>



    
    <footer class="rq-footer">
      <!-- <div class="rq-main-footer">
        <div class="container">
          <button class="toggle-widget">Footer widget</button>
          <div class="footer-widget">
            <div class="row">
              <div class="col-md-3 col-sm-3">
                <div class="widget-list">
                  <ul>
                    <li><a href="#">Site map</a></li>
                    <li><a href="#">Terms & Conditions</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Help</a></li>
                    <li><a href="#">Affiliate</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-md-3 col-sm-3">
                <div class="widget-list">
                  <ul class="address">
                    <li><a href="#">Our Location</a></li>
                    <li><a href="#">Career</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-md-3 col-sm-3">
                <div class="widget-list">
                  <ul class="address">
                    <li><a href="#">FAQs</a></li>
                    <li><a href="#">Blog</a></li>
                    <li><a href="#">Car Blog</a></li>
                    <li><a href="#">Location</a></li>
                    <li><a href="#">Press</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-md-3 col-sm-3">
                <div class="widget-list">
                  <div class="rq-newsletter">
                    <h5>Sign up for get our newsletter</h5>
                    <form action="#">
                      <input class="fq-newsletter-form" type="text" placeholder="Your Email...">
                      <button class="rq-btn" type="submit"><i class="ion-android-send"></i></button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div> --> <!-- /.rq-main-footer -->
      <div class="rq-copyright-section">
        <div class="container">
          <div class="copyright-content">
            <p><a href="#"><img src="img/company-logo.png" alt=""></a> © 2015 <a href="#">Lape</a>.&nbsp;&nbsp;&nbsp;<a href="tel:+995598555566">+995 598 55 55 66</a></p>
            <ul class="list-unstyled social-list">
              <li><a target="_blank" href="https://www.facebook.com/Rent-cars-tbilisi-2243113435958615/"><i class="fa fa-facebook"></i></a></li>
              <li><a target="_blank" href="https://www.instagram.com/rentcargeorgia91/"><i class="fa fa-instagram"></i></a></li> 
            </ul>
          </div>
        </div>
      </div> <!-- /.rq-copyright-section -->
    </footer>

    <script>
        {{ load('lang') | raw }}
    </script>
    <!-- jQuery 1.10.1-->
    <script src="{{ constants.THEME }}assets/js/jquery.min.js"></script>
    <script src="{{ constants.THEME }}assets/js/moment.min.js"></script>
    <script src="{{ constants.THEME }}assets/js/scripts.js"></script>


    {{ counters | raw }}
    </body>
    </html>
{% endspaceless %}