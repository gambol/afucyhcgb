<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    function selectMenu(menuId) {
        $('#' + menuId).addClass("current");
    }
</script>
<!-- Header -->
<header id="top">
    <div class="wrapper">
        <!-- Title/Logo - can use text instead of image -->
        <div id="title"><img SRC="/img/logo.png" alt="Atugame" /></div>
        <!-- Top navigation -->
        <%
            String user = (String) request.getSession().getAttribute("username");
            pageContext.setAttribute("username", user);
        %>
        <div id="topnav">
            <c:choose>
                <c:when test="${not empty username}">
                    <a href="#"><img class="avatar" SRC="img/user_32.png" alt="" /></a>
                    Hi <b><c:out value="${username}"/></b>
                    
                    <span>|</span> <a href="#">Settings</a>
                    <span>|</span> <a href="#">Logout</a><br />
                </c:when>
                <c:otherwise>
                    <a href="login.htm"> 登录 </a>
                </c:otherwise>
            </c:choose>
        </div>
        <!-- End of Top navigation -->
        <!-- Main navigation -->
        <nav id="menu">
            <ul class="sf-menu">
                <li id="menu-mainPage"><a HREF="mainPage.htm">首页</a></li>
                <c:if test="${not empty username}">
                    <li id="menu-userCenter"><a HREF="sitemanage.htm">个人中心</a></li>
                </c:if>
                <li id="menu-aboutUS"><a HREF="#">关于我们</a></li>                

            </ul>
        </nav>
    </div>
</header>