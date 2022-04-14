<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" %>

<nav aria-label="Page navigation example">
    <ul class="pagination">
        <li class="page-item <c:if test="${page == 1}">disabled</c:if>"  ><a class="page-link" href="/BackEnd/${path}/List?page=${page - 1}&sort=${sort}&field=${field}&keyWord=${keyWord}">Trước</a></li>
         <c:forEach begin="1" end="${totalPage}" var="p" step="1">
             <li class="page-item <c:if test="${page == p}" > active </c:if> " ><a class="page-link" href="/BackEnd/${path}/List?page=${p}&sort=${sort}&field=${field}&keyWord=${keyWord}">${p}</a></li>
        </c:forEach>
        <li class="page-item <c:if test="${page == totalPage}" >disabled</c:if>" ><a class="page-link" href="/BackEnd/${path}/List?page=${page + 1}&sort=${sort}&field=${field}&keyWord=${keyWord}">Sau</a></li>
    </ul>
</nav>

