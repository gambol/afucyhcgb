<%-- 
    Document   : nain
    Created on : Jul 16, 2012, 7:08:42 PM
    Author     : xiang.fu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html class="js" lang="en"><!--<![endif]--><head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="chrome=1">

        <link href="images/favicons/graphicriver.ico" rel="shortcut icon">
        <title>TopHey </title>



        <script type="text/javascript" src="styles/js/jquery-1.7.2.min.js"></script>
        <script type="text/javascript" src="styles/js/tophey.js"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="styles/css/tophey.css">
        <link rel="stylesheet" type="text/css" media="screen" href="styles/css/widget.css">
   

    </head>

    <body id="homepage" class="">
        <header>
            <div class="container">

                <div id="logo">
                    <a href="#" class="marketplace"><img alt="TopHey" src="images/logo1.png" title="TopHey"></a>
                </div>

                <div class="account-wrapper">
                    <ul id="user-account-nav">
                        <li><a href="#"><span>Create Account</span></a></li>
                        <li>
                            <a href="#">Sign In</a>
                        </li>
                    </ul>
                </div>


            </div> <!-- end .container -->
        </header> <!-- end role main header -->

        
        <input id="curStart" type="hidden" value="0"/>
        <input id="size" type="hidden" value="50"/>
        <input id="totalCount" type="hidden" value="0"/>
        
        <nav role="navigation" class="clearfix">
            <ul class="main-nav">
                <li>
                    <a href="#" onclick="changeCategory('1');return false;">传奇私服</a>
                </li>
                <li>
                    <a href="#" onclick="changeCategory('2');return false;">魔兽世界</a>
<!--                    <div class="dropdown">               
                        <ul>
                            <li><a href="/category/print-templates/business-cards">Business Cards</a></li>
                            <li><a href="/category/print-templates/stationery">Stationery</a></li>                            
                        </ul>

                    </div>-->
                </li>
            </ul>
        </nav>




        <div id="content">
            <div class="container">
                <!--
                                <div id="home-panel" class="guest shadowed">
                                    <div class="inner-boundary">
                                        <div class="inner-border">
                
                                        </div>
                                    </div>
                                </div>-->

                <div id="rank-title" class="shadowed guest">
                    <div id="rank-title-header"></div>
                    <div id="rank-title-name">魔兽世界私服排名</div>

                    <div class ="rank-title-sep"></div>
                    <div id="rank-title-page" >
                        <ul>
                            <li>
                                <div class="rank-page">1-50 名</div> 
                                <div class="rank-page-dropdown">               
<!--                                    <ul>
                                        <li><a href="#" onclick="getRank('1',0,50);return false;">1-50名</a></li>
                                        <li><a href="/category/print-templates/stationery">51-100名</a></li>                            
                                        <li><a href="/category/print-templates/stationery">101-150名</a></li>                            
                                        <li><a href="/category/print-templates/stationery">151-200名</a></li>                            
                                        <li><a href="/category/print-templates/stationery">201-250名</a></li>                            
                                        <li><a href="/category/print-templates/stationery">251-300名</a></li>                            
                                        <li><a href="/category/print-templates/stationery">351-400名</a></li>                            
                                    </ul>-->

                                </div>
                            </li>
                        </ul>

                    </div>
                    <!--                    <div class ="rank-title-sep1"></div>-->

                </div>



                <div id="right-side-bar" class=" shadowed">
                    <div class="inner-boundary">
                        <div class="inner-border">

                            <div class="thumbnail itemcontainer">
                                <a href="#" onclick="">
                                    <img src="images/80x80game.jpg" alt="GAME STYLES V2 - GraphicRiver Item for Sale" title="GAME STYLES V2" class="square-image-magnifier preload no_preview" data-preview-width="" data-preview-height="" data-item-name="GAME STYLES V2" data-item-author="INDUSTRYKIDZ" data-item-category="Add-ons / Photoshop / Styles" data-item-cost="4" data-preview-url="http://0.s3.envato.com/files/3422603/GAMEPREVIEW2.jpg" border="0" height="80" width="80">
                                </a>            </div>
                            <a href="#"><h3 class="decorator">Free File!</h3></a>
                            <p>
                                Grab this month's <a href="#">free file</a> from the Text Effects category!
                            </p>

                        </div>
                    </div>
                </div>




                <div id="waitting-bar" class="shadowed">
                    <div class="inner-boundary">
                        <div class="inner-border">
                            <img src="images/waiting.gif" />
                        </div>
                    </div>
                </div>

                <div id="rank-content-all">
                    <div id="rank-content" class=" shadowed">
                        <div class="inner-boundary">
                            <div class="inner-border ">
                                <div class="rank-no-wrapper"><div class="rank-no">1</div></div>

                                <div class="rank-content-wrapper">
                                    <a href="http://www.baidu.com" target="_blank">
                                        <div class="rank-content-title">Neverendless WoW</div>                                    
                                        <img alt="Undamed WoW 3.3.5a and 4.0.6-4.3.4" src="images/site_0000032443_ad0247c0.png">
                                    </a>

                                    <div class ="rank-content-desc">
                                        这个魔兽世界私服不收费的，非常公平，在线人数有10万人，大家快去玩吧，哈哈哈哈乌拉拉啦啦啦
                                    </div>

                                </div>
                                <div class="rank-score">
                                    <div class="score-desc">
                                        在线人数：100000<br/>论坛新帖：1020<br/>
                                        <div class="score-desc-more">
                                            <a href="http://www.baidu.com" target="_blank">[详情...]</a>
                                        </div>                                                                        
                                    </div>


                                    <div class="sep"></div>
                                    <div class="score-wrapper">
                                        <span class="score-label">综合评分：</span><span class="score">9.1</span>
                                    </div>
                                </div>



                            </div>
                        </div>
                    </div>
                    <div style="height: 20px"> </div>
                    <div id="rank-content" class=" shadowed">
                        <div class="inner-boundary">
                            <div class="inner-border">
                            </div>
                        </div>
                    </div>

                </div>
            </div>




            <div class="clear">  </div>

        </div>
    </div>


    <div id="copyright">
        <div class="container">
            <a class="logo" href="#">TOPHEY</a>
            <div class="copyright">
                <p>
                    <span>COPYRIGHT © 2012 <a href="#">TOPHEY</a></span>|
                    <span><a href="#">TERMS OF USAGE</a></span>|
                    <span><a href="#">SUPPORT/HELP</a></span>|
                    <span>ICONS BY <a href="#">TOPHEY</a></span>
                </p>
                <p class="trademarks">全国第一游戏私服排名</p>
            </div>
        </div>
    </div>

    <script>changeCategory('1');</script>
    
</html>
