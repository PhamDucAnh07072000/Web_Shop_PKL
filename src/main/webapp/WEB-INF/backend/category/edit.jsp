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
                <form id="form-1" action="/BackEnd/Category/Save" method="post">
                    <!-- 2 column grid layout with text inputs for the first and last names -->
                    <input type="text" name="id" id="form6Example0" hidden class="form-control" value="${category.id}" />
                    <div class="row mb-4">
                        <div class="col">
                            <div class="form-outline ">
                                <label class="form-label" for="form6Example1">Name</label>
                                <input type="text" name="name" id="form6Example1" class="form-control" value="${category.name}" />
                            </div>
                        </div>
                    </div>

                    <div class="form-outline mb-4">
                        <label class="form-label" for="form6Example1">Image</label>
                        <input type="file" id="fileUploadId" class="form-control" />
                        <input type="text" name="img" hidden  class="form-control" id="fileUploadName" value="${category.img}">
                    </div>
                    <div class="col-md-6">
                        <img id="outputImage" src="/Category/T3H/${category.img}" width="200px">
                    </div>

                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary btn-block mb-4">Sửa Danh Mục</button>
                </form>
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




