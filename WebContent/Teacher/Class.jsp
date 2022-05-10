<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"    %>
        <%@ page import="Model.*" %>
        <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html  >
<head>
<meta charset="UTF-8">
<title>MySmartSchool</title>
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>

  <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/mobile.css"/>" media="(max-width: 700px)">
    <link rel="stylesheet" href="<c:url value="/css/smallmobile.css"/>" media="(max-width: 390px)">
      <link rel="stylesheet" href="<c:url value="/css/class.css"/>">
    
</head>
 <script defer src="<c:url value="/js/script.js"/>"></script>
     <script defer src="<c:url value="/js/mobilescreen.js"/>"></script>
<body>
   <nav class="sidebar close">
        <header>

            <div class="image-text">

                <span class="imageprofil">


                </span>



                <div class="text logo-text">

                    <a href="<%=request.getContextPath()%>/index" class="hometext"><span class="name   ">Home Teacher</span></a>

                    <a href="<%=request.getContextPath()%>/Teacherprofil" class="username "> <span class="profession ">
                            Nom Prenom
                        </span>
                    </a>

                </div>

            </div>


            <i class='bx bx-chevron-right toggle'></i>
            <i class='bx bx-menu togglemenu2'></i>

        </header>



        <div class="menu-bar">

            <div class="menu">



                <li class="search-box">

                    <i class='bx bx-search icon'></i>

                    <input type="text" placeholder="Search...">

                </li>



                <ul class="menu-links ">
                    <li class="nav-link ">

                        <a href="/schedule.html">

                            <i class='bx bx-grid icon'></i>

                            <span class="text nav-text ">Schedule</span>

                        </a>

                    </li>


                    <li class="nav-link hover">

                        <a href="<%=request.getContextPath()%>/Groupes">

                            <i class='bx bx-copy icon  texthover'></i>

                            <span class="text nav-text texthover">Class</span>

                        </a>

                    </li>



                    <li class="nav-link ">

                        <a href="appele.html">

                            <i class='bx bx-credit-card-front icon'></i>

                            <span class="text nav-text ">Verre Appele</span>

                        </a>

                    </li>



                    <li class="nav-link">

                        <a href="/communication.html">

                            <i class='bx bx-message-minus icon'></i>

                            <span class="text nav-text">Communication</span>

                        </a>

                    </li>










                    <li class="nav-link ">

                        <a href="/annoces.html">

                            <i class='bx bx-bell icon'></i>

                            <span class="text nav-text ">Advertisement</span>

                        </a>

                    </li>



                </ul>

            </div>



            <div class="bottom-content">

                <li class="">

                    <a href="#">

                        <i class='bx bx-log-out icon'></i>

                        <span class="text nav-text">Logout</span>

                    </a>

                </li>



                <li class="mode">

                    <div class="sun-moon">

                        <i class='bx bx-moon icon moon'></i>

                        <i class='bx bx-sun icon sun'></i>

                    </div>

                    <span class="mode-text text">Dark mode</span>



                    <div class="toggle-switch">

                        <span class="switch"></span>

                    </div>

                </li>



            </div>

        </div>



    </nav>

    <section class="home homeprofil">
        <div class="headermobile">
            <i class='bx bx-menu togglemenu'></i>
            <div class="text texthome"> Class</div>

        </div>
        <div class="container">
        
            <h1 class="level-1 rectangle">اولى ثانوي</h1>
            <ol class="level-2-wrapper">
                <li>
                    <h2 class="level-2 rectangle">علمي </h2>
                    <ol class="level-3-wrapper">
                        <li>

                            <ol class="level-4-wrapper">
                                     <%   int nbr_class=0; %>
                            
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==1}">
                                                            <c:if test="${class_list.getSpecialiste().equals('علمي')}">
                              <%    nbr_class=nbr_class+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                <% if(nbr_class==0){
                                
                                	%>
                	
                                	<li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                                	
                               <% } %>
                                                   
                             
                               
                            </ol>

                        </li>
                        
                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">ادبي </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                 <%   int  nbr=0; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==1}">
                                                            <c:if test="${class_list.getSpecialiste().equals('ادبي')}">
                              <%    nbr=nbr+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                <% if(nbr==0){
                                
                                    %>
                    
                                    <li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                                    
                               <% } %>
                                                   
                             

                            </ol>
                        </li>
                       
                    </ol>
                </li>
            </ol>
        </div>

        <div class="container container2as">
            <h1 class="level-1 rectangle">ثانية ثانوي</h1>
            <ol class="level-2-wrapper">
                <li>
                    <h2 class="level-2 rectangle">علوم </h2>
                    <ol class="level-3-wrapper">
                        <li>

                            <ol class="level-4-wrapper">
                                  <%   int  nbr_2as=0; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==2}">
                                                            <c:if test="${class_list.getSpecialiste().equals('علوم')}">
                              <%    nbr_2as=nbr_2as+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                <% if(nbr_2as==0){
                                
                                    %>
                    
                                    <li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                                    
                               <% } %>

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">رياضيات </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                 <%   int  nbr_2as_1=0; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==2}">
                                                            <c:if test="${class_list.getSpecialiste().equals('رياضيات')}">
                              <%    nbr_2as_1=nbr_2as_1+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                <% if(nbr_2as_1==0){
                                
                                    %>
                    
                                    <li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                                    
                               <% } %>

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">تسير و اقتصاد </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                 <%   int  nbr_2as_2=0; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==2}">
                                                            <c:if test="${class_list.getSpecialiste().equals('تسير و اقتصاد')}">
                              <%    nbr_2as_2=nbr_2as_2+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                <% if(nbr_2as_2==0){
                                
                                    %>
                    
                                    <li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                                    
                               <% } %>

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">هندسة مدنية </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_2as_3=0; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==2}">
                                                            <c:if test="${class_list.getSpecialiste().equals('هندسة مدنية')}">
                              <%     nbr_2as_3= nbr_2as_3+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                <% if( nbr_2as_3==0){
                                
                                    %>
                    
                                    <li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                                    
                               <% } %>
                               

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">هندسة طرائق </h2>
                    <ol class="level-3-wrapper">
                        <li>
                           
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_2as_4=0; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==2}">
                                                            <c:if test="${class_list.getSpecialiste().equals('هندسة طرائق')}">
                              <%    nbr_2as_4= nbr_2as_4+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                <% if( nbr_2as_4==0){
                                
                                    %>
                    
                                    <li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                                    
                               <% } %>
                               

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">هندسة كهربائية </h2>
                    <ol class="level-3-wrapper">
                        <li>
                           
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_2as_6=0; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==2}">
                                                            <c:if test="${class_list.getSpecialiste().equals('هندسة كهربائية ')}">
                              <%     nbr_2as_6= nbr_2as_6+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                <% if( nbr_2as_6==0){
                                
                                    %>
                    
                                    <li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                                    
                               <% } %>
                               
                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">اداب </h2>
                    <ol class="level-3-wrapper">
                        <li>
                           
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_2as_7=0; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==2}">
                                                            <c:if test="${class_list.getSpecialiste().equals('اداب')}">
                              <%      nbr_2as_7=  nbr_2as_7+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                <% if(  nbr_2as_7==0){
                                
                                    %>
                    
                                    <li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                                    
                               <% } %>
                               
                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">لغات </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_2as_8=0; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==2}">
                                                            <c:if test="${class_list.getSpecialiste().equals('لغات')}">
                              <%      nbr_2as_8=  nbr_2as_8+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                <% if(  nbr_2as_8==0){
                                
                                    %>
                    
                                    <li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                                    
                               <% } %>
                               
                            </ol>
                        </li>

                    </ol>
                </li>
            </ol>
        </div>

        <div class="container container2as">
            <h1 class="level-1 rectangle">ثالثة ثانوي </h1>
            <ol class="level-2-wrapper">
                <li>
                    <h2 class="level-2 rectangle">علوم </h2>
                    <ol class="level-3-wrapper">
                        <li>

                            <ol class="level-4-wrapper">
                                  <%   int  nbr_3as=0; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==3}">
                                                            <c:if test="${class_list.getSpecialiste().equals('علوم')}">
                              <%    nbr_3as=nbr_3as+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                <% if(nbr_3as==0){
                                
                                    %>
                    
                                    <li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                                    
                               <% } %>

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">رياضيات </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                 <%   int  nbr_3as_1=0; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==3}">
                                                            <c:if test="${class_list.getSpecialiste().equals('رياضيات')}">
                              <%    nbr_3as_1=nbr_3as_1+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                <% if(nbr_3as_1==0){
                                
                                    %>
                    
                                    <li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                                    
                               <% } %>

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">تسير و اقتصاد </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                 <%   int  nbr_3as_2=0; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==3}">
                                                            <c:if test="${class_list.getSpecialiste().equals('تسير و اقتصاد')}">
                              <%    nbr_3as_2=nbr_3as_2+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                <% if(nbr_3as_2==0){
                                
                                    %>
                    
                                    <li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                                    
                               <% } %>

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">هندسة مدنية </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_3as_3=0; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==3}">
                                                            <c:if test="${class_list.getSpecialiste().equals('هندسة مدنية')}">
                              <%     nbr_3as_3= nbr_3as_3+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                <% if( nbr_3as_3==0){
                                
                                    %>
                    
                                    <li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                                    
                               <% } %>
                               

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">هندسة طرائق </h2>
                    <ol class="level-3-wrapper">
                        <li>
                           
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_3as_4=0; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==3}">
                                                            <c:if test="${class_list.getSpecialiste().equals('هندسة طرائق')}">
                              <%    nbr_3as_4= nbr_3as_4+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                <% if( nbr_3as_4==0){
                                
                                    %>
                    
                                    <li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                                    
                               <% } %>
                               

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">هندسة كهربائية </h2>
                    <ol class="level-3-wrapper">
                        <li>
                           
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_3as_6=0; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==3}">
                                                            <c:if test="${class_list.getSpecialiste().equals('هندسة كهربائية ')}">
                              <%     nbr_3as_6= nbr_3as_6+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                <% if( nbr_3as_6==0){
                                
                                    %>
                    
                                    <li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                                    
                               <% } %>
                               
                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">اداب </h2>
                    <ol class="level-3-wrapper">
                        <li>
                           
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_3as_7=0; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==3}">
                                                            <c:if test="${class_list.getSpecialiste().equals('اداب')}">
                              <%      nbr_3as_7=  nbr_3as_7+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                <% if(  nbr_3as_7==0){
                                
                                    %>
                    
                                    <li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                                    
                               <% } %>
                               
                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">لغات </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_3as_8=0; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==3}">
                                                            <c:if test="${class_list.getSpecialiste().equals('لغات')}">
                              <%      nbr_3as_8=  nbr_3as_8+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                <% if(  nbr_3as_8==0){
                                
                                    %>
                    
                                    <li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                                    
                               <% } %>
                               
                            </ol>
                        </li>

                    </ol>
                </li>
            </ol>
        </div>

        






    </section>
</body>

</html>