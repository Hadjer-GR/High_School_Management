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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/cssadmin/eventSchedule.css">
       <link rel="stylesheet" href="${pageContext.request.contextPath}/cssadmin/adminmobile.css" media="(max-width: 880px)">
       
    
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
                    <a href="<%=request.getContextPath()%>//Seance?id_class= <c:out value="${groupe.getId()}" />"> Cahier de Text <br>
                        <i class='bx bx-book-open'></i>
                    </a>
                </div>


            </div>
            <!-- design schedule of the student -->
            <div class="text textschedule"> <span> Programme </span> </div>


    <div class="contentetud">


            <div class="table  grouptable" id="container">
                <div class="row">
                    <div class="col-12">
                        <div class="row day-columns">
                            <div class="day-column">
                                <div class="day-header">Dimenche</div>
                                <div class="day-content">
                                
                                
                     <c:forEach  var="list_emploi"  items="${list_emploi}"  >
                         <c:if test="${list_emploi.getDay().equals('Dimenche')}">
                                
                                    <div class="event gray">
                                        
                                        <span class="title"> <c:out value="${list_emploi.getMatiere() }" /> </span>

                               <c:forEach  var="list_teacher_emploi"  items="${list_teacher_emploi}"  >
                         <c:if test="${list_emploi.getEnseig_id() eq list_teacher_emploi.getId() }">
                                     
                                        <footer>
                                            <span><c:out value="${list_teacher_emploi.getFirst_name() }" />
                                            <c:out value="${list_teacher_emploi.getLast_name() }" />
                                            </span>
                                             &nbsp;
                                            <span> <c:out value="${list_emploi.getOpen_time() }" /></span>
                                        </footer>
                                        
                                        </c:if>
                                        </c:forEach>
                                        <span class="title"> S: <c:out value="${list_emploi.getSalle() }" />  </span>

                                    </div>
</c:if>
</c:forEach>




                                </div>
                            </div>
                            <div class="day-column">
                                <div class="day-header">Lundi</div>
                                <div class="day-content">
            
                     <c:forEach  var="list_emploi"  items="${list_emploi}"  >
                         <c:if test="${list_emploi.getDay().equals('Lundi')}">
                                
                                    <div class="event navy">
                                       
                                        <span class="title"> <c:out value="${list_emploi.getMatiere() }" /> </span>

                               <c:forEach  var="list_teacher_emploi"  items="${list_teacher_emploi}"  >
                         <c:if test="${list_emploi.getEnseig_id() eq list_teacher_emploi.getId() }">
                                     
                                        <footer>
                                            <span><c:out value="${list_teacher_emploi.getFirst_name() }" />
                                            <c:out value="${list_teacher_emploi.getLast_name() }" />
                                            </span>
                                           &nbsp;
                                            <span> <c:out value="${list_emploi.getOpen_time() }" /></span>
                                        </footer>
                                        
                                        </c:if>
                                        </c:forEach>
                                        <span class="title"> S: <c:out value="${list_emploi.getSalle() }" />  </span>

                                    </div>
</c:if>
</c:forEach>

                                </div>
                            </div>
                            <div class="day-column">
                                <div class="day-header">Mardi</div>
                                <div class="day-content">

            
                     <c:forEach  var="list_emploi"  items="${list_emploi}"  >
                         <c:if test="${list_emploi.getDay().equals('Mardi')}">
                                
                                    <div class="event math">
                                       
                                        <span class="title"> <c:out value="${list_emploi.getMatiere() }" /> </span>

                               <c:forEach  var="list_teacher_emploi"  items="${list_teacher_emploi}"  >
                         <c:if test="${list_emploi.getEnseig_id() eq list_teacher_emploi.getId() }">
                                     
                                        <footer>
                                            <span><c:out value="${list_teacher_emploi.getFirst_name() }" />
                                            <c:out value="${list_teacher_emploi.getLast_name() }" />
                                            </span>
                                           &nbsp;
                                            <span> <c:out value="${list_emploi.getOpen_time() }" /></span>
                                        </footer>
                                        
                                        </c:if>
                                        </c:forEach>
                                        <span class="title"> S: <c:out value="${list_emploi.getSalle() }" />  </span>

                                    </div>
</c:if>
</c:forEach>

                                </div>
                            </div>
                            <div class="day-column">
                                <div class="day-header">Mercredi</div>
                                <div class="day-content">
            
                     <c:forEach  var="list_emploi"  items="${list_emploi}"  >
                         <c:if test="${list_emploi.getDay().equals('Mercredi')}">
                                
                                    <div class="event sport">
                                        
                                        <span class="title"> <c:out value="${list_emploi.getMatiere() }" /> </span>

                               <c:forEach  var="list_teacher_emploi"  items="${list_teacher_emploi}"  >
                         <c:if test="${list_emploi.getEnseig_id() eq list_teacher_emploi.getId() }">
                                     
                                        <footer>
                                            <span><c:out value="${list_teacher_emploi.getFirst_name() }" />
                                            <c:out value="${list_teacher_emploi.getLast_name() }" />
                                            </span>
                                          &nbsp;
                                            <span> <c:out value="${list_emploi.getOpen_time() }" /></span>
                                        </footer>
                                        
                                        </c:if>
                                        </c:forEach>
                                        <span class="title"> S: <c:out value="${list_emploi.getSalle() }" />  </span>

                                    </div>
</c:if>
</c:forEach>

                                </div>
                            </div>
                            <div class="day-column">
                                <div class="day-header">Jeudi</div>
                                <div class="day-content">

            
                     <c:forEach  var="list_emploi"  items="${list_emploi}"  >
                         <c:if test="${list_emploi.getDay().equals('Jeudi')}">
                                
                                    <div class="event arabic">
                                       
                                        <span class="title"> <c:out value="${list_emploi.getMatiere() }" /> </span>

                               <c:forEach  var="list_teacher_emploi"  items="${list_teacher_emploi}"  >
                         <c:if test="${list_emploi.getEnseig_id() eq list_teacher_emploi.getId() }">
                                     
                                        <footer>
                                            <span><c:out value="${list_teacher_emploi.getFirst_name() }" />
                                            <c:out value="${list_teacher_emploi.getLast_name() }" />
                                            </span>
                                         &nbsp;
                                            <span> <c:out value="${list_emploi.getOpen_time() }" /></span>
                                        </footer>
                                        
                                        </c:if>
                                        </c:forEach>
                                        <span class="title"> S: <c:out value="${list_emploi.getSalle() }" />  </span>

                                    </div>
</c:if>
</c:forEach>

                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
</div>

   <c:if test="${step == 1}">

      <div class="addevent2">
       <div class="eventclose">
                    <span>
                      <a href="<%=request.getContextPath()%>/ShowProgramClass?close=1"><i class='bx bx-x btnclosee'></i></a>  
                    </span>
                </div>

 <form>

                    <div>

 <div class="seance" >
  <br>
   <br>
    <br>
                            <h4 > desole voter seance n'est pas a ce moment    </h4>
                            <br>
                             <h5> Verfie voter programme svp .</h5>
                            
                            
                            <br>
                           
                        </div>



</div>
</form></div>
         </c:if>  


    </section>


   
<script>




const addevent = document.getElementById("addevent");
const addevent2 = document.querySelector(".addevent2");
const btnclose = document.getElementById("btnclose");
const container = document.getElementById("container");
const btnclosee = document.querySelector(".btnclosee");
const addemploi = document.getElementById("addemploi");


console.log(addemploi);
console.log(btnclose);
addemploi.addEventListener("click", (eo) => {
  document.getElementById("addevent").classList.remove("closeadd");
});
btnclose.addEventListener("click", (eo) => {
  document.getElementById("addevent").classList.add("closeadd");
});

btnclosee.addEventListener("click", (eo) => {
  addevent2.classList.add("closeadd");
});







</script>





 
   



</body>
</html>