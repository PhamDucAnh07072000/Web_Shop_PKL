<!--::footer_part start::-->
<footer class="footer_part">
    <div class="footer_iner">
        <div class="container">
            <div class="row justify-content-between align-items-center">
                <div class="col-lg-8">
                    <div class="footer_menu">
                        <div class="footer_logo">
                            <a href="http://localhost:8080/"><img style="width: 185px; height: 180px" src="/frontend/img/logo.png" alt="#"></a>
                        </div>
                        <div class="footer_menu_item">
                            <a href="index.html">Home</a>
                            <a href="about.html">About</a>
                            <a href="product_list.html">Products</a>
                            <a href="#">Pages</a>
                            <a href="blog.html">Blog</a>
                            <a href="contact.html">Contact</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="social_icon">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="copyright_part">
        <div class="container">
            <div class="row ">
                <div class="col-lg-12">
                    <div class="copyright_text">
                        <P><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></P>
                        <div class="copyright_link">
                            <a href="#">Turms & Conditions</a>
                            <a href="#">FAQ</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!--::footer_part end::-->

<!-- jquery plugins here-->
<script src="/frontend/js/jquery-1.12.1.min.js"></script>
<!-- popper js -->
<script src="/frontend/js/popper.min.js"></script>
<!-- bootstrap js -->
<script src="/frontend/js/bootstrap.min.js"></script>
<!-- magnific popup js -->
<script src="/frontend/js/jquery.magnific-popup.js"></script>
<!-- swiper js -->
<script src="/frontend/js/swiper.min.js"></script>
<!-- swiper js -->
<script src="/frontend/js/mixitup.min.js"></script>
<!-- carousel js -->
<script src="/frontend/js/owl.carousel.min.js"></script>
<script src="/frontend/js/jquery.nice-select.min.js"></script>
<!-- slick js -->
<script src="/frontend/js/slick.min.js"></script>
<script src="/frontend/js/jquery.counterup.min.js"></script>
<script src="/frontend/js/waypoints.min.js"></script>
<script src="/frontend/js/contact.js"></script>
<script src="/frontend/js/jquery.ajaxchimp.min.js"></script>
<script src="/frontend/js/jquery.form.js"></script>
<script src="/frontend/js/jquery.validate.min.js"></script>
<script src="/frontend/js/mail-script.js"></script>
<!-- custom js -->
<script src="/frontend/js/custom.js"></script>
<script>
    $("#btn").click(function () {
        window.location.href = '/FrontEnd/${path}/List?page=${page}&sort=${sort}&field=${field}&keyWord=' + $('#searchProduct').val()
    })
</script>
</body>

</html>