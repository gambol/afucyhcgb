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
        <div id="topnav">
            <a href="#"><img class="avatar" SRC="/img/user_32.png" alt="" /></a>
            Logged in as <b>Admin</b>
            <span>|</span> <a href="#">Settings</a>
            <span>|</span> <a href="#">Logout</a><br />
            <small>You have <a href="#" class="high"><b>1</b> new message!</a></small>
        </div>
        <!-- End of Top navigation -->
        <!-- Main navigation -->
        <nav id="menu">
            <ul class="sf-menu">
                <li id="menu-mainPage"><a HREF="/mainPage.htm">首页</a></li>
                <li id="menu-userCenter"><a HREF="/publish.htm">个人中心</a></li>	
                <li id="menu-aboutUS"><a HREF="/graphs.html">关于我们</a></li>                
            </ul>
        </nav>
    </div>
</header>