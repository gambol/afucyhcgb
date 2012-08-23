<%-- 
    Document   : mainPage
    Created on : Aug 13, 2012, 10:31:24 PM
    Author     : xiang.fu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>AtuGame</title>
        <meta name="description" content="Administry - Admin Template by www.865171.cn" />
        <meta name="keywords" content="Admin,Template" />
        <!-- Favicons --> 
        <link rel="shortcut icon" type="image/png" HREF="img/favicons/small-logo.png"/>
        <link rel="icon" type="image/png" HREF="img/favicons/small-logo.png"/>

        <!-- Main Stylesheet --> 
        <link rel="stylesheet" href="styles/css/style.css" type="text/css" />
        <!--<link rel="stylesheet" href="styles/css/brown.css" type="text/css"/> -->
        <!-- Colour Schemes
        Default colour scheme is blue. Uncomment prefered stylesheet to use it.
        <link rel="stylesheet" href="css/brown.css" type="text/css" media="screen" />  
        <link rel="stylesheet" href="css/gray.css" type="text/css" media="screen" />  
        <link rel="stylesheet" href="css/green.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/pink.css" type="text/css" media="screen" />  
        <link rel="stylesheet" href="css/red.css" type="text/css" media="screen" />
        -->
        <!-- Your Custom Stylesheet --> 
        <link rel="stylesheet" href="styles/css/custom.css" type="text/css" />
        <!--swfobject - needed only if you require <video> tag support for older browsers -->
        <script type="text/javascript" SRC="js/swfobject.js"></script>
        <!-- jQuery with plugins -->
        <script type="text/javascript" SRC="js/jquery-1.7.2.min.js"></script>
        <!-- Could be loaded remotely from Google CDN : <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script> -->
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
        <script type="text/javascript" SRC="js/jquery.validate_pack.js"></script>
        <!-- Internet Explorer Fixes --> 
        <!--[if IE]>
        <link rel="stylesheet" type="text/css" media="all" href="css/ie.css"/>
        <script src="js/html5.js"></script>
        <![endif]-->
        <!--Upgrade MSIE5.5-7 to be compatible with MSIE8: http://ie7-js.googlecode.com/svn/version/2.1(beta3)/IE8.js -->
        <!--[if lt IE 8]>
        <script src="js/IE8.js"></script>
        <![endif]-->
        <script type="text/javascript">

        </script>
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
                        <li><a HREF="mainPage.htm">首页</a></li>
                        <li class="current"><a HREF="forms.html">站长发布</a></li>	
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
                    <div class="wrapper">
                            <h1>Form examples</h1>
        <!-- Quick search box -->
        <!--
                    <form action="" method="get"><input class="" type="text" id="q" name="q" /></form>
            </div>
    </div>
        -->
        <!-- End of Page title -->
        <c:set var="categoryId" value="${param.categoryId}"/>   
        <!-- Page content -->
        <div id="page">
            <!-- Wrapper -->
            <div class="wrapper">
                <!-- Left column/section -->
                <section class="column width1 first">
                    <div id="left-nav">
                        <ul>
                            <c:forEach var="category" items="${categorys.pageList }">
                                <li><a href="/mainPage.htm?categoryId=${category.id}" <c:if test="${categoryId == category.id}"> class="current"</c:if>>${category.name}</a></li>
                            </c:forEach>

                        </ul>
                    </div>  
                </section>
                <section class="width5">					
                    <div class="pageline">
                        <form action="" method="get"><input class="" type="text" id="q" name="q" /></form>
                    </div>
                    <pg:pager items="${serverInfos.totalCount}" maxPageItems="10" maxIndexPages="7" 
                              url="/mainPage.htm"   export="pageNo=pageNumber" scope="request">
                        <pg:param name="categoryId" />
                        <c:forEach var="serverInfoDetail" items="${serverInfos.pageList}" varStatus="status">
                            <div class="box colgroup middle-div">
                                <div class="rank-column column first">${status.count + param['pager.offset']}</div>
                                <div class="desc-column column width4">
                                    <div class="font-14">
                                        <span class="server-title first"><a href="#">${serverInfoDetail.serverInfo.name}</a></span>
                                        <span class="right-span">${serverInfoDetail.serverInfo.line}</span>
                                    </div>
                                    <div class="desc"">
                                        <c:out value="${fn:substring(serverInfoDetail.serverInfo.description, 0, 100)}" escapeXml="true"/>
                                    </div>
                                </div>
                                <div class="like-it-column column">
                                    <span class="number">239</span>
                                    <span id="like-it">赞!</span>
                                </div>
                            </div>
                            <div class="clearfix"></div>

                        </c:forEach>
                            
                            
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
                <!-- End of Left column/section -->

                <!-- Right column/section -->
                <aside class="colgroup width2"  id="asider">
                    <div class="content-box">
                        <header class="blue">
                            <h3>公告区</h3>
                        </header>
                        <section>
                            哈哈，你好，我是第一个页面。我是不是很无聊啊。
                            <dl>
                                <dt>
                                第一条新闻
                                </dt>
                                <dd>
                                    新闻简介
                                </dd>

                                <dt>
                                第二条新闻
                                </dt>
                                <dd>
                                    新闻简介
                                </dd>
                            </dl>
                            <cite>w3schools.com</cite>										</section>
                    </div>
                    <div class="content-box">
                        <header class="blue">
                            <h3>SEO相关</h3>
                        </header>
                    </div>
                </aside>
                <!-- End of Right column/section -->

                <!-- End of Wrapper -->
            </div>
            <!-- End of Page content -->

            <!-- Page footer -->
            <footer id="bottom">
                <div class="wrapper">
                    <nav>
                        <a href="#">Dashboard</a> &middot;
                        <a href="#">Content</a> &middot;
                        <a href="#">Reports</a> &middot;
                        <a href="#">Users</a> &middot;
                        <a href="#">Media</a> &middot;
                        <a href="#">Events</a> &middot;
                        <a href="#">Newsletter</a> &middot;
                        <a href="#">Settings</a>
                    </nav>
                    <p>Copyright &copy; 2010 <b><a HREF="http://www.865171.cn" title="www.865171.cn">www.865171.cn</a></b> | Icons by <a HREF="http://www.865171.cn">865171.cn</a></p>
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
            <script type="text/javascript" SRC="js/administry.js"></script>
    </body>
</html>
