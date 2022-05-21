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
<link rel="stylesheet" href="<c:url value="/css/homese.css"/>">
<link rel="stylesheet" href="<c:url value="/css/iscri.css"/>">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
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
                    <a href="login.html">
                        <i class='bx bx-log-out icon' ></i>
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



    <section class="home hometextbool">
        <div class="headermobile">
            <i class='bx bx-menu togglemenu'></i>

            <div class="text texthome">1AS-G1</div>
        </div>


        <div class="titlenote">
            <a href="homeadmine.html" class="btnleft"> <i class='bx bx-arrow-back' ></i>
            </a>
            <span>
               Enseigent
            </span>
        </div>
        <div class="contentnotes liststudent">
            <table class="student-table">
                <thead>
                    <tr>
      <th>
        <input type="text" class="search-input" placeholder="nome">
      </th>
      <th>
        <input type="text" class="search-input" placeholder="prenom">
      </th>
      <th>
        <input type="date" class="search-input" placeholder="date naissonce">
      </th>
      <th>
        <input type="number" class="search-input" placeholder="numéro">
      </th>
      <th>
        <input type="email" class="search-input" placeholder="eamil">
      </th>
      
    </tr>
                </thead>
                <tbody>
                          <c:forEach  var="listTeacher"  items="${listTeacher}"  >
                    <tr class="student">
                       
                        <td><c:out value="${listTeacher.getFirst_name()}" /></span></td>
                        <td><c:out value="${listTeacher.getLast_name() }" /></span></td>
                         
                        <td><c:out value="${listTeacher. getEmail()}" /></span> </td>
                        <td><c:out value="${listTeacher.getDate_birth() }" /></span></td>
                         <td><c:out value="${listTeacher.getContact_number()}" /></span></td>
                        
                                            
                        <td> <a href="#" class="edite "><i class='bx bx-edit-alt'></i></a></td>
                        <td> <a href="#" class="edite activeedite"><i class='bx bx-message-square-x'></i></a></td>

                    </tr>
                     </c:forEach>
                   

                </tbody>
            </table>
        </div>
    </section>

</body>
</html>