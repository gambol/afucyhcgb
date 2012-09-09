<%-- 
    Document   : detail
    Created on : 2012-9-8, 10:04:47
    Author     : zhenbao.zhou
--%>

<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <%@include file="../common/appInclude.jsp" %>
    <body>
        <%@include file="../common/header.jsp" %>
        <script>
            selectMenu("menu-mainPage");
        </script>
        <div id="page">
            <!-- Wrapper -->
            <div class="wrapper">
                <!-- Left column/section -->
                <section class="column width1 first">
                    <div id="left-nav">
                        <ul>
                            <c:forEach var="category" items="${categorys.pageList }">
                                <li><a href="/index_${category.id}.htm" <c:if test="${serverInfo.categoryId == category.id}"> class="current"</c:if>>${category.name}</a></li>
                            </c:forEach>

                        </ul>
                    </div>  
                </section>
                <section class="width5">					
                    <div class="pageline">
                        <form action="" method="get">
                            <input type="hidden" name="categoryId" value="${serverInfo.categoryId}"/>
                            <input class="search-button" type="submit" id="button" value=""  name="search"/>
                            <input class="search-text" type="text" id="keyword" name="keyword" placeholder="按标题搜索"/>
                        </form>
                    </div>
                    <div>
                       标题: <c:out value="${serverInfo.name}"/> <br/>
                       url: <c:out value="${serverInfo.url}"/>                         <br/>
                       线路:  <c:out value="${serverInfo.line}"/>    <br/>
                     创建时间:   <c:out value="${serverInfo.createDate}"/>    <br/>
                     更新时间：<c:out value="${serverInfo.updateDate}"/>    <br/>
                     用户id：<c:out value="${serverInfo.userId}"/>    <br/>
                     发布时间：<c:out value="${serverInfo.publishTime}"/>    <br/>
                     描述:<c:out value="${fn:substring(serverInfo.description, 0, 5000)}" escapeXml="true"/><br/>
                     赞：${serverSysInfo.voteIn}

                    </div>
                    <div class="clearfix"></div>



                </section>
                <!-- End of Left column/section -->

                <!-- Right column/section -->
                <aside class="colgroup width2"  id="asider">
                    <div class="clean-content-box">                  
                        <section class="notes-total">
                            <img src="/img/atu.png" width="166px" height="42px" alt="阿土游戏"/>
                            <a class="big-btn btn-yellow" href="/user/publish.htm">免费发布新站</a>
                        </section>
                    </div>
                    <hr>
                </aside>
                <!-- End of Right column/section -->

                <!-- End of Wrapper -->
            </div>
            <!-- End of Page content -->
            <a id="totop" style="display: block;">^ scroll to top</a>
            <%@include file="../common/footer.jsp" %>

    </body>
</html>
