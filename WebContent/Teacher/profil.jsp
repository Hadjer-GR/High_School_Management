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

  <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/mobile.css"/>" media="(max-width: 700px)">
    <link rel="stylesheet" href="<c:url value="/css/smallmobile.css"/>" media="(max-width: 390px)">
   
</head>
 <script defer src="<c:url value="js/script.js"/>"></script>
    <script defer src="<c:url value="js/profil.js"/>"></script>
        <script defer src="<c:url value="/js/mobilescreen.js"/>"></script>

<body>



    <nav class="sidebar close">

        <header>

            <div class="image-text">
                <span class="imageprofil" >
                  
                </span>



                <div class="text logo-text">

                    <a href="<%=request.getContextPath()%>/index" class="hometext"><span class="name ">Home Teacher</span></a>

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

                        <a href="<%=request.getContextPath()%>/Class">

                            <i class='bx bx-grid icon '></i>

                            <span class="text nav-text ">Schedule</span>

                        </a>

                    </li>
                    <li class="nav-link">

                        <a href="<%=request.getContextPath()%>/Class">

                            <i class='bx bx-home-alt icon'></i>

                            <span class="text nav-text">Class</span>

                        </a>

                    </li>



                    <li class="nav-link">

                        <a href="/appele.html">

                            <i class='bx bx-credit-card-front icon'></i>

                            <span class="text nav-text">Verre Appele</span>

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