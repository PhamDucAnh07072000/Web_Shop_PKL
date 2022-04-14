<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" %>


<jsp:include page="/WEB-INF/frontend/common/head.jsp"></jsp:include>

<!-- breadcrumb part start-->
<section class="breadcrumb_part">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb_iner">
                    <h2>product list</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- breadcrumb part end-->

<!-- product list part start-->
<section class="product_list section_padding">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="product_sidebar">
                    <div class="single_sedebar">
                        <form action="#">
                            <input type="text" id="searchProduct" name="#" placeholder="Search keyword" value="${keyWord}">
                            <a id="btn"><i class="ti-search"></i></a>
                        </form>
                    </div>
                    <div class="single_sedebar">
                        <div class="select_option">
                            <div class="select_option_list">Category <i class="right fas fa-caret-down"></i> </div>
                            <div class="select_option_dropdown">
                                <c:forEach items="${category}" var="k">
                                    <p><a href="/FrontEnd/${path}/List?&sort=${sort}&field=${field}&brand=${k.name}">${k.name}</a></p>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="single_sedebar">
                        <div class="select_option">
                            <div class="select_option_list">Price<i class="right fas fa-caret-down"></i> </div>
                            <div class="select_option_dropdown">
                                <p><a href="/FrontEnd/${path}/List?page=${page}&sort=${sort}&field=${field}&start=5000000&end=100000000">5.000.0000 VNĐ -> 100.000.000 VNĐ</a></p>
                                <p><a href="/FrontEnd/${path}/List?page=${page}&sort=${sort}&field=${field}&start=100000000&end=200000000">100.000.000 VNĐ -> 200.000.000 VNĐ</a></p>
                                <p><a href="/FrontEnd/${path}/List?page=${page}&sort=${sort}&field=${field}&start=200000000&end=500000000">200.000.000 VNĐ -> 500.000.000 VNĐ</a></p>
                                <p><a href="/FrontEnd/${path}/List?page=${page}&sort=${sort}&field=${field}&start=500000000&end=1000000000">500.000.000 VNĐ -> 1.000.000.000 VNĐ</a></p>
                                <p><a href="/FrontEnd/${path}/List?page=${page}&sort=${sort}&field=${field}&start=1000000000&end=5000000000">1.000.000.000 VNĐ -> 5.000.000.000 VNĐ</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="product_list">
                    <div class="row">
                        <c:forEach items="${data}" var="k" >
                            <div class="col-lg-6 col-sm-6">
                                <div class="single_product_item">
                                    <img style="width: 360px; height: 249px" src="/Product/T3H/${k.img}" alt="#" class="img-fluid">
                                    <h3 style="text-align: center"> <a href="/FrontEnd/Product/${k.id}">${k.descriptions}</a> </h3>
                                    <p style="text-align: center">From ${k.price} VNĐ</p>
                                </div>
                            </div>
                        </c:forEach>
<%--                        <div class="col-lg-6 col-sm-6">--%>
<%--                            <div class="single_product_item">--%>
<%--                                <img src="img/product/product_list_2.png" alt="#" class="img-fluid">--%>
<%--                                <h3> <a href="single-product.html">Geometric striped flower home classy decor</a> </h3>--%>
<%--                                <p>From $5</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-6 col-sm-6">--%>
<%--                            <div class="single_product_item">--%>
<%--                                <img src="img/product/product_list_3.png" alt="#" class="img-fluid">--%>
<%--                                <h3> <a href="single-product.html">Foam filling cotton slow rebound pillows</a> </h3>--%>
<%--                                <p>From $5</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-6 col-sm-6">--%>
<%--                            <div class="single_product_item">--%>
<%--                                <img src="img/product/product_list_4.png" alt="#" class="img-fluid">--%>
<%--                                <h3> <a href="single-product.html">Memory foam filling cotton Slow rebound pillows</a> </h3>--%>
<%--                                <p>From $5</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-6 col-sm-6">--%>
<%--                            <div class="single_product_item">--%>
<%--                                <img src="img/product/product_list_5.png" alt="#" class="img-fluid">--%>
<%--                                <h3> <a href="single-product.html">Memory foam filling cotton Slow rebound pillows</a> </h3>--%>
<%--                                <p>From $5</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-6 col-sm-6">--%>
<%--                            <div class="single_product_item">--%>
<%--                                <img src="img/product/product_list_6.png" alt="#" class="img-fluid">--%>
<%--                                <h3> <a href="single-product.html">Sleeping orthopedic sciatica Back Hip Joint Pain relief</a> </h3>--%>
<%--                                <p>From $5</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-6 col-sm-6">--%>
<%--                            <div class="single_product_item">--%>
<%--                                <img src="img/product/product_list_7.png" alt="#" class="img-fluid">--%>
<%--                                <h3> <a href="single-product.html">Memory foam filling cotton Slow rebound pillows</a> </h3>--%>
<%--                                <p>From $5</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-6 col-sm-6">--%>
<%--                            <div class="single_product_item">--%>
<%--                                <img src="img/product/product_list_8.png" alt="#" class="img-fluid">--%>
<%--                                <h3> <a href="single-product.html">Sleeping orthopedic sciatica Back Hip Joint Pain relief</a> </h3>--%>
<%--                                <p>From $5</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-6 col-sm-6">--%>
<%--                            <div class="single_product_item">--%>
<%--                                <img src="img/product/product_list_9.png" alt="#" class="img-fluid">--%>
<%--                                <h3> <a href="single-product.html">Geometric striped flower home classy decor</a> </h3>--%>
<%--                                <p>From $5</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-6 col-sm-6">--%>
<%--                            <div class="single_product_item">--%>
<%--                                <img src="img/product/product_list_10.png" alt="#" class="img-fluid">--%>
<%--                                <h3> <a href="single-product.html">Geometric striped flower home classy decor</a> </h3>--%>
<%--                                <p>From $5</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                    <div class="load_more_btn text-center" style="display: flex; justify-content: center">
                        <c:if test="${totalPage > 1}">
                            <jsp:include page="/WEB-INF/frontend/common/pagination.jsp"/>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- product list part end-->

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