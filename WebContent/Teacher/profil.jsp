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
 <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mobile.css" media="(max-width: 700px)">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/smallmobile.css" media="(max-width: 390px)">
    
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
                <span   class="imageprofil" >
                  
                </span>



                <div class="text logo-text">

                    <a href="<%=request.getContextPath()%>/index" class="hometext"><span class="name ">Accueil </span></a>

                    <a href="<%=request.getContextPath()%>/Teacherprofil" class="username "> <span class="profession hoverusername">
                            Nom Prenom</span>
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

                        <a href="<%=request.getContextPath()%>/Schedule">

                            <i class='bx bx-grid icon '></i>

                            <span class="text nav-text ">Programme</span>

                        </a>

                    </li>
                    <li class="nav-link">

                        <a href="<%=request.getContextPath()%>/Groupes">

                            <i class='bx bx-home-alt icon'></i>

                            <span class="text nav-text">Class</span>

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
    <section class="home homeprofile">
        <div class="headermobile">
            <i class='bx bx-menu togglemenu'></i>
            <div class="text texthome"> Profil</div>

        </div>
        <div class="container containerprofil">
            <div class="title">Account Information</div>
            <div class="content">
                <form  action="UpdateTeacher"  method="post" enctype="multipart/form-data">
                    <div class="editepicture">
                        <label for="file"> <i class='bx bx-face'></i>Update picture</label>
                        <input type="file" id="file" name="file">
                        <a href="#" class="delete"><i class='bx bx-trash'></i>Delete Picture </a>
                    </div>
                    <div class="picture">
                        <div class="img">
                        </div>
                        <div class="editepicturemobile">
                            <label for="file"> <i class='bx bx-face'></i>Update picture</label>
                            <input type="file" id="file" name="file">
                            <a href="#" class="delete"><i class='bx bx-trash'></i>Delete Picture </a>
                        </div>
                    </div>


                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">First Name</span>
                            <input type="text" name="first_name" required value="<c:out value='${teacher.getFirst_name() }'/>" >
                        </div>
                        <div class="input-box">
                            <span class="details">Last Name</span>
                            <input type="text" name="last_name" required value="<c:out value='${teacher.getLast_name() }'/>" >
                        </div>
                        <div class="input-box">
                            <span class="details">Email</span>
                            <input type="text" name="email" required value="<c:out value='${teacher.getEmail() }'/>" >
                        </div>
                        <div class="input-box">
                            <span class="details">Contact Number</span>
                            <input type="text"  name="contact_number" required value="<c:out value='${teacher.getContact_number() }'/>" >
                        </div>
                        <div class="input-box">
                            <span class="details">User Name</span>
                            <input type="text" name="username" required value="<c:out value='${account.getUsername() }'/>" >
                        </div>
                        <div class="input-box">
                            <span class="details">Password</span>
                            <input type="text"  name="password" required value="<c:out value='${account.getPassword() }'/>" >
                        </div>


                    </div>

                    <div class="button">
                        <input type="submit" value="Save">
                    </div>
                </form>
            </div>
        </div>
        
    </section>


</body>
</html>