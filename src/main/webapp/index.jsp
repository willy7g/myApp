<%-- 
    Document   : index
    Created on : 24-abr-2021, 15:44:46
    Author     : Willy_Pc32
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="es">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>My App</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="<%out.print(getServletContext().getContextPath());%>/resources_app/favicon.png">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/themify-icons.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/metisMenu.css">
        <!-- others css -->
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/typography.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/default-css.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/styles.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/responsive.css">
        <!-- modernizr css -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>

    <body>
        <!--[if lt IE 8]>
                <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
            <![endif]-->
        <!-- preloader area start -->
        <div id="preloader">
            <div class="loader"></div>
        </div>
        <!-- preloader area end -->
        <!-- page container area start -->
        <div class="page-container">
            <!-- sidebar menu area start -->
            <div class="sidebar-menu">
                <div class="sidebar-header">
                    <div class="logo">
                        <a href="index.html"><img src="./assets/images/icon/logo.png" alt="logo"></a>
                    </div>
                    <br>
                    <h6 class="text-center" style="color: aliceblue"><i class="fa fa-user"></i> <strong>JCode</strong></h6>
                </div>
                <div class="main-menu">
                    <div class="menu-inner">
                        <nav>
                            <ul class="metismenu" id="menu">
                                <li class="active"><a href="index.html"><i class="fa fa-home"></i> <span>Inicio</span></a></li>
                                <li>
                                    <a href="javascript:void(0)"><i class="fa fa-tag"></i><span>Mantenimientos</span></a>
                                    <ul class="collapse">
                                        <li><a href=""><i class="fa fa-cubes"></i> Categorias</a></li>
                                        <li><a href=""><i class="fa fa-archive"></i> Productos</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- sidebar menu area end -->
            <!-- main content area start -->
            <div class="main-content">
                <!-- header area start -->
                <div class="header-area">
                    <div class="row align-items-center">
                        <!-- nav and search button -->
                        <div class="col-4 clearfix">
                            <div class="nav-btn pull-left" style="margin-top: 0px">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </div>
                        <!-- profile info & task notification -->
                        <div class="col-8 clearfix">
                            <ul class="notification-area pull-right">
                                <li>
                                    <a href="">
                                        Cerrar Sessión
                                        <i class="fa fa-sign-out" aria-hidden="true"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- header area end AQUI VA TODA PRA QUE SE MEUSTRE EN EL CENTRO -->
                <div class="main-content-inner" style="padding-top: 30px">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">CATEGORIAS</h5>
                                    <input type="hidden" id="nameFormCategoria" value="FrmCategoria">
                                    <input type="hidden" id="actionCategoria" name="action" value="paginarCategoria">
                                    <input type="hidden" id="numberPageCategoria" name="numberPageCategoria" value="1">
                                    <form id="FrmCategoria">
                                        <div class="row mt-3">
                                            <div class="form-group col-md-9 col-12">
                                                <input type="text" name="txtNombreCategoria" id="txtNombreCategoria" class="form-control form-control-sm" placeholder="NOMBRE">
                                            </div>
                                            <div class="form-group col-md-3 col-12">
                                                <button type="submit" id="btnBuscarCategoria" class="btn btn-primary btn-xs mr-3" data-toggle="tooltip" title="Buscar Categoria"><i class="fa fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                <button type="button" id="btnAbrirNCategoria" class="btn btn-primary btn-xs" data-toggle="tooltip" title="Agregar Categoria"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="table-responsive">
                                                <table class="table table-hover table-bordered">
                                                    <thead class="bg-primary">
                                                        <tr class="text-white">
                                                            <th>NOMBRE</th>
                                                            <th style="width: 15%" colspan="2" class="text-medium-table">ACCIONES</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tbodyCategoria">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="card"
                                                 style="height: 50px; margin-bottom: 0px">
                                                <div class="card-body" style="padding-top: 10px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px">
                                                    <div class="row">
                                                        <div class="col-md-2 col-sm-3 col-4">
                                                            <select id="sizePageCategoria" name="sizePageCategoria" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarCategoria'>
                                                                <option value="10">10</option>
                                                                <option value="15">15</option>
                                                                <option value="20">20</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-10 col-sm-9 col-8">
                                                            <nav aria-label="Page navigation example">
                                                                <ul id="paginationCategoria" class="pagination pagination-sm justify-content-end">

                                                                </ul>
                                                            </nav>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- main content area end -->
            <!-- footer area start-->
            <footer>
                <div class="footer-area">
                    <p>© Copyright 2018 <a href="https://colorlib.com/wp/">Wdev</a>.</p>
                </div>
            </footer>
            <!-- footer area end-->
        </div>
        <!-- page container area end -->
        <!-- jquery latest version -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/vendor/jquery-2.2.4.min.js"></script>
        <!-- bootstrap 4 js -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/popper.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/bootstrap.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/metisMenu.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery.slimscroll.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery.slicknav.min.js"></script>

            <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/scripts.js"></script
        </body>

                </html>