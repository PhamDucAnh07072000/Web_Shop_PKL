<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="/WEB-INF/common/header.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/common/nav-header.jsp" />
<!-- partial -->
<div class="main-panel">
    <div class="content-wrapper">
        <div class="bg-light p-5 rounded">
            <div class="col-sm-pull-11 mx-auto">
                <table class="table">
                    <thead class="thead-dark">
                    <tr>
                        <th style="text-align: center" scope="col">STT</th>
                        <th style="text-align: center" scope="col">UserName</th>
                        <th style="text-align: center" scope="col">Email</th>
                        <th style="text-align: center" scope="col">Product</th>
                        <th style="text-align: center" scope="col">
                            <a href="/BackEnd/${path}/List?page=${page}&sort=desc&field=number&keyWord=${keyWord}"><i style="padding-right: 5px" class="fa fa-angle-down"></i></a>
                            <a style="color: #000000; text-decoration: unset" href="/BackEnd/${path}/List?page=${page}">Number</a>
                            <a href="/BackEnd/${path}/List?page=${page}&sort=asc&field=number&keyWord=${keyWord}"><i class="fa fa-angle-up"></i></a>
                        </th>
                        <th style="text-align: center" scope="col">Image</th>
                        <th style="text-align: center" scope="col">Status</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:set var="stt" value="1"></c:set>
                    <c:forEach items="${data}" var="k" >
                        <tr>
                            <th style="text-align: center; font-size: 18px" scope="row">${stt}</th>
                            <td style="text-align: center; font-size: 18px">${k.userEntity.username }</td>
                            <td style="text-align: center; font-size: 18px">${k.userEntity.email}</td>
                            <td style="text-align: center; font-size: 18px">${k.productEntity.name}</td>
                            <td style="text-align: center; font-size: 18px">${k.number}</td>
                            <td style="text-align: center; font-size: 18px"><img style="border-radius: unset; width: 150px; height: 150px" src="/Product/T3H/${k.productimg}" alt="Image"></td>
                            <td style="text-align: center; font-size: 18px">
                                <select id="statusOder_${k.id}">
                                        <c:forEach items="${statusCon}" var="s">
                                            <option id="optionStatus-${k.id}" value="${s}" <c:if test ="${s == k.status}">selected</c:if> >
                                                <c:if test="${s == 0}">
                                                    Hủy Đơn Hàng
                                                </c:if>

                                                <c:if test="${s == 1}">
                                                    Đặt Hàng Thành Công
                                                </c:if>

                                                <c:if test="${s == 2}">
                                                    Đang Giao Hàng
                                                </c:if>

                                                <c:if test="${s == 3}">
                                                    Giao Hàng Thành Công
                                                </c:if>

                                            </option>
                                        </c:forEach>
                                </select>
                            </td>
                            <script>
                                $('#statusOder_${k.id}').change(function () {
                                    let number = $('#statusOder_${k.id}').val();
                                    $.ajax({
                                        type: "POST",
                                        contentType: 'application/json;charset=UTF-8',
                                        url: "/BackEnd/Receipt/UpdateCheckOut/${k.id}",
                                        success: function (data) {
                                            alert("Update Giỏ Hàng Thành công")
                                        },
                                        error: function (error) {
                                            alert("Lỗi")
                                        },
                                        async: true,
                                        data: JSON.stringify({
                                            status: number,
                                            <%--productId: ${k.productid} ,--%>
                                            <%--userId : ${k.userid},--%>
                                            <%--productImg: '${k.productimg}'--%>
                                        }),
                                        cache: false,
                                        processData: false,
                                        timeout: 60000

                                    });
                                })
                            </script>
                        </tr>
                        <c:set var="stt" value="${stt+1}"></c:set>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
        <c:if test="${totalPage > 1}">
            <jsp:include page="/WEB-INF/common/pagination.jsp"/>
        </c:if>
    </div>
    <!-- content-wrapper ends -->
    <!-- partial:partials/_footer.html -->
    <footer class="footer">
        <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Copyright © 2021. All rights reserved.</span>
        </div>
    </footer>
    <!-- partial -->
</div>
<!-- main-panel ends -->
</div>
<!-- page-body-wrapper ends -->
</div>
<jsp:include page="/WEB-INF/common/footerUser.jsp" />
</body>

</html>

