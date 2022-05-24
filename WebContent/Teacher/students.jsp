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
        <script defer src="${pageContext.request.contextPath}/js/list.js"></script>
      <script defer src="${pageContext.request.contextPath}/js/studentlist.js"></script>
        
    
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





    <section class="home hometextbool">
         <div class="headermobile">
            <i class='bx bx-menu togglemenu'></i>

            <div class="text texthome"><c:out value="${groupe.getId_niveau()}" />AS-G <c:out value="${groupe.getNbr_class()}" /></div>
        </div>


        <div class="titlenote">
            <a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${groupe.getId()}" />" class="btnleft"> <i class='bx bx-reply'></i>
            </a>
            <span>
                Student
            </span>
        </div>
        <div class="contentnotes liststudent">
           
             <div class="rTable" id="studentList">
                <div class="rTableRow headtable">
                    <div class="rTableHead"><strong>Nom</strong></div>
                    <div class="rTableHead"><strong>Prenom</strong></div>
                    <div class="rTableHead"><strong>Evalution</strong></div>
                    <div class="rTableHead"><strong> Devoir-1</strong></div>
                    <div class="rTableHead"><strong> Devoir-2</strong></div>
                    <div class="rTableHead"><strong> Control</strong></div>
                    <div class="rTableHead"><strong>Mouyenne</strong></div>
                    <div class="rTableHead"><strong> &nbsp;</strong></div>

                    <div class="rTableHead"><strong> Update</strong></div>




                </div>
                
       <%   int nbr_edtud=1; %>
                
                         <c:forEach  var="student_resulte"  items="${student_resulte}"  >
                          <% if(nbr_edtud==0){
                                
                                    %>
                
                <form class="rTableRow"  action="<%=request.getContextPath()%>/StudentList" method="post">
                    <!--<div class="rTableRow activeedite">-->

                    <div class="rTableCell"><c:out value="${student_resulte.getLast_name() }" />
                        <input type="hidden" name="nom" value="<c:out value="${list_student.getLast_name() }" />" class="setresult">

                    </div>
                    <div class="rTableCell"><c:out value="${student_resulte.getFirst_name() }" />
                        <input type="hidden" name="prenom" value="<c:out value="${student_resultet.getFirst_name() }" />" class="setresult">

                    </div>
                    <div class="rTableCell">
                        <input type="number" name="evalution" value="<c:out value="${student_resulte.getEvalution() }" />" class="setresult">
                    </div>
                    <div class="rTableCell">
                        <input type="number" name="devoir-1" value="<c:out value="${student_resulte.getDevoir_1() }" />" class="setresult">
                    </div>
                    <div class="rTableCell">
                        <input type="number" name="devoir-2" value="<c:out value="${student_resulte.getDevoir_2() }" />" class="setresult">
                    </div>
                    <div class="rTableCell">
                        <input type="number" name="control" value="<c:out value="${student_resulte.getControl() }" />" class="setresult">
                    </div>
                    <div class="rTableCell">
                        <input type="number" name="mouyenne" value="<c:out value="${student_resulte.getMouyenne() }" />" class="setresult">
                    </div>
                    <div class="rTableCell">
                        <input type="hidden" name="id" value="<c:out value="${student_resulte.getEleve_id() }" />" class="setresult">
                    </div>
                    <div class="rTableCell">
                        <input type="Submit" value="Save" class="edite ">
                    </div>


                </form>
                                               <% }   else{ %>
                                               
                                               
                                               
                                                <form class="rTableRow activeedite"  action="<%=request.getContextPath()%>/StudentList" method="post">
                    <!--<div class="rTableRow activeedite">-->

                    <div class="rTableCell"><c:out value="${student_resulte.getLast_name() }" />
                        <input type="hidden" name="nom" value="<c:out value="${student_resulte.getLast_name() }" />" class="setresult">

                    </div>
                    <div class="rTableCell"><c:out value="${student_resulte.getFirst_name() }" />
                        <input type="hidden" name="prenom" value="<c:out value="${student_resulte.getFirst_name() }" />" class="setresult">

                    </div>
                  
                    <div class="rTableCell">
                        <input type="number" name="evalution" value="<c:out value="${student_resulte.getEvalution() }" />" class="setresult">
                    </div>
                    <div class="rTableCell">
                        <input type="number" name="devoir-1" value="<c:out value="${student_resulte.getDevoir_1() }" />" class="setresult">
                    </div>
                    <div class="rTableCell">
                        <input type="number" name="devoir-2" value="<c:out value="${student_resulte.getDevoir_2() }" />" class="setresult">
                    </div>
                    <div class="rTableCell">
                        <input type="number" name="control" value="<c:out value="${student_resulte.getControl() }" />" class="setresult">
                    </div>
                    <div class="rTableCell">
                        <input type="number" name="mouyenne" value="<c:out value="${student_resulte.getMouyenne() }" />" class="setresult">
                    </div>
                    <div class="rTableCell">
                        <input type="hidden" name="id" value="<c:out value="${student_resulte.getEleve_id() }" />" class="setresult">
                    </div>
                    <div class="rTableCell">
                        <input type="Submit" value="Save" class="edite ">
                    </div>


                </form>
                                               
                                               
                                               <%  
                                               
                                               nbr_edtud=nbr_edtud-1;
                                               
                                               } %>
                
                
                </c:forEach>
                
              

            </div>
          

        </div>

                   
           
       
    </section>


</body>
</html>