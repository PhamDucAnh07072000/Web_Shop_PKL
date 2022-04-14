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
                                <th style="text-align: center" scope="col">
                                    <a href="/BackEnd/${path}/List?page=${page}&sort=desc&field=name&keyWord=${keyWord}"><i style="padding-right: 5px" class="fa fa-angle-down"></i></a>
                                    <a style="color: #000000; text-decoration: unset" href="/BackEnd/${path}/List?page=${page}">Name</a>
                                    <a href="/BackEnd/${path}/List?page=${page}&sort=asc&field=name&keyWord=${keyWord}"><i class="fa fa-angle-up"></i></a>
                                </th>
                                <th style="text-align: center" scope="col">Image</th>
                                <th style="text-align: center" scope="col">Options</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:set var="stt" value="1"></c:set>
                            <c:forEach items="${data}" var="k" >
                                <tr>
                                    <th style="text-align: center; font-size: 18px" scope="row">${stt}</th>
                                    <td style="text-align: center; font-size: 18px">${k.name}</td>
                                    <td style="text-align: center; font-size: 18px"><img style="border-radius: unset; width: 150px; height: 150px" src="/Category/T3H/${k.img}" alt="Image"></td>
                                    <td style="text-align: center; font-size: 18px">
                                        <a style="margin-right: 8px" href="/BackEnd/Category/Detail/${k.id}"><i style="font-size: 25px" class="fas fa-edit"></i></a>
                                        <a style="margin-left: 8px"href="/BackEnd/Category/Delete/${k.id}" ><i style="font-size: 25px; color: red" class="fas fa-trash-alt"></i></a>
                                    </td>
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
                <h2 style="text-align: center; color: red">${messenger}</h2>
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
<jsp:include page="/WEB-INF/common/footerCategory.jsp" />
</body>

</html>

