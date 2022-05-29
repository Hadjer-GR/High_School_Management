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


  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mobile.css" media="(max-width: 700px)">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/smallmobile.css" media="(max-width: 390px)">
    
    <style>
    
    .content form .picture .img ,.sidebar header .imageprofil{
      background-image: url("../img/profilimg.jpg");

    }
    
    
    
    
    
    
    </style>
    
    
   <script  defer type="text/javascript"   src="${pageContext.request.contextPath}/js/script.js"></script>
    <script defer type="text/javascript"  src="${pageContext.request.contextPath}/js/mobilescreen.js"></script>
    
    <script defer src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
    <script defer src="${pageContext.request.contextPath}/js/writeinTextbook.js"></script>
    <script defer src="${pageContext.request.contextPath}/js/writetextbook.js"></script>
    </head>
<body>
  <nav class="sidebar close">

        <header>

            <div class="image-text">

                <span class="imageprofil">
              

                </span>



                <div class="text logo-text">

                    <a href="<%=request.getContextPath()%>/index" class="hometext"><span class="name ">Accueil </span></a>

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

                            <span class="text nav-text texthover">Class</span>

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



    <section class="home hometextbool">
        <div class="headermobile">
            <i class='bx bx-menu togglemenu'></i>

            <div class="text texthome"><c:out value="${groupe.getId_niveau()}" />AS-G <c:out value="${groupe.getNbr_class()}" /></div>
        </div>
       <br/>



        <div class="titlenote">
            <a href="<%=request.getContextPath()%>/ShowClass?class_id=<c:out value="${groupe.getId()}" />" class="btnleft"> <i class='bx bx-reply'></i>
            </a>
            <span>
               Cahier de Text 
            </span>
        </div>
        <div class="contentnotes">

            <div class="modeles" id="othermodel">
                <a href="<c:url value="/listLesson?module=math"/>" class="math hover"> <c:out value="${matier_name }" /></a>
                
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
                         
                     
                            <a href="<%=request.getContextPath()%>/editeLesson?id=<c:out value="${listlesson.getId()}" />"> <i class='bx bx-edit'></i></a>
                            <a href="<%=request.getContextPath()%>/deleteLesson?id=<c:out value="${listlesson.getId()}" />"><i class='bx bx-trash'></i></a>
                     
                       </div>
                    </div>
                     </c:forEach>
                </div>
                <div class="addlesson">
                    <a href="#" class="btnaddleson"> <i class='bx bx-book-add'></i> ajouter une leçon</a>
                </div>
            </div>
                        <c:if test="${lesson != null}">
                        
                         <div style="display:block;" class="makeposte">
                          <div class="closewritelesson">
                    <span>
                     <a href="<%=request.getContextPath()%>/listLesson">
                     <i class='bx bx-x btnclosewritelesson'></i>  
                     </a> 
                    </span>
                </div>
                <form action="<%=request.getContextPath()%>/editeLesson" method="post">
       
                         <textarea cols="60" rows="60" placeholder="ContentLesson" class="Advertise"
                        name="contentleson"  required><c:out value="${lesson.getText()  }"/></textarea>
                        <input  name="id" type="number" value="<c:out value="${lesson.getId()}"/>" style="display:none"   />
                    <input type="submit" value=" enregistrer la leçon" class="published">
                </form>
                
                

            </div>
                        
                        </c:if>
          <c:if test="${lesson == null}">
            
            <div class="makeposte">
            
                <div class="closewritelesson">
                    <span>
                        <i class='bx bx-x btnclosewritelesson'></i>
                    </span>
                </div>
                <form action="<%=request.getContextPath()%>/cahier" method="post">
                    <textarea cols="60" rows="60" placeholder="ContentLesson" class="Advertise"
                        name="contentleson"  required></textarea>
                    <input type="submit" value=" + ajouter une leçon" class="published">
                </form>
                
                

            </div>
             </c:if>
            
             
              










        </div>

    </section>





</body>
</html>