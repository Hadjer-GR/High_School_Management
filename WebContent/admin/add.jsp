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


  <link rel="stylesheet" href="${pageContext.request.contextPath }/cssadmin/add.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
   </head>
      
    
</head>
<body>
  <nav class="sidebar close">
        <header>
            <div class="image-text">
                <span class="image">
                  <img src="C:\Users\heith\Downloads\logo.jpg" >
                </span>

                <div class="text logo-text">
                    <span class="name">HOME ADMIN</span>
                    <span class="profession">My smart school</span>
                </div>
            </div>

            <i class='bx bx-chevron-right toggle'></i>
        </header>

        <div class="menu-bar">
            <div class="menu">

                <li class="search-box">
                    <i class='bx bx-search icon'></i>
                    <input type="text" placeholder="Search...">
                </li>

                <ul class="menu-links">
                    <li class="nav-link">
                        <a href="add.html">
                          <i class='bx bx-add-to-queue icon'></i>
                            <span class="text nav-text">Add profiles</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="modification.html">
                            <i class='bx bxs-magic-wand icon'></i>
                            <span class="text nav-text">modification</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="temps.html">
                            <i class='bx bx-pie-chart-alt icon' ></i>
                            <span class="text nav-text">Emploi du temps</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="resserce">
                           <i class='bx bx-cog icon' ></i>
                            <span class="text nav-text">les resserce</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="annonce.html">
                           <i class='bx bxs-edit bx-tada icon' ></i>
                            <span class="text nav-text">les Anonses</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="notifications.html">
                            <i class='bx bx-bell bx-tada icon' ></i>
                            <span class="text nav-text">notifications</span>
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


    <section class="home">
        <div class="text">Dashboard Sidebar</div>
        <div class="container">
    <input type="checkbox" id="flip">
    <div class="cover">
      <div class="front">
        <img src="C:\Users\heith\Downloads\teacher1.png" alt="">
        <div class="text">
          <span class="text-1"> <br> </span>
          <span class="text-2"></span>
        </div>
      </div>
      <div class="back">
        <img class="backImg" src="C:\Users\heith\Downloads\se.png" alt="">
        <div class="text">
          <span class="text-1">Complete miles of journey <br> with one step</span>
          <span class="text-2">Let's get started</span>
        </div>
      </div>
    </div>
    <div class="forms">
        <div class="form-content">
          <div class="login-form">
            <div class="title">Add Teacher</div>
          <form  method="post" action="<%=request.getContextPath()%>/addTeacher" >
            <div class="input-boxes">
              <div class="input-box">
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Enter nom " required name="name">
              </div>
              <div class="input-box">
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Enter prenom" required name="prenom">
              </div>
              <div class="input-box">
                <i class="fas fa-envelope"></i>
                <input type="text" placeholder="Enter  email" required name="email">
              </div>
              <div class="input-box">
               <i class="fas fa-calendar-alt"></i>
                <input type="date" placeholder="date de naissonce" required name="date">
              </div>
                <div class="input-box">
                <i class="fas fa-phone-alt"></i>
                <input type="number" placeholder=" numero du tél" required  name="numero">
              </div>
               <div class="input-box">
                <i class="fas fa-phone-alt"></i>
                <input type="text" placeholder=" modul" required  name="modul">
              </div>
                <div class="input-box">
                <i class="fas fa-user-lock"></i>
                <input type="text" placeholder="username" required name="usernam">
              </div>
              <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Entre modepass" required name="modepass">
              </div>
            
              
              <div class="button input-box">
                <input type="submit" value="Sumbit">
              </div>
              <div class="text sign-up-text">Don't have an account? <label for="flip">Sigup now</label></div>
            </div>
            </form>
            </div>
        <div class="signup-form">
          <div class="title">add secraitair</div>
        <form  method="post" action="<%=request.getContextPath()%>/addSecretaire" >
           <div class="input-boxes">
              <div class="input-box">
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Enter nom " required name="nom">
              </div>
              <div class="input-box">
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Enter prenom" required name="prenom">
              </div>
              <div class="input-box">
                <i class="fas fa-envelope"></i>
                <input type="text" placeholder="Enter  email" required name="email">
              </div>
              <div class="input-box">
               <i class="fas fa-calendar-alt"></i>
                <input type="date" placeholder="date de naissonce" required name="date">
              </div>
                <div class="input-box">
                <i class="fas fa-phone-alt"></i>
                <input type="number" placeholder=" numero du tél" required  name="numero">
              </div>
              <div class="input-box">
                <i class="fas fa-user-lock"></i>
                <input type="text" placeholder="username" required name="username">
              </div>
              <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Entre modepass" required name="password">
              </div>
              <div class="button input-box">
                <input type="submit" value="Sumbit">
              </div>
              <div class="text sign-up-text">Already have an account? <label for="flip">Login now</label></div>
            </div>
      </form>
    
       
    </div>
    </div>
    </div>
  </div>
    </section>

    <script>
        const body = document.querySelector('body'),
      sidebar = body.querySelector('nav'),
      toggle = body.querySelector(".toggle"),
      searchBtn = body.querySelector(".search-box"),
      modeSwitch = body.querySelector(".toggle-switch"),
      modeText = body.querySelector(".mode-text");


toggle.addEventListener("click" , () =>{
    sidebar.classList.toggle("close");
})

searchBtn.addEventListener("click" , () =>{
    sidebar.classList.remove("close");
})

modeSwitch.addEventListener("click" , () =>{
    body.classList.toggle("dark");
    
    if(body.classList.contains("dark")){
        modeText.innerText = "Light mode";
    }else{
        modeText.innerText = "Dark mode";
        
    }
});
    </script>


</body>
</html>