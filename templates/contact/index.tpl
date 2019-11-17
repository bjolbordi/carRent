{% extends "index.tpl" %}

{% block head %}
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&key=AIzaSyAbFuepJJ9CxjpIwK8A8OW9kxvL9OWm9Ts"></script>
{% endblock %}

{% block content %}
          <div class="inner-page-banner" style="background: url('{{ constants.THEME }}assets/img/inner-banner/contact-us.jpg') top center no-repeat; background-size: cover;">
        <div class="rq-overlay"></div>
        <div class="container">
          <div class="rq-title-container bredcrumb-title text-center">
            <h2 class="rq-title">Contact Us</h2>
            <ol class="breadcrumb rq-subtitle">
              <li><a href="#">Home</a></li>
              <li class="active">Contact Us</li>
            </ol>
          </div>
        </div>
      </div> <!-- /. inner pagebanner -->
      <div class="rq-page-content">
        <div class="rq-content-block">
          <div class="container">
            <div class="rq-contact-us-grid-block"> <!-- start info portion -->
              <div class="row">
                <div class="col-md-4">
                  <div class="grid-block-single">
                    <i class="icon_mobile"></i>
                    <h3>Phone</h3>
                    <p>{{ contact.contact_phone1 }}{{ contact.contact_phone2 ? '; ' ~ contact.contact_phone2 }} (Whatsapp, Telegram, Viber)</p>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="grid-block-single">
                    <i class="icon_pin_alt"></i>
                    <h3>Address</h3>
                    <p>{{ contact.contact_address }}</p>
                    
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="grid-block-single">
                    <i class="icon_mail_alt"></i>
                    <h3>Email</h3>
                    <p>{{ contact.contact_email1 }}</p>
                  </div>
                </div>
              </div>
            </div> <!-- end info portion -->

            <div class="rq-contact-us-form-content"> <!-- start message form -->
              <!-- <h3>If you got any questions <br>please do not hesitate to send us a message</h3>
              <form action="#">
                <input type="text" class="contact-form-input" placeholder="Your name">
                <input type="email" class="contact-form-input" placeholder="Your email">
                <input type="text" class="contact-form-input" placeholder="Subject">
                <textarea class="contact-form-input" placeholder="Message"></textarea>
                <div class="submit-btn">
                  <button type="submit" class="rq-btn rq-btn-primary">Send Message</button>
                </div>
              </form>
            </div> --> <!-- end message form -->\ 
          </div>
        </div>
      </div>
    </div> <!-- end #main-wrapper -->
{% endblock %}

{% block footer %}
    <!-- jQuery form validation -->
    <script src="{{ constants.THEME }}assets/js/build/plugins/form/jquery.form.min.js{{ constants.ver }}"></script>
    <script src="{{ constants.THEME }}assets/js/build/plugins/form/jquery.validate.min.js{{ constants.ver }}"></script>
    <script src="{{ constants.THEME }}assets/js/build/view/contact/contact.min.js{{ constants.ver }}"></script>
{% endblock %}
