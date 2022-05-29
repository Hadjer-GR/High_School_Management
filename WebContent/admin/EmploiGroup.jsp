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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/cssadmin/adminmobile.css" media="(max-width: 880px)">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
                
       <link rel="stylesheet" href="${pageContext.request.contextPath}/cssadmin/admin.css" >
      <link rel="stylesheet" href="${pageContext.request.contextPath}/cssadmin/eventSchedule.css">
       <link rel="stylesheet" href="${pageContext.request.contextPath}/cssadmin/adminmobile.css" media="(max-width: 880px)">
       
                    
               <script  defer type="text/javascript" src="${pageContext.request.contextPath}/jsAdmin/main.js"></script>
   
       <script  defer type="text/javascript"   src="${pageContext.request.contextPath}/js/script.js"></script>
         <script defer type="text/javascript"  src="${pageContext.request.contextPath}/js/mobilescreen.js"></script>
    
</head>
<body>
               <script  defer type="text/javascript" src="<%=request.getContextPath()%>/jsAdmin/main.js"></script>

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
        <div class="titlenote">
            <a href="<%=request.getContextPath()%>/emploi" class="btnleft"> <i class='bx bx-reply'></i>
            </a>
            <span>
                le programme : </span>
        </div>
        <div class="contentetud">


            <div class="container" id="container">
                <div class="row">
                    <div class="col-12">
                        <div class="row day-columns">
                            <div class="day-column">
                                <div class="day-header">Dimenche</div>
                                <div class="day-content">
                                
                                
                     <c:forEach  var="list_emploi"  items="${list_emploi}"  >
                         <c:if test="${list_emploi.getDay().equals('Dimenche')}">
                                
                                    <div class="event gray">
                                        <div class="eventtableclose">
                                          <a href="<%=request.getContextPath()%>/DeleteEmploi?emploi_id=<c:out value="${list_emploi.getId() }" />">
                                            <span>
                                              <i class='bx bx-x btnclosewritelesson'></i>
                                            </span>
                                            </a>
                                        </div>
                                        <span class="title"> <c:out value="${list_emploi.getMatiere() }" /> </span>

                               <c:forEach  var="list_teacher_emploi"  items="${list_teacher_emploi}"  >
                         <c:if test="${list_emploi.getEnseig_id() eq list_teacher_emploi.getId() }">
                                     
                                        <footer>
                                            <span><c:out value="${list_teacher_emploi.getFirst_name() }" />
                                            <c:out value="${list_teacher_emploi.getLast_name() }" />
                                            </span>
                                            <br>
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
                                        <div class="eventtableclose">
                                          <a href="<%=request.getContextPath()%>/DeleteEmploi?emploi_id=<c:out value="${list_emploi.getId() }" />">
                                            <span class="btnclose">
                                              <i class='bx bx-x btnclosewritelesson'></i>
                                            </span>
                                            </a>
                                        </div>
                                        <span class="title"> <c:out value="${list_emploi.getMatiere() }" /> </span>

                               <c:forEach  var="list_teacher_emploi"  items="${list_teacher_emploi}"  >
                         <c:if test="${list_emploi.getEnseig_id() eq list_teacher_emploi.getId() }">
                                     
                                        <footer>
                                            <span><c:out value="${list_teacher_emploi.getFirst_name() }" />
                                            <c:out value="${list_teacher_emploi.getLast_name() }" />
                                            </span>
                                            <br>
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
                                        <div class="eventtableclose">
                                          <a href="<%=request.getContextPath()%>/DeleteEmploi?emploi_id=<c:out value="${list_emploi.getId() }" />">
                                            <span>
                                              <i class='bx bx-x btnclosewritelesson'></i>
                                            </span>
                                            </a>
                                        </div>
                                        <span class="title"> <c:out value="${list_emploi.getMatiere() }" /> </span>

                               <c:forEach  var="list_teacher_emploi"  items="${list_teacher_emploi}"  >
                         <c:if test="${list_emploi.getEnseig_id() eq list_teacher_emploi.getId() }">
                                     
                                        <footer>
                                            <span><c:out value="${list_teacher_emploi.getFirst_name() }" />
                                            <c:out value="${list_teacher_emploi.getLast_name() }" />
                                            </span>
                                            <br>
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
                                        <div class="eventtableclose">
                                          <a href="<%=request.getContextPath()%>/DeleteEmploi?emploi_id=<c:out value="${list_emploi.getId() }" />">
                                            <span>
                                              <i class='bx bx-x btnclosewritelesson'></i>
                                            </span>
                                            </a>
                                        </div>
                                        <span class="title"> <c:out value="${list_emploi.getMatiere() }" /> </span>

                               <c:forEach  var="list_teacher_emploi"  items="${list_teacher_emploi}"  >
                         <c:if test="${list_emploi.getEnseig_id() eq list_teacher_emploi.getId() }">
                                     
                                        <footer>
                                            <span><c:out value="${list_teacher_emploi.getFirst_name() }" />
                                            <c:out value="${list_teacher_emploi.getLast_name() }" />
                                            </span>
                                            <br>
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
                                        <div class="eventtableclose">
                                          <a href="<%=request.getContextPath()%>/DeleteEmploi?emploi_id=<c:out value="${list_emploi.getId() }" />">
                                            <span>
                                              <i class='bx bx-x btnclosewritelesson'></i>
                                            </span>
                                            </a>
                                        </div>
                                        <span class="title"> <c:out value="${list_emploi.getMatiere() }" /> </span>

                               <c:forEach  var="list_teacher_emploi"  items="${list_teacher_emploi}"  >
                         <c:if test="${list_emploi.getEnseig_id() eq list_teacher_emploi.getId() }">
                                     
                                        <footer>
                                            <span><c:out value="${list_teacher_emploi.getFirst_name() }" />
                                            <c:out value="${list_teacher_emploi.getLast_name() }" />
                                            </span>
                                            <br>
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


 
 <div class="addevent closeadd" id="addevent">
       <div class="eventclose" id="btnclose">
                    <span>
                        <i class='bx bx-x btnclose'></i>
                    </span>
                </div>
                <form   action="<%=request.getContextPath()%>/emploiGroup" method="post">

                    <div  >
                        <div class="time" >
                            <h4 class="eventtitle"> jour :</h4>
                            <select name="day">

                                <option>Dimenche</option>
                                <option>Lundi</option>
                                <option>Mardi</option>
                                <option>Mercredi</option>
                                <option>Jeudi</option>
                            </select>
                        </div>
                        <div class="time" >
                            <h4 class="eventtitle">Temp de debut :</h4>
                            <select name="open_time">
                            
                                <option value="8 :00">8 :00</option>
                                <option value="9 :00">9 :00</option>
                                <option value="10 :00">10 :00</option>
                                <option value="11 :00">11 :00</option>
                                <option value="14 :00">14 :00</option>
                                <option value="15 :00">15 :00</option>
                                <option value="16 :00">16 :00</option>
                            </select>
                        </div>
                        <div class="matiere" >
                            <h4 class="eventtitle">Matiere :</h4>
                            <select name="matiere" id="matiere"  onchange="giveSelection(this.value)">
                             <c:forEach  items="${matieres}" var="matieres" >
                                <option value="<c:out value="${matieres}" />">
                                <c:out value="${matieres}" />
                                </option>
                                </c:forEach>
                                 
                            </select>
                           
                        </div>
                        <div class="" >
                            <h4 class="eventtitle">Salle :</h4>
                            <input type="number" required name="salle">
                        </div>
                       </div>
                      
   
                    <div>
                       <input type="hidden" value="<c:out value="${class_id}" />"  name="class_id">
                    
                        <input type="submit" value="Next" class="saveEvent">
                    </div>
                </form>
                </div>
 
<c:choose>
  <c:when test="${step==1 }">
       <style>
       .addevent{
       display:none !important;
       }
       
       </style>
    <div class="addevent3"  >
                <div class="eventclose ">
                    <span>
                   <a href="<%=request.getContextPath()%>/Showemploi"><i class='bx bx-x btnclosee'></i></a>
                    </span>
                </div>

            <div  >
            <form action="<%=request.getContextPath()%>/Showemploi" method="post">
                         <div class="Enseignant" >
                         <br>
                            <h4 class="eventtitle">Enseignant  Disponible:</h4>
                            <br>
                            <select name="Enseig" >
                            
                                  <c:forEach  items="${teacher_matiere}" var="teacher_matiere" > 
                                                  
                                <option value="<c:out value="${teacher_matiere.getId()}" />" >
                                <c:out value="${teacher_matiere.getLast_name()}" /> 
                                  <c:out value="${teacher_matiere.getFirst_name()}" />  
                                -<c:out value="${teacher_matiere.getModule()}" />
                                </option>
                                </c:forEach>
                                
                            </select>
                            <div>
                            
                        <input type="submit" value="Add" class="saveEvent">
                    </div>
                       </div>
                            </form>
                   
                        
                    </div>
                    </div>
  
  
  </c:when>
    <c:when test="${step==2 }">
      <div class="addevent2">
                <div class="eventclose">
                    <span>
                      <a href="<%=request.getContextPath()%>/Showemploi"><i class='bx bx-x btnclosee'></i></a>  
                    </span>
                </div>
                <form>

                    <div>

                        <br>
                        <c:choose>
                        <c:when test="${dispclass.equals('0') && salle.equals('0') }">
                        
                        <div class="Enseignant" >
                            <h4 > le class etudie auter matiere a ce temp et aussi     </h4>
                         <h4 >la salle qui demende est reserve    </h4>
                            
                            <br>
                            
                              <h5 > choisie un auter salle , temp svp  .   </h5>
                            
                            <br>
                           
                        </div>
                        
                        </c:when>
                        <c:when test="${dispclass.equals('0') }">
                        
                        <div class="Enseignant" >
                            <h4 > le class etudie auter matiere a ce temp    </h4>
                            <br>
                            
                              <h5 > choisie un auter temp svp  .   </h5>
                            
                            <br>
                           
                        </div>
                        
                        </c:when>
                        
                        <c:when test="${salle.equals('0') }">
                        
                         <div class="Enseignant" >
                            <h4 > la salle n'est pas disponible   </h4>
                            <br>
                            
                              <h5 > choisie une  auter salle svp .   </h5>
                            
                            <br>
                           
                        </div>
                        
                        </c:when>
                        
                         

                       
                        
          
                       </c:choose>
                       
                       
                        
                   

                    </div>

                    <div>
                      
                    </div>
                </form>
            </div>
    </c:when>
  
 
 
 </c:choose>

           <div class="change" id="addemploi">
                <a href="#"> Ajouter</a>

            </div>
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