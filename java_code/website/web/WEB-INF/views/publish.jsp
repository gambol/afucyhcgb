<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
        <script type="text/javascript">
            $(document).ready(function(){
                // validate form on keyup and submit
                var validator = $("#publishform").validate({
                    rules: {
                        server_name: {
                            required: true,
                            minlength: 2,
                            maxlength: 40
                        },
                        url: {
                            required: true,
                            minlength: 5,
                            url: true
                        },
                        desc: {
                            required: true,
                            minlength: 5,
                            maxlength: 2000
                        },
                        terms: "required"
                    },
                    messages: {
                        server_name: {
                            required: "输入站点名称",
                            minlength: jQuery.format("至少需要{0} 个字符")
                        },
                        url: {
                            required: "输入站点url",
                            minlength: jQuery.format("至少需要 {0} 个字符"),
                            url: "请输入合法的网址"
                        },
                        desc: {
                            required: "输入描述",
                            minlength: jQuery.format("至少需要{0} 个字符"),
                            maxlength: jQuery.format("长度不超过{0}个字符")
                        },
                        terms: ""
                    },
                    // the errorPlacement has to take the layout into account
                    errorPlacement: function(error, element) {
                        error.insertAfter(element.parent().find('label:first'));
                    },
                    // specifying a submitHandler prevents the default submit, good for the demo
                    /*
                    submitHandler: function() {
                        alert("Data submitted!");
                    },
                     */
                    // set new class to error-labels to indicate valid fields
                    success: function(label) {
                        // set &nbsp; as text for IE
                        //     label.html("&nbsp;").addClass("ok");
                    }
                });
            });
            
            function refreshImage(){    
        
                $('#captchaImg').hide().attr('src',"generateImage.htm?" + Math.floor(Math.random()*100)).fadeIn();     
            }    
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
                <!-- Login form -->
                <section class="column width6 first">					

                    <h3>站点发布</h3>
                    <div class="box box-info">带*项目必填</div>
                    <form:form id="publishform" method="post" modelAttribute="publishBean" cssClass="cleanform">
                        <p>
                            <c:if test="${not empty message}">
                            <div id="message" class="success">${message}</div>	
                        </c:if>
                        <s:bind path="*">
                            <c:if test="${status.error}">
                                <div id="message" class="box-error">请正确输入</div>
                            </c:if>
                        </s:bind>
                        </p>
                        <p>
                            <form:label cssClass="required" path="server_name">站点名称:</form:label><br/>
                            <form:input type="text" path="server_name" cssClass="half" value=""/>
                        </p>

                        <p>
                            <form:label cssClass="required" path="url">链接:</form:label><br/>
                            <form:input type="text" path="url" cssClass="half" value=""/>      
                        </p>

                        <p>
                            <form:label cssClass="required" path="banner">图片:</form:label><br/>
                            <form:input type="file" path="banner" cssClass="half" value=""/>   
                        </p>

                        <p>
                            <form:label cssClass="required" path="network">网络:</form:label><br/>
                            <form:radiobutton path="network" value="0" label="网通 "/>
                            <form:radiobutton path="network" value="1" label="电信 "/>
                            <form:radiobutton path="network" value="2" label="双线 "/>
                            <form:radiobutton path="network" value="3" label="铁通 "/>
                            <form:radiobutton path="network" value="4" label="联通 "/>
                        </p>


                        <p>
                            <form:label cssClass="required" path="category">游戏种类:</form:label>
                            <br>
                            <form:select path="category" cssClass="half">
                                <form:option value="1" label="传奇"/>
                                <form:option value="2" label="魔兽世界"/>
                            </form:select>
                        </p>
                        <p>
                            <form:label cssClass="required" path="desc">描述:</form:label><br/>
                            <form:textarea path="desc" class="medium half"/>
                        </p>

                        <p> <img id='captchaImg' alt="验证码" src="generateImage.htm"> <a href="javascript:void(0)" onclick="refreshImage()">看不清楚?</a>   </p>

                        <br/>
                        <div class="contract">
                            <p>
								　　新浪体育讯　北京时间8月12日，中国代表团伦敦奥运会总结大会在奥运主新闻中心新闻发布厅举行，中国代表团团长刘鹏、副团长段世杰、杨树安、肖天、蔡振华，秘书长蔡家东，以及主持人张海峰出席了本次中国奥运代表团发布会。
                            </p>
                            <p>
							　　	此次伦敦奥运会上中国军团的运动员们取得了非常出色的成绩，年轻的游泳运动员叶诗文(微博)43万更是取得了用两枚金牌，而赛后曾有很多外国媒体却一直纠缠于兴奋剂的问题上，对于这个事件现场有记者对中国代表团团长刘鹏进行了提问，他是如何看待国外媒体质疑总过游泳运动员兴奋剂问题的。
                            </p>
                            <p>
								　　新浪体育讯　北京时间8月12日，中国代表团伦敦奥运会总结大会在奥运主新闻中心新闻发布厅举行，中国代表团团长刘鹏、副团长段世杰、杨树安、肖天、蔡振华，秘书长蔡家东，以及主持人张海峰出席了本次中国奥运代表团发布会。
                            </p>
                            <p>
							　　	此次伦敦奥运会上中国军团的运动员们取得了非常出色的成绩，年轻的游泳运动员叶诗文(微博)43万更是取得了用两枚金牌，而赛后曾有很多外国媒体却一直纠缠于兴奋剂的问题上，对于这个事件现场有记者对中国代表团团长刘鹏进行了提问，他是如何看待国外媒体质疑总过游泳运动员兴奋剂问题的。
                            </p>
                        </div>
                        <input type="checkbox" id="terms" class="" value="1" name="terms" checked/>
                        <label class="choice" for="terms">我已阅读并接受以上合同条款、补充条款及其他所有内容</label>


                        <br/>
                        <br/>

                        <div class="middle-div">
                            <input type="submit" class="btn btn-yellow big" value="    提    交    "/>
                        </div>

                        <br/>
                        <br/>

                    </form:form>

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
