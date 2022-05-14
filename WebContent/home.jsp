<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"    %>
        <%@ page import="Model.*" %>
        <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html  >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">

  <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>

    <link rel="stylesheet" href="css/login.css">
    <script defer src="js/script.js"></script>
    <script defer src="js/mobilescreen.js"></script>
    <script defer src="js/app.js"></script>
    <script defer src="js/loginfile.js"></script>
    
<title>MySmartSchool</title>
</head>
<body>
<div class="container">
        <div class="forms-container">
            <div class="signin-signup">
                <form  method="post" action="login" class="sign-in-form">
                    <h2 class="title">Sign in</h2>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" placeholder="Username" name="username" />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" placeholder="Password"  name="password"/>
                    </div>
                    <input type="submit" value="Login" class="btn solid" />

                </form>
                <form  method="post" action="inscription" enctype="multipart/form-data" class="sign-up-form registerparent"  >
                    <h2 class="title">Sign up</h2>
                    <h4>Parent</h4>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="number" placeholder="Contact Number"  name="contact_number" required />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-envelope"></i>
                        <input type="email" placeholder="Email" name="email" />
                    </div>
                    <h4>Student</h4>

                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="text" placeholder="First Name"  name="first_name" required/>
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="text" placeholder="Last Name"   name="last_name" required/>
                    </div>

                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="text" placeholder="date of Birth"  name="date_birth" required/>
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="text" placeholder="Academic year"   name="academic_year" required/>
                    </div>
                    <div class="degree">
                        <label>your Degree </label>
                        <br>
                        <label for="degreefile" class="btndegree"><i class='bx bx-cloud-upload'></i> pdf </label>
                        <input type="file" id="degreefile" class="filedegree" name="uploadfile" accept="application/pdf"
                            required></input>
                    </div>
                    <input type="submit" class="btn" value="Sign up" />


                </form>
            </div>
        </div>

        <div class="panels-container">
            <div class="panel left-panel">
                <div class="content">
                    <h3>New here ?</h3>
                    <p>
                        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Debitis,
                        ex ratione. Aliquid!
                    </p>
                    <button class="btn transparent" id="sign-up-btn">
                        Sign up
                    </button>
                </div>
                <img src="img/log.svg" class="image" alt="" />
            </div>
            <div class="panel right-panel">
                <div class="content">
                    <h3>One of us ?</h3>
                    <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum
                        laboriosam ad deleniti.
                    </p>
                    <button class="btn transparent" id="sign-in-btn">
                        Sign in
                    </button>
                </div>
                <img src="img/register.svg" class="image" alt="" />
            </div>
        </div>
    </div>
</body>
</html>