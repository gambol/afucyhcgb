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

            <a href="#"><img class="avatar" SRC="img/user_32.png" alt="" /></a>
            Hi <b>bibubibu</b>

            <span>|</span> <a href="#">Settings</a>
            <span>|</span> <a href="#">Logout</a><br />
        </div>
        <!-- End of Top navigation -->
        <!-- Main navigation -->
        <nav id="menu">
            <ul class="sf-menu">
                <li id="menu-mainPage"><a HREF="mainPage.htm">首页</a></li>
                <li id="menu-userCenter"><a HREF="sitemanage.htm">个人中心</a></li>	
                <li id="menu-aboutUS"><a HREF="#">关于我们</a></li>                

            </ul>
        </nav>
    </div>
</header>