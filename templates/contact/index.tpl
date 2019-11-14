{% extends "index.tpl" %}

{% block head %}
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&key=AIzaSyAbFuepJJ9CxjpIwK8A8OW9kxvL9OWm9Ts"></script>
{% endblock %}

{% block content %}
    <!-- Main of the Page -->
    <main id="mt-main">
      <!-- Mt Contact Banner of the Page -->
      <section class="mt-contact-banner wow fadeInUp" data-wow-delay="0.4s">
        <div class="container">
          <div class="row">
            <div class="col-xs-12 text-center">
              <h1>{{ langs.contact }}</h1>
              <nav class="breadcrumbs">
                <ul class="list-unstyled">
                  <li><a href="{{ globals.uri }}">{{ langs.main }} <i class="fa fa-angle-right"></i></a></li>
                  <li><a href="#">{{ langs.contact }}</a></li>
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </section><!-- Mt Contact Banner of the Page -->
      <!-- Mt Contact Detail of the Page -->
      <section class="mt-contact-detail content-info wow fadeInUp" data-wow-delay="0.4s">
        <div class="container-fluid">
          <div class="row">
            <div class="col-xs-12 col-sm-8">
              <div class="txt-wrap">
                <h2>{{ langs.contact_info }}</h2>
                <p>{{ contact.contact_desc }}</p>
              </div>
              <ul class="list-unstyled contact-txt">
                <li>
                  <strong>{{ langs.address }}</strong>
                  <address>{{ contact.contact_address }}</address>
                </li>
                <li>
                  <strong>{{ langs.phone }}</strong>
                  <a href="#">{{ contact.contact_phone1 }}{{ contact.contact_phone2 ? '; ' ~ contact.contact_phone2 }}</a>
                </li>
                <li>
                  <strong>{{ langs.email }}</strong>
                  <a href="#">{{ contact.contact_email1 }}</a>
                </li>
              </ul>
            </div>
            <div class="col-xs-12 col-sm-4">
              <h2>{{ langs.contact }}</h2>
              <!-- Contact Form of the Page -->
              <form id="contactform" class="contact-form" name="contactform" method="post" novalidate>
                <fieldset>
                  <input name="name" type="text" class="form-control" placeholder="{{ langs.name }}">
                  <input  name="email" type="email" class="form-control" placeholder="{{ langs.email }}">
                  <input name="subject" type="text" class="form-control" placeholder="{{ langs.subject }}">
                  <textarea name="message" class="form-control" placeholder="{{ langs.message }}"></textarea>
                  <input type="hidden" name="ajax" value="true">
                  <button class="btn-type3" id="submit" type="submit">{{ langs.send_message }}</button>
                </fieldset>
              </form>
              <!-- Contact Form of the Page end -->
            </div>
          </div>
        </div>
      </section><!-- Mt Contact Detail of the Page end -->
    </main>
{% endblock %}

{% block footer %}
    <!-- jQuery form validation -->
    <script src="{{ constants.THEME }}assets/js/build/plugins/form/jquery.form.min.js{{ constants.ver }}"></script>
    <script src="{{ constants.THEME }}assets/js/build/plugins/form/jquery.validate.min.js{{ constants.ver }}"></script>
    <script src="{{ constants.THEME }}assets/js/build/view/contact/contact.min.js{{ constants.ver }}"></script>
{% endblock %}
