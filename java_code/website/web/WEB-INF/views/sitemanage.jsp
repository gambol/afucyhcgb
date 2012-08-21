<%-- 
    Document   : sitemanage
    Created on : 2012-8-17, 22:13:50
    Author     : zhenbao.zhou
--%>

<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ page session="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Atugame站点发布</title>
        <meta name="description" content="" />
        <meta name="keywords" content="atu game" />
        <link rel="shortcut icon" type="image/png" HREF="img/favicons/favicon.png"/>
        <link rel="icon" type="image/png" HREF="img/favicons/favicon.png"/>
        <link rel="apple-touch-icon" HREF="img/favicons/apple.png" />
        <!-- Main Stylesheet --> 
        <link rel="stylesheet" href="styles/css/style.css" type="text/css" />

        <script type="text/javascript" SRC="js/swfobject.js"></script>
        <!-- jQuery with plugins -->
        <script type="text/javascript" SRC="js/jquery-1.7.2.min.js"></script>
        <script type="text/javascript" SRC="js/jquery.ui.core.min.js"></script>
        <script type="text/javascript" SRC="js/jquery.ui.widget.min.js"></script>
        <script type="text/javascript" SRC="js/jquery.ui.tabs.min.js"></script>
        <!-- jQuery tooltips -->
        <script type="text/javascript" SRC="js/jquery.tipTip.min.js"></script>
        <!-- Superfish navigation -->
        <script type="text/javascript" SRC="js/jquery.superfish.min.js"></script>
        <script type="text/javascript" SRC="js/jquery.supersubs.min.js"></script>
        <!-- jQuery popup box -->
        <script type="text/javascript" SRC="js/jquery.nyroModal.pack.js"></script>
        <!-- jQuery form validation -->
        <script type="text/javascript" SRC="js/jquery.validate.js"></script>
        <!-- Internet Explorer Fixes --> 
        <!--[if IE]>
        <link rel="stylesheet" type="text/css" media="all" href="css/ie.css"/>
        <script src="js/html5.js"></script>
        <![endif]-->
        <!--Upgrade MSIE5.5-7 to be compatible with MSIE8: http://ie7-js.googlecode.com/svn/version/2.1(beta3)/IE8.js -->
        <!--[if lt IE 8]>
        <script src="js/IE8.js"></script>
        <![endif]-->
        <script type="text/javascript" src="js/sitemanage.js"></script>
    </head>
    <body>
        <!-- Header -->
        <header id="top">
            <div class="wrapper">
                <!-- Title/Logo - can use text instead of image -->
                <div id="title"><img SRC="img/logo.png" alt="Administry" /><!--<span>Administry</span> demo--></div>
                <!-- Top navigation -->
                <div id="topnav">
                    <a href="#"><img class="avatar" SRC="img/user_32.png" alt="" /></a>
                    Logged in as <b>Admin</b>
                    <span>|</span> <a href="#">Settings</a>
                    <span>|</span> <a href="#">Logout</a><br />
                    <small>You have <a href="#" class="high"><b>1</b> new message!</a></small>
                </div>
                <!-- End of Top navigation -->
                <!-- Main navigation -->
                <nav id="menu">
                    <ul class="sf-menu">
                        <li><a HREF="dashboard.html">首页</a></li>
                        <li><a HREF="forms.html">站长发布</a></li>	
                        <li><a HREF="graphs.html">游戏介绍</a></li>	
                        <li><a HREF="graphs.html">关于我们</a></li>	
                    </ul>
                </nav>
            </div>
        </header>
        <!-- End of Header -->
        <!-- Page title -->
        <!--
            <div id="pagetitle">
                    <div class="wrapper-login"></div>
            </div>
        <!-- End of Page title -->

        <!-- Page content -->
        <div id="page">
            <!-- Wrapper -->
            <div class="wrapper">
                <section class="column width_116 first">
                    <div class="site-nav">
                        <ul>
                            <li class="current"><a href="/sitemanage.htm">发布记录</a></li>
                            <li><a href="/publish.htm">新站发布</a></li>
                            <li><a href="#">修改密码</a></li>

                        </ul>
                    </div>  
                </section>
                <!-- Login form -->

                <section class="width5">					
                    <div class="pageline">   
                    </div>

                    <pg:pager items="${serverInfos.totalCount}" maxPageItems="20" maxIndexPages="10" 
                              url="/sitemanage.htm"   export="pageNo=pageNumber" scope="request">
                        <table class="stylized full">

                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>站点</th>
                                    <th>站点地址</th>
                                    <th>操作</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${serverInfos.currentSize == 0}">
                                    <td colspan="4">
                                        <div class="nodata">你还没有发布站点</div>
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="serverInfo" items="${serverInfos.pageList }">
                                        <tr>
                                            <td>${serverInfo.id}</td>
                                            <td><c:out value="${serverInfo.name}" escapeXml="true" /></td>
                                            <td><a href="${serverInfo.url}" target="_blank"> ${serverInfo.url} </a></td>
                                            <td><a href="/publish.htm?id=${serverInfo.id}" /> 编辑 </a> &nbsp;&nbsp;
                                                <c:choose>
                                                    <c:when test="${serverInfo.status == 'online'}">
                                                        <a href="#" aurl="/sitemanage/changeStatus.htm?id=${serverInfo.id}" class="changeStatus"> 隐藏 </a>
                                                    </c:when>
                                                    <c:when test="${serverInfo.status == 'hidden'}">
                                                        <a href="#" aurl="/sitemanage/changeStatus.htm?id=${serverInfo.id}" class="changeStatus"> 显示</a>
                                                    </c:when>
                                                </c:choose>
                                            </td>

                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                        
                          <pg:index>
                            <div class="pager">
                                <pg:prev>
                                    <a class="prev" href="${pageUrl}">上一页</a>
                                </pg:prev>
                                <pg:first unless="current">
                                    <a href="${pageUrl }" class="corners">首页</a>
                                </pg:first>
                                <pg:pages>
                                    <c:choose>
                                        <c:when test="${pageNumber == pageNo }">
                                            <span class="current corners">${pageNumber }</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${pageUrl }" class="corners">${pageNumber }</a>
                                        </c:otherwise>
                                    </c:choose>
                                </pg:pages>
                                <pg:last unless="current">
                                    <a href="${pageUrl }"  class="corners">尾页</a>
                                </pg:last>
                                <pg:next>
                                    <a class="next" href="${pageUrl}">下一页</a>
                                </pg:next>
                            </div>
                        </pg:index>
                    </pg:pager>



                </section>
                <!-- End of login form -->

            </div>
            <!-- End of Wrapper -->
        </div>
        <!-- End of Page content -->

        <!-- Page footer -->
        <footer id="bottom">
            <div class="wrapper">

                <p>Copyright &copy; 2010 <b><a HREF="http://www.atugame.com" title="www.atugame.com">www.atugame.com</a></b></p>
            </div>
        </footer>
        <!-- End of Page footer -->

        <!-- Animated footer -->
        <footer id="animated">
            <ul>
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Content</a></li>
                <li><a href="#">Reports</a></li>
                <li><a href="#">Users</a></li>
                <li><a href="#">Media</a></li>
                <li><a href="#">Events</a></li>
                <li><a href="#">Newsletter</a></li>
                <li><a href="#">Settings</a></li>
            </ul>
        </footer>
        <!-- End of Animated footer -->

        <!-- Scroll to top link -->
        <a href="#" id="totop">^ scroll to top</a>

        <!-- User interface javascript load -->
    </body>
</html>

