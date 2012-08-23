<!--<!DOCTYPE html>-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@page  language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Atugame登录</title>
        <meta name="description" content="" />
        <meta name="keywords" content="atu game" />
        <link rel="shortcut icon" type="image/png" HREF="/img/favicons/favicon.png"/>
        <link rel="icon" type="image/png" HREF="/img/favicons/favicon.png"/>
        <link rel="apple-touch-icon" HREF="/img/favicons/apple.png" />
        <!-- Main Stylesheet --> 
        <link rel="stylesheet" href="/styles/css/style.css" type="text/css" />

        <script type="text/javascript" SRC="/js/swfobject.js"></script>
        <!-- jQuery with plugins -->
        <script type="text/javascript" SRC="/js/jquery-1.7.2.min.js"></script>
        <script type="text/javascript" SRC="/js/jquery.ui.core.min.js"></script>
        <script type="text/javascript" SRC="/js/jquery.ui.widget.min.js"></script>
        <script type="text/javascript" SRC="/js/jquery.ui.tabs.min.js"></script>
        <!-- jQuery tooltips -->
        <script type="text/javascript" SRC="/js/jquery.tipTip.min.js"></script>
        <!-- Superfish navigation -->
        <script type="text/javascript" SRC="/js/jquery.superfish.min.js"></script>
        <script type="text/javascript" SRC="/js/jquery.supersubs.min.js"></script>
        <!-- jQuery popup box -->
        <script type="text/javascript" SRC="/js/jquery.nyroModal.pack.js"></script>
        <!-- jQuery form validation -->
        <script type="text/javascript" SRC="/js/jquery.validate.js"></script>
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
                var submitted = false;
                // validate form on keyup and submit
                var validator = $("#loginForm").validate({
                    rules: {
                        userEmail: {
                            required: true,
                            email: true
//                            remote: "/user/check.htm"
                        },
                        password:{
                            required:true
                         
                        },
                        captcha: {
                            required: true,
                            remote:"/validateImage.htm"
                        },
                        terms: "required"
                    },
                    messages: {
                        userEmail: {
                            required: "请输入用户名",
                            email:"用户名必须是有效邮箱"
//                            remote: "用户名已存在"
                        },
                        password:{
                            required:"密码不能为空" 
                        },
                        captcha: {
                            required:"请输入验证码",
                            remote:"验证码错误"
                        },
                        terms: ""
                    },
                    showErrors: function(errorMap, errorList) {  
                        $.each(errorMap, function(name, value) {
                            $("#" + name + "ErrLb").hide();
                            $("#" + name + "ErrImg").show();
//                            $("#" + name + "ErrLb").show();
//                            $("#" + name + "ErrLb").html(value);                       
                        });
                                this.defaultShowErrors();
                    },

                    
                    // the errorPlacement has to take the layout into account
                    errorPlacement: function(error, element) {
                        error.insertAfter($("#"+element.attr("name")+"ErrImg"));
                    },
                    
                    // specifying a submitHandler prevents the default submit, good for the demo
                    /*
                    submitHandler: function() {
                        alert("Data submitted!");
                    },
                     */
                    // set new class to error-labels to indicate valid fields
                    success: function(label) {
                        $("#" + label.attr("for") + "ErrImg").hide();
                    }
                });
            });
            
            function refreshImage(){    
        
                $('#captchaImg').hide().attr('src',"/generateImage.htm?" + Math.floor(Math.random()*100)).fadeIn();     
            }    
        </script>
              <style>
                    
                    
                    label.error {
                      vertical-align: middle;                        
                    }</style>

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

                <section class="width5">					
                    <div class="pageline">   
                    </div>
                    <div class="box box-info">登录</div>
                    <form:form id="loginForm" method="post" modelAttribute="loginBean" cssClass="cleanform">

                        <p>
                            <form:label cssClass="required" path="userEmail">邮箱：</form:label><br/>
                            <!--                            <div style="width: 280px;float: right">-->
                            <form:input type="text" path="userEmail" cssClass="half " value=""/>


                            <c:choose>
                                <c:when test="${not empty mailErrMsg}">
                                    <img id="userEmailErrImg" src="/img/alert.png" style="vertical-align: middle"/>
                                    <label id="userEmailErrLb" style="vertical-align: middle;color:#DD0000">${mailErrMsg}</label>
                                </c:when>
                                <c:when test="${empty mailErrMsg}">
                                    <img id="userEmailErrImg" src="/img/alert.png" style="vertical-align: middle;display: none" />
                                    <label id="userEmailErrLb" style="vertical-align: middle;display: none;color:#DD0000">${mailErrMsg}</label>
                                </c:when>
                            </c:choose>


                            <!--                            %>-->

                        </p>


                        <p>
                            <form:label cssClass="required" path="password">密码:</form:label><br/>
                            <form:input type="password" path="password" cssClass="half" value=""/>    
                            <img id="passwordErrImg" src="/img/alert.png" style="vertical-align: middle;display: none" />
                            <label id="passwordErrLb" style="vertical-align: middle;display: none">${errMsg}</label>
                        </p>



                        <p> 
                            <label class="required" for="captcha">验证码:</label><br/>

                            <input type="text" name="captcha" id="captcha"  style="vertical-align: middle;width: 27%"/>                            
                            <img id='captchaImg' alt="验证码" src="/generateImage.htm" style="height: 25px;vertical-align: middle"/> 
                            <span  style="vertical-align: bottom"><a href="javascript:void(0)" onclick="refreshImage()">看不清?换一张</a></span>
                            <img id="captchaErrImg" src="/img/alert.png" style="vertical-align: middle;display: none" />
                            

                        </p>
                        <br/>


                        <div >
                            <input type="submit" class="btn btn-yellow big" value="    登   录   "/>
                            <input type="submit" class="btn btn-yellow big" value="    找回密码   "/>
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
