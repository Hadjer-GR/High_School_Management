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
      <link rel="stylesheet" href="<c:url value="/css/class.css"/>">
    
</head>
 <script defer src="<c:url value="/js/script.js"/>"></script>
     <script defer src="<c:url value="/js/mobilescreen.js"/>"></script>
<body>
   <nav class="sidebar close">
        <header>

            <div class="image-text">

                <span class="imageprofil">


                </span>



                <div class="text logo-text">

                    <a href="/index.html" class="hometext"><span class="name   ">Home Teacher</span></a>

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



                <ul class="menu-links ">
                    <li class="nav-link ">

                        <a href="/schedule.html">

                            <i class='bx bx-grid icon'></i>

                            <span class="text nav-text ">Schedule</span>

                        </a>

                    </li>


                    <li class="nav-link hover">

                        <a href="class.html">

                            <i class='bx bx-copy icon  texthover'></i>

                            <span class="text nav-text texthover">Class</span>

                        </a>

                    </li>



                    <li class="nav-link ">

                        <a href="appele.html">

                            <i class='bx bx-credit-card-front icon'></i>

                            <span class="text nav-text ">Verre Appele</span>

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

    <section class="home homeprofil">
        <div class="headermobile">
            <i class='bx bx-menu togglemenu'></i>
            <div class="text texthome"> Class</div>

        </div>
        <div class="container">
            <h1 class="level-1 rectangle">اولى ثانوي</h1>
            <ol class="level-2-wrapper">
                <li>
                    <h2 class="level-2 rectangle">علمي </h2>
                    <ol class="level-3-wrapper">
                        <li>

                            <ol class="level-4-wrapper">
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>

                            </ol>

                        </li>
                        <li>

                            <ol class="level-4-wrapper">
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 2</a></h4>
                                </li>

                            </ol>
                        </li>
                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">ادبي </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>

                            </ol>
                        </li>
                        <li>
                            <ol class="level-4-wrapper">
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#">G 2</a></h4>
                                </li>


                            </ol>
                        </li>
                    </ol>
                </li>
            </ol>
        </div>

        <div class="container container2as">
            <h1 class="level-1 rectangle">ثانية ثانوي</h1>
            <ol class="level-2-wrapper">
                <li>
                    <h2 class="level-2 rectangle">علوم </h2>
                    <ol class="level-3-wrapper">
                        <li>

                            <ol class="level-4-wrapper">
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">رياضيات </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">تسير و اقتصاد </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">هندسة مدنية </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 2</a></h4>
                                </li>
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 3</a></h4>
                                </li>

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">هندسة طرائق </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 2</a></h4>
                                </li>
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 3</a></h4>
                                </li>

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">هندسة كهربائية </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">

                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>
                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">اداب </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">

                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>
                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">لغات </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">

                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>
                            </ol>
                        </li>

                    </ol>
                </li>
            </ol>
        </div>

        <div class="container container2as">
            <h1 class="level-1 rectangle">ثالثة ثانوي</h1>
            <ol class="level-2-wrapper">
                <li>
                    <h2 class="level-2 rectangle">علوم </h2>
                    <ol class="level-3-wrapper">
                        <li>

                            <ol class="level-4-wrapper">
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">رياضيات </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">تسير و اقتصاد </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">هندسة مدنية </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 2</a></h4>
                                </li>
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 3</a></h4>
                                </li>

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">هندسة طرائق </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 2</a></h4>
                                </li>
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 3</a></h4>
                                </li>

                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">هندسة كهربائية </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">

                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>
                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">اداب </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">

                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>
                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"> G 1</a></h4>
                                </li>
                            </ol>
                        </li>

                    </ol>
                </li>
                <li>
                    <h2 class="level-2 rectangle">لغات </h2>
                    <ol class="level-3-wrapper">
                        <li>
                            <ol class="level-4-wrapper">

                                <li>
                                    <h4 class="level-4 rectangle"><a href="#"><i class='bx bx-x'></i></a></i>
                                    </h4>
                                </li>
                            </ol>
                        </li>

                    </ol>
                </li>
            </ol>
        </div>








    </section>
</body>

</html>