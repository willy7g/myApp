<%-- 
    Document   : menu
    Created on : 24-abr-2021, 19:25:41
    Author     : Willy_Pc32
--%>

 <div class="main-menu">
                    <div class="menu-inner">
                        <nav>
                            <ul class="metismenu" id="menu">
                                <li class="active"><a href="<%out.print(getServletContext().getContextPath());%>/index.jsp"><i class="fa fa-home"></i> <span>Inicio</span></a></li>
                                <li>
                                    <a href="javascript:void(0)"><i class="fa fa-tag"></i><span>Mantenimientos</span></a>
                                    <ul class="collapse">
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/jsp_app/mantenimiento/categoria.jsp"><i class="fa fa-cubes"></i> Categorias</a></li>
                                        <li><a href=""><i class="fa fa-archive"></i> Productos</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>