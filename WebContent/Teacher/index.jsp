<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"    %>
        <%@ page import="Model.*" %>
        <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html  >
<head>
 <title>Smartschool</title>
  <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/mobile.css"/>" media="(max-width: 700px)">
    <link rel="stylesheet" href="<c:url value="/css/smallmobile.css"/>" media="(max-width: 390px)"></head>
    
 <script defer src="<c:url value="https://cdn.jsdelivr.net/npm/chart.js"/>"></script>
 <script defer src="<c:url value="/js/script.js"/>"></script>
  <script defer src="<c:url value="/js/mobilescreen.js"/>"></script>
         
     
<body>
 <nav class="sidebar close">

        <header>
            <div class="image-text">
                <span class="imageprofil">
                </span>
                <div class="text logo-text">

                    <a href="<%=request.getContextPath()%>/index" class="hometext"><span class="name  hovername ">Home Teacher</span></a>

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

                    <li class="nav-link  ">

                        <a href="<%=request.getContextPath()%>/Class">

                            <i class='bx bx-grid icon '></i>

                            <span class="text nav-text ">Schedule</span>

                        </a>

                    </li>


                    <li class="nav-link ">

                        <a href="class.html">

                            <i class='bx bx-copy icon '></i>

                            <span class="text nav-text ">Class</span>

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



    <section class="home">
        <div class="headermobile">
            <i class='bx bx-menu togglemenu'></i>

            <div class="text texthome">DashBoard</div>
        </div>
        <!-- <i class='bx bx-menu togglemenu'></i>

        <div class="text texthome">DashBoard</div> -->
        <div class="mainindex">
            <div class="etud1">
                <h2>1 AS</h2>

                <div class="contentStatistics">
                    <div class="absencesanddelay">
                        <canvas id="myChart"></canvas>
                        <h4>Absences And Delay</h4>

                    </div>
                    <div class="resultnote" id="chartnote">
                        <canvas id="myChart2"></canvas>
                        <h4>The Result in this Semester</h4>

                    </div>
                </div>

            </div>

            <div class="etud1">
                <h2>2 AS</h2>

                <div class="contentStatistics">
                    <div class="absencesanddelay">
                        <canvas id="myChart"></canvas>
                        <h4>Absences And Delay</h4>
                    </div>
                    <div class="resultnote" id="chartnote">
                        <canvas id="myChart2"></canvas>
                        <h4>The Result in this Semester</h4>

                    </div>
                </div>

            </div>
            <div class="etud1">
                <h2>3 AS</h2>

                <div class="contentStatistics">
                    <div class="absencesanddelay">
                        <canvas id="myChart"></canvas>
                        <h4>Absences And Delay</h4>
                    </div>
                    <div class="resultnote" id="chartnote">
                        <canvas id="myChart2"></canvas>
                        <h4>The Result in this Semester</h4>

                    </div>
                </div>

            </div>


        </div>

    </section>

    <script>
        //    deseign for mobile screen
        /*
         *
         *
         *
         *
         */

        const menu = document.querySelector(".togglemenu");
        const deletemenu = document.querySelector(".togglemenu2");

        const sidbarmobile = document.querySelector("nav");
        menu.addEventListener("click", (eo) => {

            if (sidebar.className == "sidebar close") {
                sidebar.classList.add("close2");
            } else if (sidebar.className == "sidebar close close2") {
                sidebar.classList.remove("close2");
            }


        })
        deletemenu.addEventListener("click", (eo) => {
            sidebar.classList.remove("close2");

        })
    </script>


</body>
</html>