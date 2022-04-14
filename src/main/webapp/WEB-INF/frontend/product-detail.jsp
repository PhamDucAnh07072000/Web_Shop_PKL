<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" %>

<jsp:include page="/WEB-INF/frontend/common/head.jsp"></jsp:include>

<!-- breadcrumb part start-->
<section class="breadcrumb_part single_product_breadcrumb">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb_iner">
                </div>
            </div>
        </div>
    </div>
</section>
<!-- breadcrumb part end-->

<!--================Single Product Area =================-->
<div class="product_image_area">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div style="text-align: center" class="product_img">
                    <div class="single_product_img">
                        <img style="width: 1140px; height: 697px" src="/Product/T3H/${product.img}" alt="#" class="img-fluid">
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="single_product_text text-center">
                    <h3>${product.name}</h3>
                    <p style="font-size: 20px">
                        ${product.descriptions}
                    </p>
                    <div class="card_area">
                        <div class="product_count_area">
                            <p>Quantity</p>
                            <div class="product_count d-inline-block">
                                <span class="product_count_item inumber-decrement"> <i class="ti-minus"></i></span>
                                <input class="product_count_item input-number" id="num" type="text" value="1" min="0" max="10">
                                <span class="product_count_item number-increment"> <i class="ti-plus"></i></span>
                            </div>
                            <p>${product.price}</p>
                        </div>
                        <div class="add_to_cart">
                            <a href="javascript:;" class="btn_3">add to cart</a>
<%--                            <a href="  " class="btn_3">add to cart</a>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--================End Single Product Area =================-->
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
                        <a href="/FrontEnd/Product/Cart" class="btn_1">Subscribe</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/frontend/common/foot.jsp"></jsp:include>
<script>
    $('.add_to_cart').click(function () {
        $.ajax({
            type: "POST",
            contentType: 'application/json;charset=UTF-8',
            url: "/FrontEnd/Product/Cart",
            success: function (data) {
                alert("Thêm Vào Giỏ Hàng Thành công")
            },
            error: function (error) {
                alert("Lỗi")
            },
            async: true,
            data: JSON.stringify({
                number: $('#num').val(),
                productId: ${product.id} ,
                userId : ${userId},
                productImg: '${product.img}'
            }),
            cache: false,
            processData: false,
            timeout: 60000
        });
    })
</script>