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
                <form id="form-1" action="/BackEnd/User/Save" method="post">
                    <!-- 2 column grid layout with text inputs for the first and last names -->
                    <div class="row mb-4">
                        <div class="col">
                            <div class="form-outline ">
                                <label class="form-label" for="form6Example1">User Name</label>
                                <input type="text" name="userName" id="form6Example1" class="form-control" />
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-outline ">
                                <label class="form-label" for="form6Example2">Email</label>
                                <input type="email" name="email" id="form6Example2" class="form-control" placeholder="Nhập Email" />
                            </div>
                        </div>
                    </div>

                    <!-- Text input -->
                    <div class="form-outline mb-4 ">
                        <label class="form-label" for="form6Example4">PassWord</label>
                        <input type="password" name="passwd" id="form6Example4" class="form-control" />
                    </div>



                    <div class="form-outline mb-4">
                        <label class="form-label" for="form6Example5">Descriptions</label>
                        <input type="text" name="descriptions" id="form6Example5" class="form-control" />
                    </div>

                    <div class="form-outline mb-4">
                        <label class="form-label" for="form6Example6">Phone</label>
                        <input type="number" name="phone" id="form6Example6" class="form-control" />
                    </div>


                    <div class="form-outline mb-4 ">
                        <label class="form-label" for="form6Example3">Permissions</label>
                        <%--                            <input type="text" name="brand" id="form6Example3" class="form-control" />--%>
                        <select class="form-select" name="permissions" id="form6Example3" required>
                            <option selected disabled value="">Chọn quyền</option>
                            <c:forEach items="${permissions}" var="k">
                                <option value="${k}">${k}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-outline mb-4">
                        <label class="form-label" for="fileUploadId">Image</label>
                        <input type="file" id="fileUploadId" class="form-control" />
                        <input type="text" name="avatar" hidden  class="form-control" id="fileUploadName" >
                    </div>
                    <div class="col-md-6">
                        <img id="outputImage" width="200px">
                    </div>

                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary btn-block mb-4">Tạo mới sản phẩm</button>
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
<jsp:include page="/WEB-INF/common/footerUser.jsp" />



</body>

</html>




