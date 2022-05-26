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
       
                    
   
       <script  defer type="text/javascript"   src="${pageContext.request.contextPath}/js/script.js"></script>
         <script defer type="text/javascript"  src="${pageContext.request.contextPath}/js/mobilescreen.js"></script>
            <script  defer type="text/javascript"   src="${pageContext.request.contextPath}/jsAdmin/main.js"></script>
    
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


            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="row day-columns">
                            <div class="day-column">
                                <div class="day-header">Dimenche</div>
                                <div class="day-content">
                                    <div class="event gray">
                                        <div class="eventtableclose">
                                            <span>
                                                <a href="#"><i class='bx bx-x btnclosewritelesson'></i></a>
                                            </span>
                                        </div>
                                        <span class="title"> Math </span>


                                        <footer>
                                            <span> GHRAB RANIA</span>
                                            <br>
                                            <span>8:00</span>
                                        </footer>
                                        <span class="title"> S: 5 </span>

                                    </div>


                                </div>
                            </div>
                            <div class="day-column">
                                <div class="day-header">Lundi</div>
                                <div class="day-content">

                                </div>
                            </div>
                            <div class="day-column">
                                <div class="day-header">Mardi</div>
                                <div class="day-content">

                                </div>
                            </div>
                            <div class="day-column">
                                <div class="day-header">Mercredi</div>
                                <div class="day-content">


                                </div>
                            </div>
                            <div class="day-column">
                                <div class="day-header">Jeudi</div>
                                <div class="day-content">



                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>

 
 <div class="addevent">
       <div class="eventclose">
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

                        <div class="Enseignant" name="Ensei">
                            <h4 > la salle n'est pas disponible   </h4>
                            <br>
                            
                              <h5 > choisie une  auter salle svp .   </h5>
                            
                            <br>
                           
                        </div>

                    </div>

                    <div>
                      
                    </div>
                </form>
            </div>
    </c:when>
  
 
 
 </c:choose>

           
    </section>
   
  

<script>

const addevent = document.querySelector(".addevent");
const addevent2 = document.querySelector(".addevent2");

const btnclose = document.querySelector(".btnclose");
const container = document.querySelector(".container");
const btnclosee = document.querySelector(".btnclosee");
console.log(btnclosee);
/*
btnclosee.addEventListener("click", () => {
  addevent2.classList.add("closeevent2");
});
*/
btnclose.addEventListener("click", (eo) => {
  addevent.classList.add("closeadd");
});
container.addEventListener("click", (eo) => {
  switch (eo.target.parentElement.className) {
    case "eventtableclose":
      addevent.classList.add("closeadd");

      break;
    case "event gray":
      addevent.classList.add("closeadd");

      break;
    default:
      addevent.classList.remove("closeadd");

      break;
  }
});


</script>

</body>
</html>