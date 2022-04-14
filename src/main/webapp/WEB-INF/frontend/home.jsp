<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" %>

<jsp:include page="/WEB-INF/frontend/common/head.jsp"></jsp:include>



<!-- banner part start-->
<section class="banner_part">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-5">
                <div class="banner_text">
                    <div class="banner_text_iner">
                        <h1>Classy and strong</h1>
                        <p>${highestPrice.name}: ${highestPrice.descriptions}</p>
                        <a href="/FrontEnd/Product/List" class="btn_1">shop now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="banner_img">
        <img style="height: 780px; width: 1046px" src="/Product/T3H/${highestPrice.img}" alt="#" class="img-fluid">
        <img src="/frontend/img/banner_pattern.png " alt="#" class="pattern_img img-fluid">
    </div>
</section>
<!-- banner part start-->

<!-- product list start-->
<section class="single_product_list">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <c:forEach items="${listDucati}" var="d">
                    <div class="single_product_iner">
                        <div class="row align-items-center justify-content-between">
                            <div class="col-lg-6 col-sm-6">
                                <div class="single_product_img">
                                    <img style="width: 520px; height: 437px" src="/Product/T3H/${d.img}" class="img-fluid" alt="#">
                                    <img src="/frontend/img/product_overlay.png" alt="#" class="product_overlay img-fluid">
                                </div>
                            </div>
                            <div class="col-lg-5 col-sm-6">
                                <div class="single_product_content">
                                    <h5>Giá: ${d.price} VNĐ</h5>
                                    <h2> <a href="single-product.html">${d.name}: ${d.descriptions} </a> </h2>
                                    <a href="/FrontEnd/Product/List" class="btn_3">Explore Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
<%--                <div class="single_product_iner">--%>
<%--                    <div class="row align-items-center justify-content-between">--%>
<%--                        <div class="col-lg-6 col-sm-6">--%>
<%--                            <div class="single_product_img">--%>
<%--                                <img src="/frontend/img/single_product_2.png" class="img-fluid" alt="#">--%>
<%--                                <img src="/frontend/img/product_overlay.png" alt="#" class="product_overlay img-fluid">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-5 col-sm-6">--%>
<%--                            <div class="single_product_content">--%>
<%--                                <h5>Started from $10</h5>--%>
<%--                                <h2> <a href="single-product.html">Printed memory foam--%>
<%--                                    brief modern throw--%>
<%--                                    pillow case</a> </h2>--%>
<%--                                <a href="product_list.html" class="btn_3">Explore Now</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="single_product_iner">--%>
<%--                    <div class="row align-items-center justify-content-between">--%>
<%--                        <div class="col-lg-6 col-sm-6">--%>
<%--                            <div class="single_product_img">--%>
<%--                                <img src="/frontend/img/single_product_3.png" class="img-fluid" alt="#">--%>
<%--                                <img src="/frontend/img/product_overlay.png" alt="#" class="product_overlay img-fluid">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-5 col-sm-6">--%>
<%--                            <div class="single_product_content">--%>
<%--                                <h5>Started from $10</h5>--%>
<%--                                <h2> <a href="single-product.html">Printed memory foam--%>
<%--                                    brief modern throw--%>
<%--                                    pillow case</a> </h2>--%>
<%--                                <a href="product_list.html" class="btn_3">Explore Now</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
        </div>
    </div>
</section>
<!-- product list end-->


<!-- trending item start-->
<section class="trending_items">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section_tittle text-center">
                    <h2>Latest product</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <c:forEach items="${listLatestDucati}" var="k">
                <div class="col-lg-4 col-sm-6">
                    <div class="single_product_item">
                        <div class="single_product_item_thumb">
                            <img style="width: 360px; height: 249px" src="/Product/T3H/${k.img}" alt="#" class="img-fluid">
                        </div>
                        <h3 style="text-align: center"> <a href="http://localhost:8080/${k.id}">${k.name}</a> </h3>
                        <p style="text-align: center">From ${k.price} VNĐ</p>
                    </div>
                </div>
            </c:forEach>

<%--            <div class="col-lg-4 col-sm-6">--%>
<%--                <div class="single_product_item">--%>
<%--                    <img src="/frontend/img/tranding_item/tranding_item_2.png" alt="#" class="img-fluid">--%>
<%--                    <h3> <a href="single-product.html">Foam filling cotton slow rebound pillows</a> </h3>--%>
<%--                    <p>From $5</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-4 col-sm-6">--%>
<%--                <div class="single_product_item">--%>
<%--                    <img src="/frontend/img/tranding_item/tranding_item_3.png" alt="#" class="img-fluid">--%>
<%--                    <h3> <a href="single-product.html">Memory foam filling cotton Slow rebound pillows</a> </h3>--%>
<%--                    <p>From $5</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-4 col-sm-6">--%>
<%--                <div class="single_product_item">--%>
<%--                    <img src="/frontend/img/tranding_item/tranding_item_4.png" alt="#" class="img-fluid">--%>
<%--                    <h3> <a href="single-product.html">Cervical pillow for airplane--%>
<%--                        car office nap pillow</a> </h3>--%>
<%--                    <p>From $5</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-4 col-sm-6">--%>
<%--                <div class="single_product_item">--%>
<%--                    <img src="/frontend/img/tranding_item/tranding_item_5.png" alt="#" class="img-fluid">--%>
<%--                    <h3> <a href="single-product.html">Foam filling cotton slow rebound pillows</a> </h3>--%>
<%--                    <p>From $5</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-4 col-sm-6">--%>
<%--                <div class="single_product_item">--%>
<%--                    <img src="/frontend/img/tranding_item/tranding_item_6.png" alt="#" class="img-fluid">--%>
<%--                    <h3> <a href="single-product.html">Memory foam filling cotton Slow rebound pillows</a> </h3>--%>
<%--                    <p>From $5</p>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
    </div>
</section>
<!-- trending item end-->

<!-- client review part here -->
<section class="client_review">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="client_review_slider owl-carousel">
                        <div class="single_client_review">
                            <div class="client_img">
                                <img style="width: 105px; height: 106px" src="/frontend/img/admin1.jpg" alt="#">
                            </div>
                            <p>"Không bao giờ là thất bại, tất cả là thử thách.</p>
                            <h5>- VirusVozer</h5>
                        </div>

                        <div class="single_client_review">
                            <div class="client_img">
                                <img style="width: 105px; height: 106px" src="/frontend/img/Admin2.jpg" alt="#">
                            </div>
                            <p>"Tôi thích đi tour, tự sửa và tự độ xe cho mình.</p>
                            <h5>- PhamNghiLd</h5>
                        </div>

                        <div class="single_client_review">
                            <div class="client_img">
                                <img style="width: 105px; height: 106px" src="/frontend/img/admin3.jpg" alt="#">
                            </div>
                            <p>"Những kẻ lữ hành không biết nơi nào họ sẽ đến..</p>
                            <h5>- NgocDiem</h5>
                        </div>




<%--                    <div class="single_client_review">--%>
<%--                        <div class="client_img">--%>
<%--                            <img src="/frontend/img/client_1.png" alt="#">--%>
<%--                        </div>--%>
<%--                        <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p>--%>
<%--                        <h5>- Micky Mouse</h5>--%>
<%--                    </div>--%>
<%--                    <div class="single_client_review">--%>
<%--                        <div class="client_img">--%>
<%--                            <img src="/frontend/img/client_2.png" alt="#">--%>
<%--                        </div>--%>
<%--                        <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p>--%>
<%--                        <h5>- Micky Mouse</h5>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- client review part end -->


<!-- feature part here -->
<section class="feature_part section_padding">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-6">
                <div class="feature_part_tittle">
                    <h3>Credibly innovate granular
                        internal or organic sources
                        whereas standards.</h3>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="feature_part_content">
                    <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic” sources. Credibly innovate granular internal or “organic” sources whereas high standards in web-readiness.</p>
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-3 col-sm-6">
                <div class="single_feature_part">
                    <img src="/frontend/img/icon/feature_icon_1.svg" alt="#">
                    <h4>Credit Card Support</h4>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="single_feature_part">
                    <img src="/frontend/img/icon/feature_icon_2.svg" alt="#">
                    <h4>Online Order</h4>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="single_feature_part">
                    <img src="/frontend/img/icon/feature_icon_3.svg" alt="#">
                    <h4>Free Delivery</h4>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="single_feature_part">
                    <img src="/frontend/img/icon/feature_icon_4.svg" alt="#">
                    <h4>Product with Gift</h4>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- feature part end -->

<!-- subscribe part here -->
<section class="subscribe_part section_padding">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="subscribe_part_content">
                    <h2>Get promotions & updates!</h2>
                    <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic” sources credibly innovate granular internal .</p>
                    <div class="subscribe_form">
                        <input type="email" placeholder="Enter your mail">
                        <a href="#" class="btn_1">Subscribe</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- subscribe part end -->

<jsp:include page="/WEB-INF/frontend/common/foot.jsp"></jsp:include>