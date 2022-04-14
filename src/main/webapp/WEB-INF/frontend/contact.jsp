<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" %>

<jsp:include page="/WEB-INF/frontend/common/head.jsp"></jsp:include>

<!-- breadcrumb part start-->
<section class="breadcrumb_part">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb_iner">
                    <h2>contact</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- breadcrumb part end-->

<!-- ================ contact section start ================= -->
<section class="contact-section section_padding">
    <div class="container">
        <div class="d-none d-sm-block mb-5 pb-4">
            <div id="map" style="height: 480px; text-align: center">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.8666458646844!2d105.77191231486907!3d21.038021185993266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313455f90fe8ad65%3A0xec38b94cb36de0ab!2zVmnhu4duIEPDtG5nIG5naOG7hyB0aMO0bmcgdGluIFQzSA!5e0!3m2!1svi!2s!4v1649948177762!5m2!1svi!2s" width="800" height="600" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
            <script>
                function initMap() {
                    var uluru = {
                        lat: -25.363,
                        lng: 131.044
                    };
                    var grayStyles = [{
                        featureType: "all",
                        stylers: [{
                            saturation: -90
                        },
                            {
                                lightness: 50
                            }
                        ]
                    },
                        {
                            elementType: 'labels.text.fill',
                            stylers: [{
                                color: '#ccdee9'
                            }]
                        }
                    ];
                    var map = new google.maps.Map(document.getElementById('map'), {
                        center: {
                            lat: -31.197,
                            lng: 150.744
                        },
                        zoom: 9,
                        styles: grayStyles,
                        scrollwheel: false
                    });
                }
            </script>


        </div>


        <div class="row" style="padding-top: 70px">
            <div class="col-12">
                <h2 class="contact-title">Get in Touch</h2>
            </div>
            <div class="col-lg-8">
                <form class="form-contact contact_form" action="contact_process.php" method="post" id="contactForm"
                      novalidate="novalidate">
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">

                  <textarea class="form-control w-100" name="message" id="message" cols="30" rows="9"
                            onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'"
                            placeholder='Enter Message'></textarea>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <input class="form-control" name="name" id="name" type="text" onfocus="this.placeholder = ''"
                                       onblur="this.placeholder = 'Enter your name'" placeholder='Enter your name'>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <input class="form-control" name="email" id="email" type="email" onfocus="this.placeholder = ''"
                                       onblur="this.placeholder = 'Enter email address'" placeholder='Enter email address'>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <input class="form-control" name="subject" id="subject" type="text" onfocus="this.placeholder = ''"
                                       onblur="this.placeholder = 'Enter Subject'" placeholder='Enter Subject'>
                            </div>
                        </div>
                    </div>
                    <div class="form-group mt-3">
                        <a href="#" class="btn_3 button-contactForm">Send Message</a>
                    </div>
                </form>
            </div>
            <div class="col-lg-4">
                <div class="media contact-info">
                    <span class="contact-info__icon"><i class="ti-home"></i></span>
                    <div class="media-body">
                        <h3>Hà Nội, Việt Nam</h3>
                        <p>Đường Hồ Tùng Mậu - Mai Dịch - Cầu Giấy</p>
                    </div>
                </div>
                <div class="media contact-info">
                    <span class="contact-info__icon"><i class="ti-tablet"></i></span>
                    <div class="media-body">
                        <h3>0378996674</h3>
                        <p>Mon to Fri 9am to 6pm</p>
                    </div>
                </div>
                <div class="media contact-info">
                    <span class="contact-info__icon"><i class="ti-email"></i></span>
                    <div class="media-body">
                        <h3>viencntt3h@gmail.com</h3>
                        <p>Send us your query anytime!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ================ contact section end ================= -->

<jsp:include page="/WEB-INF/frontend/common/foot.jsp"></jsp:include>