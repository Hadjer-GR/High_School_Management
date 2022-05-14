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


  <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/mobile.css"/>" media="(max-width: 880px)">
    <link rel="stylesheet" href="<c:url value="/css/smallmobile.css"/>" media="(max-width: 390px)">
      <link rel="stylesheet" href="<c:url value="/css/table.css"/>">

 
</head>
 <script defer src="<c:url value="/js/etud.js"/>"></script>
  <script defer src="<c:url value="/js/script.js"/>"></script>
 
     <script defer src="<c:url value="/js/mobilescreen.js"/>"></script>
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

                        <a href="/appele.html">

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
                <ul>
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


                </ul>
            </div>

        </div>



    </nav>


    <!--  main -->
    <section class="home homeetud">
        <div class="headermobile">
            <i class='bx bx-menu togglemenu'></i>

            <div class="text texthome">1AS</div>
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
                    <label for="checkabsences"> Absences And Delay <br>
                        <i class='bx bx-run'></i>
                    </label>

                </div>
                <div class=" holde1 note">
                    <a href="studentList.html">&nbsp;&nbsp;Student&nbsp;&nbsp; <br>
                        <i class='bx bx-receipt'></i> </div>
                <div class="holde1 textbook">
                    <a href="textbook.html"> The Text Book <br>
                        <i class='bx bx-book-open'></i>
                    </a>
                </div>


            </div>
            <!-- design schedule of the student -->
            <div class="text textschedule"> <span> schedule </span> </div>

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

            <!-- design Absences And Delay  after enter btn Absences And Delay -->
            <div class=" contentabsences" id="contentAbsent">

                <div class="cardeabsences">
                    <h2> &nbsp;&nbsp;<i class='bx bx-run'></i> &nbsp;&nbsp;Absences</h2>
                    <div class="time">
                        <h2>19/03/2022</h2>
                        <h2> 10:00-> 11:00</h2>
                    </div>
                    <div class="justifie">
                        <i class='bx bxs-user-check'></i>
                        <a href="#" class="justified"> Justified</a>
                    </div>
                </div>




                <!-- design btn View Alll -->
                <div class="view">
                    <a href="/Absences.html"> View All</a>
                </div>

            </div>


    </section>





 <script>
       
        const absences = document.getElementById("contentAbsent");
        console.log(absences);
        const showabsences = document.querySelectorAll("#checkabsences");
        showabsences.forEach((item) => {
            item.addEventListener("change", (eo) => {
                if (item.checked) {
                    absences.style.display = "block";
                } else {
                    absences.style.display = "none";
                }
            });
        });
    </script>


 
   



</body>
</html>