{% extends "index.tpl" %}

{% block head %}

{% endblock %}

{% block content %}
      <div class="rq-page-content">
        <div class="inner-page-banner" style="background: url('img/inner-banner/about-us.jpg') top center no-repeat; background-size: cover;">
          <div class="rq-overlay"></div>
          <div class="container">
            <div class="rq-title-container bredcrumb-title">
              <h2 class="rq-title">About Us</h2>
              <ol class="breadcrumb rq-subtitle">
                <li><a href="#">Home</a></li>
                <li class="active">About Us</li>
              </ol>
            </div>
          </div>
        </div> <!-- /. inner pagebanner -->
        <div class="rq-content-block">
          <div class="rq-about-us-content-wrapper">
            <div class="container">
              <div class="about-us-content-single">
                <div class="row">
                  <div class="col-md-4">
                    <h2 class="brand-title">About Us<span class="dot">.</span></h2>
                  </div>
                  <div class="col-md-8">
                    <div class="about-us-text">
                      <!-- <p><strong>Lorem Ipsum is simply dummy text of the printing and typesetting industry</strong></p> -->
                      <p>
                       {{ contact.contact_desc }}
                      </p>
                      
                    </div>
                  </div>
                </div>
              </div> <!-- end of brand -->
              <div class="about-us-content-single"> <!-- start of contact info -->
                <div class="row">
                  <div class="col-md-4">
                    <h2 class="brand-title">Contact Us<span class="dot">.</span></h2>
                  </div>
                  <div class="col-md-8">
                    <div class="contact-single">
                      <i class="icon_pin"></i>
                      <p>{{ contact.contact_address }}</p>
                    </div>
                    <div class="contact-single">
                      <i class="icon_mail_alt"></i>
                      <p>{{ contact.contact_email1 }}</p>
                    </div>
                    <div class="contact-single">
                      <i class="icon_phone"></i>
                      <p>{{ contact.contact_phone1 }}{{ contact.contact_phone2 ? '; ' ~ contact.contact_phone2 }} (Whatsapp, Telegram, Viber)(Whatsapp, Telegram, Viber)</p>
                    </div>
                    <div class="opening-hour">
                      <p> HOUR WORK:  <span> 24/7</span></p>
                    </div>
                  </div>
                </div>
              </div> <!-- end of contact info -->
              
            </div>
          </div>
        </div>
      </div>
{% endblock %}

{% block footer %}

{% endblock %}
