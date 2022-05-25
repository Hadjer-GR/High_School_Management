<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"    %>
        <%@ page import="Model.*" %>
        <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html  >
<head>
 <title>Smartschool</title>
 <meta name="viewport" content="width=device-width,initial-scale=1">
 
 <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/mobile.css"/>" media="(max-width: 880px)">
    <link rel="stylesheet" href="<c:url value="/css/smallmobile.css"/>" media="(max-width: 390px)">
      <link rel="stylesheet" href="<c:url value="/cssadmin/admin.css"/>" >
        <link rel="stylesheet" href="<c:url value="/cssadmin/adminmobile.css"/>" media="(max-width: 880px)">
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

                    <li class="nav-link  ">

                        <a href="<%=request.getContextPath()%>/emploi">

                            <i class='bx bx-grid icon  '></i>

                            <span class="text nav-text ">Emploi de temp</span>

                        </a>

                    </li>


                    <li class="nav-link  hover">

                        <a href="<%=request.getContextPath()%>/addTeacher">

                            <i class='bx bx-copy icon  texthover'></i>

                            <span class="text nav-text texthover">Ajoute un compte</span>

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
    <section class="home homeprofile  containerAccount">
        <div class="headermobile">
            <i class='bx bx-menu togglemenu'></i>
            <div class="text texthome"> un compte</div>

        </div>
        <div class="container  containerAccount">
            <div class="title">Ajoute un Enseignant</div>
            <div class="content">
                <form method="post" action="<%=request.getContextPath()%>/addTeacher">




                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Nom </span>
                            <input type="text" required name="name">
                        </div>
                        <div class="input-box">
                            <span class="details">Prenom </span>
                            <input type="text" required name="prenom">
                        </div>
                        <div class="input-box">
                            <span class="details">Date de naissance </span>
                            <input type="text" required name="date">
                        </div>
                        <div class="input-box">
                            <span class="details">email </span>
                            <input type="text" required name="email">
                        </div>
                        <div class="input-box">
                            <span class="details">Numéro de Contact</span>
                            <input type="text" required name="numero">
                        </div>
                        <div class="input-box">
                            <span class="details">Specialiste</span>
                            <input type="text" required name="modul">
                        </div>
                        <div class="input-box">
                            <span class="details">Nom d'utilisateur</span>
                            <input type="text" required name="username">
                        </div>
                        <div class="input-box">
                            <span class="details">mote de passe</span>
                            <input type="text" required name="password">
                        </div>


                    </div>

                    <div class="button">
                        <input type="submit" value="Ajoute">
                    </div>
                </form>
            </div>

        </div>
        <div class="change">
            <a href="<%=request.getContextPath()%>/addSecretaire"> Ajouter une Secretaire</a>

        </div>
    </section>
</body>
</html>