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
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>


  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mobile.css" media="(max-width: 700px)">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/smallmobile.css" media="(max-width: 390px)">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css" >
    
    <style>
    
    .content form .picture .img ,.sidebar header .imageprofil{
      background-image: url('../img/profilimg.jpg');

    }
    
    
    
    
    
    
    </style>
    
    
   <script  defer type="text/javascript"   src="${pageContext.request.contextPath}/js/script.js"></script>
    <script defer type="text/javascript" src="${pageContext.request.contextPath}/js/profil.js"></script>
    <script defer type="text/javascript"  src="${pageContext.request.contextPath}/js/mobilescreen.js"></script>
    
    </head>
<body>

 <nav class="sidebar close">

        <header>

            <div class="image-text">

                <span class="imageprofil">


                </span>



                <div class="text logo-text">

                    <a href="<%=request.getContextPath()%>/index" class="hometext"><span class="name  hovername ">Accueil </span></a>

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



                <ul class="menu-links">

                    <li class="nav-link hover ">

                        <a href="<%=request.getContextPath()%>/Schedule">

                            <i class='bx bx-grid icon  texthover'></i>

                            <span class="text nav-text texthover ">Programme</span>

                        </a>

                    </li>


                    <li class="nav-link ">

                        <a href="<%=request.getContextPath()%>/Groupes">

                            <i class='bx bx-copy icon '></i>

                            <span class="text nav-text ">Classe</span>

                        </a>

                    </li>



                    










                    <li class="nav-link ">

                        <a href="/annoces.html">

                            <i class='bx bx-bell icon'></i>

                            <span class="text nav-text ">Annonces</span>

                        </a>

                    </li>



                </ul>

            </div>



            <div class="bottom-content">

                <li class="">

                    <a href="<%=request.getContextPath()%>/login">

                        <i class='bx bx-log-out icon'></i>

                        <span class="text nav-text">Se déconnecter</span>

                    </a>

                </li>



                



            </div>

        </div>
    </nav>

    <section class="home homeetud table_teacher">
        <div class="headermobile">
            <i class='bx bx-menu togglemenu'></i>

            <div class="text texthome">Programme</div>
        </div>
        <div class="contentetud">

            <div class="text textschedule"> <span> le programme :</span> </div>

            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="row day-columns">
                            <div class="day-column">
                                <div class="day-header">Dimenche</div>
                                
                                
                                
                                <div class="day-content">
        
                                
         <c:forEach  var="list_emploi"  items="${list_emploi}"  >
        

            <c:if test="${list_emploi.getDay().equals('dimenche')}">
          
                                 <div class="event gray">
                               <c:forEach  var="class_emploi"  items="${class_emploi}"  >
                         <c:if test="${list_emploi.getEmploi_id() eq class_emploi.getEmlpoi_id() }">
                               
                                   
                                          <span class="title"> <c:out value="${class_emploi.getId_niveau() }" /> Anneé </span>
                                        <footer>
                                            <span>G:<c:out value="${class_emploi.getNbr_class() }" /></span>
                                              
                                            <span><c:out value="${class_emploi.getSpecialiste() }" /></span>
                           </c:if> 
                 </c:forEach>
                                            <span> <c:out value="${list_emploi.getOpen_time() }" /></span>
                                        </footer>
                                   
          
          
          
          </div>

          </c:if> 

      </c:forEach>
                                   
      </div>
                                    
                                   
                                    

                                </div>
        
                                
                         
                            <div class="day-column">
                                <div class="day-header">Lundi</div>
                                <div class="day-content">
                                
                                
                                                           
         <c:forEach  var="list_emploi"  items="${list_emploi}"  >
        

            <c:if test="${list_emploi.getDay().equals('lundi')}">
          
                                 <div class="event navy">
                               <c:forEach  var="class_emploi"  items="${class_emploi}"  >
                         <c:if test="${list_emploi.getEmploi_id() eq class_emploi.getEmlpoi_id() }">
                               
                                   
                                         <span class="title"> <c:out value="${class_emploi.getId_niveau() }" /> Anneé </span>
                                        <footer>
                                            <span>G:<c:out value="${class_emploi.getNbr_class() }" /></span>
                                              
                                            <span><c:out value="${class_emploi.getSpecialiste() }" /></span>
                           </c:if> 
                 </c:forEach>
                                            <span> <c:out value="${list_emploi.getOpen_time() }" /></span>
                                        </footer>
                                   
          
          
          
          </div>
          
          </c:if> 
       

      </c:forEach>
                                   
      
                
                                    
                                    
                                    
                                    
                                    
                                    
                                </div>
                            </div>
                            <div class="day-column">
                                <div class="day-header">Mardi</div>
                                <div class="day-content">
                                
                                
                                
                                
                                   
                                                          
                                                           
         <c:forEach  var="list_emploi"  items="${list_emploi}"  >
        

            <c:if test="${list_emploi.getDay().equals('mardi')}">
          
                                 <div class="event math">
                               <c:forEach  var="class_emploi"  items="${class_emploi}"  >
                         <c:if test="${list_emploi.getEmploi_id() eq class_emploi.getEmlpoi_id() }">
                               
                                   
                                        <span class="title"> <c:out value="${class_emploi.getId_niveau() }" /> Anneé </span>
                                        <footer>
                                            <span>G:<c:out value="${class_emploi.getNbr_class() }" /></span>
                                              
                                            <span><c:out value="${class_emploi.getSpecialiste() }" /></span>
                           </c:if> 
                 </c:forEach>
                                            <span> <c:out value="${list_emploi.getOpen_time() }" /></span>
                                        </footer>
                                   
          
          
          
          </div>
          
          </c:if> 
       

      </c:forEach>   
                                    
                                    
                                    
                                    
                                </div>
                            </div>
                            <div class="day-column">
                                <div class="day-header">Mercredi</div>
                                <div class="day-content">
                                
                                
                                
                                                                                      
         <c:forEach  var="list_emploi"  items="${list_emploi}"  >
        

            <c:if test="${list_emploi.getDay().equals('mercredi')}">
          
                                 <div class="event sport">
                               <c:forEach  var="class_emploi"  items="${class_emploi}"  >
                         <c:if test="${list_emploi.getEmploi_id() eq class_emploi.getEmlpoi_id() }">
                               
                                   
                                          <span class="title"> <c:out value="${class_emploi.getId_niveau() }" /> Anneé </span>
                                        <footer>
                                            <span>G:<c:out value="${class_emploi.getNbr_class() }" /></span>
                                              
                                            <span><c:out value="${class_emploi.getSpecialiste() }" /></span>
                           </c:if> 
                 </c:forEach>
                                            <span> <c:out value="${list_emploi.getOpen_time() }" /></span>
                                        </footer>
                                   
          
          
          
          </div>
          
          </c:if> 
       

      </c:forEach>   
                                   
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                </div>
                            </div>
                            <div class="day-column">
                                <div class="day-header">Jeudi</div>
                                <div class="day-content">
                                
                                
                                
                                
                                
                                                                                     
         <c:forEach  var="list_emploi"  items="${list_emploi}"  >
        

            <c:if test="${list_emploi.getDay().equals('jeudi')}">
          
                                 <div class="event arabic">
                               <c:forEach  var="class_emploi"  items="${class_emploi}"  >
                         <c:if test="${list_emploi.getEmploi_id() eq class_emploi.getEmlpoi_id() }">
                               
                                   
                                          <span class="title"> <c:out value="${class_emploi.getId_niveau() }" /> Anneé </span>
                                        <footer>
                                            <span>G:<c:out value="${class_emploi.getNbr_class() }" /></span>
                                              
                                            <span><c:out value="${class_emploi.getSpecialiste() }" /></span>
                           </c:if> 
                 </c:forEach>
                                            <span> <c:out value="${list_emploi.getOpen_time() }" /></span>
                                        </footer>
                                   
          
          
          
          </div>
          
          </c:if> 
       

      </c:forEach>   
                              
                                    
                                    
                                    
                                    
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>

    </section>

</body>
</html>