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

            <div class="text texthome">1AS-G1</div>
        </div>


        <div class="titlenote">
            <a href="/Etud1.html" class="btnleft"> <i class='bx bx-reply'></i>
            </a>
            <span>
                Student
            </span>
        </div>
        <div class="contentnotes liststudent">
              <table class="student-table">
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Prenom</th>
                        <th>evalution</th>
                        <th>devoir-1</th>
                        <th>devoir-2</th>
                        <th>Control </th>
                        <th>mouyene </th>
                        <th>update </th>

                    </tr>
                </thead>

                <tbody>

                    <tr class="student">

                            <td>Ghrab</td>
                            <td>hadjer</td>
                            <td><input type="number" name="evalution" value="15" class="setresult">
                            </td>
                            <td><input type="number" name="devoir-1" value="15" class="setresult"></td>
                            <td><input type="number" name="devoir-2" value="15" class="setresult"></td>
                            <td><input type="number" name="control" value="15" class="setresult"></td>
                            <td><input type="number" name="mouyenne" value="15" class="setresult"></td>
                            <td>
                                <a href="#" class="edite">Save</a>
                            </td>
                        

                    </tr>
                    
                    <tr class="student active-row">
                    
                            <td>Ghrab</td>
                            <td>Wissal</td>
                            <td><input type="number" name="evalution" value="15" class="setresult">
                            </td>
                            <td><input type="number" name="devoir-1" value="15" class="setresult"></td>
                            <td><input type="number" name="devoir-2" value="15" class="setresult"></td>
                            <td><input type="number" name="control" value="15" class="setresult"></td>
                            <td><input type="number" name="mouyenne" value="15" class="setresult"></td>
                            <td>    <a href="#" class="edite">Save</a>

                        </td>
                             
                    </tr>
                </tbody>

            </table>
           
           
        </div>
    </section>


</body>
</html>