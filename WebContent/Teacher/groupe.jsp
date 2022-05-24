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
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
    
    
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

                    <a href="<%=request.getContextPath()%>/index" class="hometext"><span class="name  ">Accueil </span></a>

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

                    <li class="nav-link ">

                        <a href="<%=request.getContextPath()%>/Schedule">

                            <i class='bx bx-grid icon'></i>

                            <span class="text nav-text ">Programme</span>

                        </a>

                    </li>



                    <li class="nav-link hover">

                        <a href="<%=request.getContextPath()%>/Groupes">

                            <i class='bx bx-copy icon  texthover'></i>

                            <span class="text nav-text texthover">Classe</span>

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
                <ul>
                    <li class="">

                        <a href="<%=request.getContextPath()%>/login">

                            <i class='bx bx-log-out icon'></i>

                            <span class="text nav-text">Se déconnecter</span>

                        </a>

                    </li>



                   


                </ul>
            </div>

        </div>



    </nav>


    <!--  main -->
    <section class="home homeetud">
        <div class="headermobile">
            <i class='bx bx-menu togglemenu'></i>

            <div class="text texthome"> <c:out value="${groupe.getId_niveau() }" /> AS</div>
        </div>
        <div class="titlenote">
            <a href="<%=request.getContextPath()%>/Groupes" class="btnleft"> <i class='bx bx-reply'></i>
            </a>
                      
            
            <span>
       <c:out value="${groupe.getId_niveau() }" /> Anneé 
                 &nbsp;G : <c:out value="${groupe.getNbr_class() }" />  
                 &nbsp;<c:out value="${groupe.getSpecialiste() }" />
            </span>
           
        </div>
       
        <div class="contentetud groupe">
            <div class="holder">

                <div class="holde1 absences">
                    <input type="checkbox" id="checkabsences">
                    <label for="checkabsences"> Absences  <br>
                        <i class='bx bx-run'></i>
                    </label>

                </div>
                <div class=" holde1 note">
                    <a href="<%=request.getContextPath()%>/StudentList?id_class= <c:out value="${groupe.getId()}" />">&nbsp;&nbsp;étudiants&nbsp;&nbsp; <br>
                        <i class='bx bx-receipt'></i></a> </div>
                <div class="holde1 textbook">
                    <a href="<%=request.getContextPath()%>/cahier?id_class= <c:out value="${groupe.getId()}" />"> Cahier de Text <br>
                        <i class='bx bx-book-open'></i>
                    </a>
                </div>


            </div>
            <!-- design schedule of the student -->
            <div class="text textschedule"> <span> Programme </span> </div>

            <div class="table  grouptable">
                <div class="row">
                    <div class="col-12">
                        <div class="row day-columns">
                            <div class="day-column">
                                <div class="day-header">Dimenche</div>
                                <div class="day-content">
                                
                                
          <c:if test="${programme != null }">
                                                        
         <c:forEach  var="programme"  items="${programme}"  >
        

            <c:if test="${programme.getDay().equals('dimenche')}">
          
                                 <div class="event gray">
                               <c:forEach  var="programme_matiére"  items="${programme_matiére}"  >
                         <c:if test="${programme.getMatiere_id() eq programme_matiére.getId() }">
                             
                                          <span class="title"> <c:out value="${programme_matiére.getNom_matiere() }" />  </span>
                    
                           </c:if> 
                 </c:forEach>
                                     <footer>
                                            <span> <c:out value="${programme.getOpen_time() }" /></span>
                                        </footer>
                                   
          
          
          
          </div>

          </c:if> 

      </c:forEach>
           </c:if> 
                                    
                                    
                                    
                                    
                                    

                                </div>
                            </div>
                            <div class="day-column">
                                <div class="day-header">Lundi</div>
                                <div class="day-content">
                                
                                
                                                        
                                  <c:if test="${programme != null }">
                                                        
         <c:forEach  var="programme"  items="${programme}"  >
        

            <c:if test="${programme.getDay().equals('lundi')}">
          
                                 <div class="event navy">
                               <c:forEach  var="programme_matiére"  items="${programme_matiére}"  >
                         <c:if test="${programme.getMatiere_id() eq programme_matiére.getId() }">
                             
                                          <span class="title"> <c:out value="${programme_matiére.getNom_matiere() }" />  </span>
                    
                           </c:if> 
                 </c:forEach>
                                     <footer>
                                            <span> <c:out value="${programme.getOpen_time() }" /></span>
                                        </footer>
                                   
          
          
          
          </div>

          </c:if> 

      </c:forEach>
               </c:if>                     
                                    
                                    
                                    
                                </div>
                            </div>
                            <div class="day-column">
                                <div class="day-header">Mardi</div>
                                <div class="day-content">
                                
                                
                                                            
                                       <c:if test="${programme != null }">
                                                        
         <c:forEach  var="programme"  items="${programme}"  >
        

            <c:if test="${programme.getDay().equals('mardi')}">
          
                                 <div class="event math">
                               <c:forEach  var="programme_matiére"  items="${programme_matiére}"  >
                         <c:if test="${programme.getMatiere_id() eq programme_matiére.getId() }">
                             
                                          <span class="title"> <c:out value="${programme_matiére.getNom_matiere() }" />  </span>
                    
                           </c:if> 
                 </c:forEach>
                                     <footer>
                                            <span> <c:out value="${programme.getOpen_time() }" /></span>
                                        </footer>
                                   
          
          
          
          </div>

          </c:if> 

      </c:forEach>
            </c:if>                        
                                    
                                </div>
                            </div>
                            <div class="day-column">
                                <div class="day-header">Mercredi</div>
                                <div class="day-content">
                                
                                
                                              <c:if test="${programme != null }">
                                                                                 
         <c:forEach  var="programme"  items="${programme}"  >
        

            <c:if test="${programme.getDay().equals('mercredi')}">
          
                                 <div class="event sport">
                               <c:forEach  var="programme_matiére"  items="${programme_matiére}"  >
                         <c:if test="${programme.getMatiere_id() eq programme_matiére.getId() }">
                             
                                          <span class="title"> <c:out value="${programme_matiére.getNom_matiere() }" />  </span>
                    
                           </c:if> 
                 </c:forEach>
                                     <footer>
                                            <span> <c:out value="${programme.getOpen_time() }" /></span>
                                        </footer>
                                   
          
          
          
          </div>

          </c:if> 

      </c:forEach>
                   </c:if>                 
                                    
                                    
                                    
                                    
                                </div>
                            </div>
                            <div class="day-column">
                                <div class="day-header">Jeudi</div>
                                <div class="day-content">
                                
                                
                                
                                
                                              <c:if test="${programme != null }">
                                                                                                            
         <c:forEach  var="programme"  items="${programme}"  >
        

                   <c:if test="${programme.getDay().equals('jeudi')}">
          
                                 <div class="event arabic">
                               <c:forEach  var="programme_matiére"  items="${programme_matiére}"  >
                         <c:if test="${programme.getMatiere_id() eq programme_matiére.getId() }">
                             
                                          <span class="title"> <c:out value="${programme_matiére.getNom_matiere() }" />  </span>
                    
                           </c:if> 
                 </c:forEach>
                                     <footer>
                                            <span> <c:out value="${programme.getOpen_time() }" /></span>
                                        </footer>
                                   
          
          
          
          </div>

          </c:if> 

      </c:forEach>
                     </c:if>               
                                    
                                    
                                    
                                    
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>



</div>

           


    </section>






 
   



</body>
</html>