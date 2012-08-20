<%-- 
    Document   : mainPage
    Created on : Aug 13, 2012, 10:31:24 PM
    Author     : xiang.fu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<script type="text/javascript" SRC="js/jquery-1.4.2.min.js"></script>
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
$(document).ready(function(){
	
	/* setup navigation, content boxes, etc... */
	Administry.setup();
	
	/* progress bar animations - setting initial values */
	Administry.progress("#progress1", 1, 6);
	
	// validate form on keyup and submit
	var validator = $("#sampleform").validate({
		rules: {
			firstname: "required",
			lastname: "required",
			username: {
				required: true,
				minlength: 2
			},
			password: {
				required: true,
				minlength: 5
			},
			password_confirm: {
				required: true,
				minlength: 5,
				equalTo: "#password"
			},
			email: {
				required: true,
				email: true
			},
			dateformat: "required",
			terms: "required"
		},
		messages: {
			firstname: "Enter your firstname",
			lastname: "Enter your lastname",
			username: {
				required: "Enter a username",
				minlength: jQuery.format("Enter at least {0} characters")
			},
			password: {
				required: "Provide a password",
				rangelength: jQuery.format("Enter at least {0} characters")
			},
			password_confirm: {
				required: "Repeat your password",
				minlength: jQuery.format("Enter at least {0} characters"),
				equalTo: "Enter the same password as above"
			},
			email: {
				required: "Please enter a valid email address",
				minlength: "Please enter a valid email address"
			},
			dateformat: "Choose your preferred dateformat",
			terms: " "
		},
		// the errorPlacement has to take the layout into account
		errorPlacement: function(error, element) {
			error.insertAfter(element.parent().find('label:first'));
		},
		// specifying a submitHandler prevents the default submit, good for the demo
		submitHandler: function() {
			alert("Data submitted!");
		},
		// set new class to error-labels to indicate valid fields
		success: function(label) {
			// set &nbsp; as text for IE
			label.html("&nbsp;").addClass("ok");
		}
	});
	
	// propose username by combining first- and lastname
	$("#username").focus(function() {
		var firstname = $("#firstname").val();
		var lastname = $("#lastname").val();
		if(firstname && lastname && !this.value) {
			this.value = firstname + "." + lastname;
		}
	});

});
</script>
</head>
<body>
	<!-- Header -->
	<header id="top">
		<div class="wrapper">
			<!-- Title/Logo - can use text instead of image -->
			<div id="title"><img SRC="img/logo1.png" alt="阿土游戏" /><!--<span>Administry</span> demo--></div>
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
	
	<!-- Page content -->
	<div id="page">
		<!-- Wrapper -->
		<div class="wrapper">
				<!-- Left column/section -->
                <section class="column width1 first">
                  <div id="left-nav">
                    <ul>
                    <li><a href="/rank/rankPage.htm">魔兽世界</a></li>
                    <li><a href="">哈哈哈</a></li>
                    <li><a href="">传奇</a></li>
                    <li><a href="">DOTA</a></li>
                    <li><a href="">星际争霸2</a></li>
                    </ul>
                  </div>  
                </section>
				<section class="width5">					
                  <div class="pageline">
			        <form action="" method="get"><input class="" type="text" id="q" name="q" /></form>
                  </div>
                                    
                                    

                  <c:forEach var="item" items="${pageResult.pageList}">                  
                      <div>${item.serverInfo.name}</div>
                  </c:foreach>
                                    
                  <!-- a server begins -->
                  <div class="box colgroup middle-div">
                    <div class="rank-column column first">1</div>
                    <div class="desc-column column width4">
                      <div class="font-16">
                        <span class="server-title first"><a href="#">传奇私服</a></span>
                        <span class="right-span">双线</span>
                      </div>
                      <div>
                        赌博系统，所向无敌。你好，我是周桢堡.的权利。当地公安部门已经锁定照片上传地点：上海市，上传人还未抓到。庐江县委书记王民生表示，近期庐江县正在处理一
                      </div>
                    </div>
                    <div class="like-it-column column">
                      <span class="number">239</span>
                      <span id="like-it">赞!</span>
                    </div>
                  </div>
                  <div class="clearfix"></div>
                  <!-- a server ends -->

                

                  <hr>
                  <div class="colgroup leading">
                    <div class="width3 column">
                      <p class="pagination ta-right">
                        <a href="#">«</a>
                        <a href="#" class="pagination-active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        ...
                        <a href="#">12</a>
                        <a href="#">13</a>
                        <a href="#">14</a>
                        <a href="#">»</a>
                      </p>
                    </div>
                  </div>
				
				</section>
				<!-- End of Left column/section -->
				
				<!-- Right column/section -->
				<aside class="column width2">
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
