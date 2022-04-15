<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<jsp:include page="/WEB-INF/frontend/common/head.jsp"></jsp:include>

<!-- breadcrumb part start-->
<section class="breadcrumb_part">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb_iner">
                    <h2>receipt</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- breadcrumb part end-->

<!--================Checkout Area =================-->
<section class="cart_area section_padding">
    <div class="container">
        <div class="cart_inner">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Product</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Total</th>
                        <th scope="col">Status</th>
                    </tr>
                    </thead>
                    <tbody>
<%--                    <c:if test="">--%>
                        <c:forEach items="${listCart}" var="k">
                            <c:if test="${k.status != 0 && k.status != 3}">
                                <tr>
                                    <td>
                                        <div class="media">
                                            <div class="d-flex">
                                                <img src="/Product/T3H/${k.productimg}" alt="" />
                                            </div>
                                            <div class="media-body">
                                                <p>Minimalistic shop for multipurpose use</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                            <%--                                <c:forEach items="${k.productEntity}" var="s">--%>
                                            <%--                                    <h5>${s.price}</h5>--%>
                                            <%--                                </c:forEach>--%>
                                        <h5>${k.productEntity.price}</h5>
                                    </td>
                                    <td >
                                        <div class="product_count">
                                            <!-- <input type="text" value="1" min="0" max="10" title="Quantity:"
                                              class="input-text qty input-number" />
                                            <button
                                              class="increase input-number-increment items-count" type="button">
                                              <i class="ti-angle-up"></i>
                                            </button>
                                            <button
                                              class="reduced input-number-decrement items-count" type="button">
                                              <i class="ti-angle-down"></i>
                                            </button> -->
                                                <%--                                    <span class="input-number-decrement" id="decre-${k.id}"><i class="ti-minus"></i></span>--%>
                                            <div class="input-number1"  id="element-${k.id}" >${k.number}</div>
                                                <%--                                    <span class="input-number-increment" id="incre-${k.id}"> <i class="ti-plus"></i></span>--%>
                                        </div>
                                    </td>
                                    <td>
                                        <c:set var="total" value="${k.number * k.productEntity.price}"></c:set>
                                        <h5 id="get_total_price_${k.id}">${total}</h5>
                                    </td>
                                    <td>
                                        <c:if test="${k.status == 1}">
                                            <h5>Đặt Hàng Thành Công</h5>
                                        </c:if>
                                        <c:if test="${k.status == 2}">
                                            <h5>Đang Giao Hàng</h5>
                                        </c:if>
<%--                                        <c:if test="${k.status == 3}">--%>
<%--                                            <h5>Giao Hàng Thành Công</h5>--%>
<%--                                        </c:if>--%>
                                    </td>
<%--                                    <script>--%>
<%--                                       --%>
<%--                                        document.getElementById("element-${k.id}").value = ${k.number}--%>

<%--                                    </script>--%>
                                </tr>
                            </c:if>
                        </c:forEach>
<%--                    </c:if>--%>


                    <%--                    <tr>--%>
                    <%--                        <td>--%>
                    <%--                            <div class="media">--%>
                    <%--                                <div class="d-flex">--%>
                    <%--                                    <img src="/frontend/img/arrivel/arrivel_2.png" alt="" />--%>
                    <%--                                </div>--%>
                    <%--                                <div class="media-body">--%>
                    <%--                                    <p>Minimalistic shop for multipurpose use</p>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            <h5>$360.00</h5>--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            <div class="product_count">--%>
                    <%--                                <span class="input-number-decrement"> <i class="ti-minus"></i></span>--%>
                    <%--                                <input class="input-number" type="text" value="1" min="0" max="10">--%>
                    <%--                                <span class="input-number-increment"> <i class="ti-plus"></i></span>--%>
                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            <h5>$720.00</h5>--%>
                    <%--                        </td>--%>
                    <%--                    </tr>--%>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <h5>Subtotal</h5>
                        </td>
                        <td>
                            <%--                            <h5 id="subtotal">${subtotal}</h5>--%>
                            <h5 id="subtotal"></h5>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="checkout_btn_inner float-right">
                    <a class="btn_1" href="/FrontEnd/Product/List">Continue Shopping</a>
<%--                    <a class="btn_1 checkout_btn_1" id="checkout" href="#">Hủy đơn hàng</a>--%>
                </div>
            </div>
        </div>
</section>
<script>
    document.getElementById("subtotal").innerHTML
        =
        <c:forEach items="${listCart}" var="k1">
            <c:if test="${k1.status != 0 && k1.status != 3}">
                +(Number(document.getElementById("get_total_price_${k1.id}").textContent) || 0)
            </c:if>
        </c:forEach>
</script>
<!--================End Checkout Area =================-->

<jsp:include page="/WEB-INF/frontend/common/foot.jsp"></jsp:include>