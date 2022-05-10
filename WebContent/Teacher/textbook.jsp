<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"    %>
        <%@ page import="Model.*" %>
        <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html  >
<head>
<meta charset="UTF-8">
<title>textBook</title>
  <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>

  <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/mobile.css"/>" media="(max-width: 700px)">
    <link rel="stylesheet" href="<c:url value="/css/smallmobile.css"/>" media="(max-width: 390px)">
    <script defer src="etud.js"> </script>

    <script defer src="<c:url value="/js/mobilescreen.js"/>"></script>
    <script defer src="<c:url value="/js/script.js"/>"></script>
    <script defer src="<c:url value="/js/textbook.js"/>"></script>
    <script defer src="<c:url value="/ckeditor/ckeditor.js"/>"></script>
    <script defer src="<c:url value="/js/writeinTextbook.js"/>"></script>
    <script defer src="<c:url value="/js/writetextbook.js"/>"></script>
</head>
<body>
  <nav class="sidebar close">

        <header>

            <div class="image-text">

                <span class="imageprofil">
              

                </span>



                <div class="text logo-text">

                    <a href="/index.html" class="hometext"><span class="name ">Home Teacher</span></a>

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

                        <a href="/appele.html">

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



    <section class="home hometextbool">
        <div class="headermobile">
            <i class='bx bx-menu togglemenu'></i>

            <div class="text texthome">1AS-G1</div>
        </div>


        <div class="titlenote">
            <a href="/Etud1.html" class="btnleft"> <i class='bx bx-reply'></i>
            </a>
            <span>
                Text Book
            </span>
        </div>
        <div class="contentnotes">

            <div class="modeles" id="othermodel">
                <a href="<c:url value="/listLesson?module=math"/>" class="math hover"> Math</a>
                <br>

                <a href="textbook/physique.jsp" class="physique"> Physique</a>
                <br>

                <a href="science.jsp" class="science"> Science</a>
                <br>
                <a href="sport.jsp" class="sport"> Sport</a>
                <br>



                <a href="sport2.jsp" class="sport2"> Sport 2</a>
                <br>

                <a href="arabic.jsp" class="arabic"> Arabic</a>
                <br>

                <a href="french.jsp" class="french"> French</a>
                <br>

                <a href="english.jsp" class="english"> English</a>
                <br>


                <a href="#" class="islamia"> islamia</a>
            </div>
            <div class="resulttext" id="contentmodel">
                    
<%  request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");%>
                <div class="contentlesson">

               <c:forEach  items="${listlesson}" var="listlesson" >

                    <div class="lesson" dir="rtl">
                        <span> <c:out value="${listlesson.getDate() }" /></span>
           <br>
           <br>
                        
                        <div class="LessonText"    dir="rtl" >
                       <c:out value="${listlesson.getText() }" escapeXml="false" />
                         </div>
                       
                          
                        <div>
                         
                     
                            <a href="<%=request.getContextPath()%>/editelesson?id=<c:out value="${listlesson.getId()}" />"> <i class='bx bx-edit'></i></a>
                            <a href="<%=request.getContextPath()%>/deleteLesson?id=<c:out value="${listlesson.getId()}" />"><i class='bx bx-trash'></i></a>
                     
                       </div>
                    </div>
                     </c:forEach>
                </div>
                <div class="addlesson">
                    <a href="#" class="btnaddleson"> <i class='bx bx-book-add'></i> Add Lesson</a>
                </div>
            </div>
            <div class="makeposte">
                <div class="closewritelesson">
                    <span>
                        <i class='bx bx-x btnclosewritelesson'></i>
                    </span>
                </div>
                <form action="<c:url value="/addLesson?module=math"/>" method="post">
                    <textarea cols="60" rows="60" placeholder="ContentLesson" class="Advertise"
                        name="contentleson"  required></textarea>
                    <input type="submit" value=" + Add Lesson" class="published">
                </form>

            </div>












        </div>

    </section>





</body>
</html>