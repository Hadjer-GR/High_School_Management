<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"    %>
        <%@ page import="Model.*" %>
        <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html  >
<head>
 <title>MySmartschool</title>
 <meta name="viewport" content="width=device-width,initial-scale=1">
 
 <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/mobile.css"/>" media="(max-width: 880px)">
    <link rel="stylesheet" href="<c:url value="/css/smallmobile.css"/>" media="(max-width: 390px)">
         <link rel="stylesheet" href="<c:url value="/cssadmin/admin.css"/>" >
        <link rel="stylesheet" href="<c:url value="/cssadmin/adminmobile.css"/>" media="(max-width: 880px)">
                <link rel="stylesheet" href="<c:url value="/cssadmin/eventSchedule.css"/>"media="(max-width: 880px)">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/class.css">
        
    
     <script  defer type="text/javascript"   src="${pageContext.request.contextPath}/js/script.js"></script>
    <script defer type="text/javascript"  src="${pageContext.request.contextPath}/js/mobilescreen.js"></script>
</head>
<body>
 <nav class="sidebar close">

        <header>

            <div class="image-text">

                <span class="imageprofil">


                </span>

                <div class="text logo-text">

                    <a href="<%=request.getContextPath()%>/HomeAdmin" class="hometext"><span class="name     ">Accueil</span></a>

                    <a href="/profil.html" class="username "> <span class="profession ">
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



                <ul class="menu-links">

                    <li class="nav-link  hover">

                        <a href="<%=request.getContextPath()%>/emploi">

                            <i class='bx bx-grid icon  texthover'></i>

                            <span class="text nav-text texthover">Emploi de temp</span>

                        </a>

                    </li>


                    <li class="nav-link  ">

                        <a href="<%=request.getContextPath()%>/addTeacher">

                            <i class='bx bx-copy icon  '></i>

                            <span class="text nav-text ">Ajoute un compte</span>

                        </a>

                    </li>

                    <li class="nav-link ">

                        <a href="/annoces.html">

                            <i class='bx bx-bell icon'></i>

                            <span class="text nav-text ">Annoces</span>

                        </a>

                    </li>



                </ul>

            </div>



            <div class="bottom-content">

                <li class="">

                    <a href="<%=request.getContextPath()%>/login">

                        <i class='bx bx-log-out icon'></i>

                        <span class="text nav-text">Se d??connecter</span>

                    </a>

                </li>

            </div>

        </div>
    </nav>
    
    
    
    <section class="home homeprofil">
        <div class="headermobile">
            <i class='bx bx-menu togglemenu'></i>
            <div class="text texthome"> Emploi</div>

        </div>
        <div class="container">
        
            <h1 class="level-1 rectangle">1??me AS</h1>
            <ol class="level-2-wrapper">
                <li>
                    <h2 class="level-2 rectangle">Sciences </h2>
                    <ol class="level-3-wrapper">
                        <li>

                            <ol class="level-4-wrapper">
                                     <%   int nbr_class=1; %>
                            
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==1}">
                                                            <c:if test="${class_list.getSpecialiste().equals('sciences')}">
                              <%    nbr_class=nbr_class+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                
                    
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_class %>&niv_id=1&spet=sciences" ><i class='bx bx-plus'></i></a></h4>
                                   
                                </li>
                                    
                              
                                                   
                             
                               
                            </ol>

                        </li>
                        
                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">Lettre </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                 <%   int  nbr=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==1}">
                                                            <c:if test="${class_list.getSpecialiste().equals('lettres')}">
                              <%    nbr=nbr+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                
                    
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr%>&niv_id=1&spet=lettres" ><i class='bx bx-plus'></i></a></h4>
                                    
                                </li>
                                    
                              
                                                   
                             

                            </ol>
                        </li>
                       
                    </ol>
                </li>
            </ol>
        </div>

        <div class="container container2as">
            <h1 class="level-1 rectangle">2??me AS</h1>
            <ol class="level-2-wrapper">
                <li>
                    <h2 class="level-2 rectangle"> Sciences </h2>
                    <ol class="level-3-wrapper">
                        <li>

                            <ol class="level-4-wrapper">
                                  <%   int  nbr_2as=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==2}">
                                                            <c:if test="${class_list.getSpecialiste().equals('sciences')}">
                              <%    nbr_2as=nbr_2as+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                               
                    
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_2as%>&niv_id=2&spet=sciences" ><i class='bx bx-plus'></i></a></h4>
                                   
                                </li>
                                    
                             

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">Math??matiques </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                 <%   int  nbr_2as_1=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==2}">
                                                            <c:if test="${class_list.getSpecialiste().equals('mathematiques')}">
                              <%    nbr_2as_1=nbr_2as_1+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                               
                    
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_2as_1%>&niv_id=2&spet=mathematiques" ><i class='bx bx-plus'></i></a></h4>
                                    
                                </li>
                                    
                             

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">??conomie / gestion </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                 <%   int  nbr_2as_2=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==2}">
                                                            <c:if test="${class_list.getSpecialiste().equals('??conomie/gestion')}">
                              <%    nbr_2as_2=nbr_2as_2+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                               
                    
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_2as_2%>&niv_id=2&spet=??conomie/gestion" ><i class='bx bx-plus'></i></a></h4>
                                   
                                </li>
                                    
                             
                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle"> G??nie- civil </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_2as_3=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==2}">
                                                            <c:if test="${class_list.getSpecialiste().equals('genie-civil')}">
                              <%     nbr_2as_3= nbr_2as_3+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                               
                    
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_2as_3%>&niv_id=2&spet=genie-civil" ><i class='bx bx-plus'></i></a></h4>
                                  
                                  </li>
                                    
                               
                               

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">G??nie des proc??d??s </h2>
                    <ol class="level-3-wrapper">
                        <li>
                           
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_2as_4=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==2}">
                                                            <c:if test="${class_list.getSpecialiste().equals('g??nie des proc??d??s')}">
                              <%    nbr_2as_4= nbr_2as_4+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                               
                    
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_2as_4%>&niv_id=2&spet=g??nie des proc??d??s" ><i class='bx bx-plus'></i></a></h4>
                                   
                                </li>
                                    
                           
                               

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">G??nie-m??canique </h2>
                    <ol class="level-3-wrapper">
                        <li>
                           
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_2as_6=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==2}">
                                   <c:if test="${class_list.getSpecialiste().equals('g??nie-m??canique')}">
                              <%     nbr_2as_6= nbr_2as_6+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                               
                    
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_2as_6%>&niv_id=2&spet=g??nie-m??canique" ><i class='bx bx-plus'></i></a></h4>
                                   
                                </li>
                                    
                               
                            </ol>
                        </li>

                    </ol>
                </li>
                  <li>
                    <h2 class="level-2 rectangle">G??nie-??lectrique </h2>
                    <ol class="level-3-wrapper">
                        <li>
                           
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_2as_9=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==2}">
                                   <c:if test="${class_list.getSpecialiste().equals('g??nie-??lectrique')}">
                              <%     nbr_2as_9= nbr_2as_9+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                              
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_2as_9%>&niv_id=2&spet=g??nie-??lectrique" ><i class='bx bx-plus'></i></a></h4>
                                   
                                </li>
                                    
                             
                               
                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">Lettres</h2>
                    <ol class="level-3-wrapper">
                        <li>
                           
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_2as_7=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==2}">
                                                            <c:if test="${class_list.getSpecialiste().equals('lettres')}">
                              <%      nbr_2as_7=  nbr_2as_7+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                               
                    
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_2as_7%>&niv_id=2&spet=lettres" ><i class='bx bx-plus'></i></a></h4>
                                   
                                </li>

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">Langues ??trang??res </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_2as_8=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==2}">
                                                            <c:if test="${class_list.getSpecialiste().equals('langues ??trang??res')}">
                              <%      nbr_2as_8=  nbr_2as_8+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                
                    
                                    <li>
                           <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_2as_8%>&niv_id=2&spet=langues ??trang??res" ><i class='bx bx-plus'></i></a></h4>
                                    
                                    
                                </li>
                                    
                              
                            </ol>
                        </li>

                    </ol>
                </li>
            </ol>
        </div>

         <div class="container container2as">
            <h1 class="level-1 rectangle">3??me AS</h1>
            <ol class="level-2-wrapper">
                <li>
                    <h2 class="level-2 rectangle"> Sciences </h2>
                    <ol class="level-3-wrapper">
                        <li>

                            <ol class="level-4-wrapper">
                                  <%   int  nbr_3as=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==3}">
                            <c:if test="${class_list.getSpecialiste().equals('sciences')}">
                              <%    nbr_3as=nbr_3as+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                               
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_3as%>&niv_id=3&spet=sciences" ><i class='bx bx-plus'></i></a></h4>
                                   
                                </li>
                                    
                              

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">Math??matiques </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                 <%   int  nbr_3as_1=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==3}">
                                                            <c:if test="${class_list.getSpecialiste().equals('math??matiques')}">
                              <%    nbr_3as_1=nbr_3as_1+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                               
                    
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_3as_1%>&niv_id=3&spet=math??matiques" ><i class='bx bx-plus'></i></a></h4>
                                   
                                </li>
                                    

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">??conomie / gestion </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                 <%   int  nbr_3as_2=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==3}">
                                                            <c:if test="${class_list.getSpecialiste().equals('??conomie/gestion')}">
                              <%    nbr_3as_2=nbr_3as_2+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                               
                    
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_3as_2%>&niv_id=3&spet=??conomie/gestion" ><i class='bx bx-plus'></i></a></h4>
                                  
                                </li>
                                    

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle"> G??nie- civil </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_3as_3=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==3}">
                                                            <c:if test="${class_list.getSpecialiste().equals('g??nie-civil')}">
                              <%     nbr_3as_3= nbr_3as_3+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                              
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_3as_3%>&niv_id=3&spet=g??nie-civil" ><i class='bx bx-plus'></i></a></h4>
                                   
                                </li>
                                    
                               

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">G??nie des proc??d??s </h2>
                    <ol class="level-3-wrapper">
                        <li>
                           
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_3as_4=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==3}">
                                                            <c:if test="${class_list.getSpecialiste().equals('g??nie des proc??d??s')}">
                              <%    nbr_3as_4= nbr_3as_4+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                               
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_3as_4%>&niv_id=3&spet=g??nie des proc??d??s" ><i class='bx bx-plus'></i></a></h4>
                                   
                                </li>
                                    
                               

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">G??nie-m??canique </h2>
                    <ol class="level-3-wrapper">
                        <li>
                           
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_3as_6=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==3}">
                                   <c:if test="${class_list.getSpecialiste().equals('g??nie-m??canique')}">
                              <%     nbr_3as_6= nbr_3as_6+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                              
                    
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_3as_6%>&niv_id=3&spet=g??nie-m??canique" ><i class='bx bx-plus'></i></a></h4>
                                   
                                </li>
                                    
                               
                            </ol>
                        </li>

                    </ol>
                </li>
                  <li>
                    <h2 class="level-2 rectangle">G??nie-??lectrique </h2>
                    <ol class="level-3-wrapper">
                        <li>
                           
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_3as_9=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==3}">
                                   <c:if test="${class_list.getSpecialiste().equals('g??nie-??lectrique')}">
                              <%     nbr_3as_9= nbr_3as_9+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                               
                    
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_3as_9%>&niv_id=3&spet=g??nie-??lectrique" ><i class='bx bx-plus'></i></a></h4>
                                   
                                </li>
                                    
                               
                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">Lettres</h2>
                    <ol class="level-3-wrapper">
                        <li>
                           
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_3as_7=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==3}">
                                                            <c:if test="${class_list.getSpecialiste().equals('lettres')}">
                              <%      nbr_3as_7=  nbr_3as_7+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                               
                    
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_3as_7%>&niv_id=3&spet=lettres" ><i class='bx bx-plus'></i></a></h4>
                                   
                                </li>
                                    
                               
                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">Langues ??trang??res </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            
                            <ol class="level-4-wrapper">
                                  <%   int  nbr_3as_8=1; %>
                             <c:forEach  items="${class_list}" var="class_list" >
                           
                              <c:if test="${class_list.getId_niveau()==3}">
                                                            <c:if test="${class_list.getSpecialiste().equals('langues ??trang??res')}">
                              <%      nbr_3as_8=  nbr_3as_8+1; %>
                              
                             <li>                             
                               <h4 class="level-4 rectangle"><a href="<%=request.getContextPath()%>/emploiGroup?class_id=<c:out value="${class_list.getId()}" />"> <c:out value="${class_list.getNbr_class() }" /> </a></h4>               
                                </li>    
                                </c:if>
                                </c:if>
                                  </c:forEach>
                                
                    
                                    <li>
                            <h4 class="level-4 rectangle"><a class="btnadd"  href="<%=request.getContextPath()%>/AddClass?nbr_class=<%= nbr_3as_8%>&niv_id=3&spet=langues ??trang??res" ><i class='bx bx-plus'></i></a></h4>
                                   
                                </li>
                                    
                               
                            </ol>
                        </li>

                    </ol>
                </li>
            </ol>
        </div>
        





    </section>
    
    
</body>
</html>