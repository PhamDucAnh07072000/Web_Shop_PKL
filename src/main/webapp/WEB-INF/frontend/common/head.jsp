<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!doctype html>
<html lang="zxx">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>pillloMart</title>
    <link rel="icon" href="/frontend/img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/frontend/css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="/frontend/css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="/frontend/css/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="/frontend/css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="/frontend/css/flaticon.css">
    <link rel="stylesheet" href="/frontend/css/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="/frontend/css/magnific-popup.css">
    <link rel="stylesheet" href="/frontend/css/nice-select.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="/frontend/css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="/frontend/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="/frontend/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<!--::header part start::-->
<header class="main_menu home_menu">
    <div class="container">
        <div class="row align-items-center justify-content-center">
            <div class="col-lg-12">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand" href="index.html"> <img style="width: 150px; height: 130px" src="/frontend/img/logo.png" alt="logo"> </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="menu_icon"><i class="fas fa-bars"></i></span>
                    </button>

                    <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="http://localhost:8080/">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/FrontEnd/Contact/Map">Contact</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_1"
                                   role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    product
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                    <a class="dropdown-item" href="/FrontEnd/Product/List"> product list</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_3"
                                   role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    account
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                    <a class="dropdown-item" href="/_admin/login">
                                        login
                                    </a>
                                    <a class="dropdown-item" href="/_member/signup">signup</a>
                                    <sec:authorize access="hasAnyRole('ADMIN', 'STAFF', 'MEMBER')">
                                    <a class="dropdown-item" href="/BackEnd/Email/changePassWord">chang password</a>
                                    </sec:authorize>
                                    <a class="dropdown-item" href="/logout">logout</a>
                                </div>
                            </li>
                            <sec:authorize access="hasAnyRole('ADMIN', 'STAFF', 'MEMBER')">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_2"
                                       role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        shopping
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                            <a class="dropdown-item" href="/FrontEnd/Cart/List/<sec:authentication property="principal.id"></sec:authentication>">shopping cart</a>
                                            <a class="dropdown-item" href="/FrontEnd/Receipt/List/<sec:authentication property="principal.id"></sec:authentication>">receipt</a>
                                    </div>
                                </li>
                            </sec:authorize>

                            <sec:authorize access="hasAnyRole('ADMIN', 'STAFF')">
                                <li class="nav-item">
                                    <a class="nav-link" href="/BackEnd/Product/List">Admin</a>
                                </li>
                            </sec:authorize>

                        </ul>
                    </div>
                    <div class="hearer_icon d-flex align-items-center">
                        <a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a>
                        <sec:authorize access="hasAnyRole('ADMIN', 'STAFF', 'MEMBER')">
                        <a href="/FrontEnd/Cart/List/<sec:authentication property="principal.id"></sec:authentication>">
                            <i class="flaticon-shopping-cart-black-shape"></i>
                        </a>
                        </sec:authorize>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <div class="search_input" id="search_input_box">
        <div class="container ">
            <form class="d-flex justify-content-between search-inner">
                <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                <button type="submit" class="btn"></button>
                <span class="ti-close" id="close_search" title="Close Search"></span>
            </form>
        </div>
    </div>
</header>
<!-- Header part end-->