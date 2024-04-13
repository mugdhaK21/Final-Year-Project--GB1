
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="./assets/img/favicon.png">
        <title>
            Product Recommendation System
        </title>
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
        <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
        <!-- Nucleo Icons -->
        <link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
        <!-- CSS Files -->
        <link href="./assets/css/blk-design-system.css?v=1.0.0" rel="stylesheet" />
        
        <link href="./assets/demo/demo.css" rel="stylesheet" />
    </head>
    <%
        if (request.getParameter("Failed") != null) {
    %>
    <script>alert('Login Failed');</script>
    <%            }
    %>
    <%
        if (request.getParameter("Register_Success") != null) {
    %>
    <script>alert('Registration Success');</script>
    <%            }
    %>
    <body class="index-page">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg fixed-top" style="background: green">
            <div class="container">
                <div class="navbar-translate">
                    <button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar bar1"></span>
                        <span class="navbar-toggler-bar bar2"></span>
                        <span class="navbar-toggler-bar bar3"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse justify-content-end" id="navigation">
                    <div class="navbar-collapse-header">
                        <div class="row">
                            <div class="col-6 collapse-brand">
                            </div>
                            <div class="col-6 collapse-close text-right">
                                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                                    <i class="tim-icons icon-simple-remove"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link btn btn-warning" href="index.jsp">
                                <i class="tim-icons icon-app"></i> Home
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="modal" data-target="#myModal1">
                                <i class="tim-icons icon-single-02"></i> User
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="modal" data-target="#myModal0">
                                <i class="tim-icons icon-mobile"></i> Register
                            </a>
                        </li>
                        <li class="nav-item">
                             <a class="nav-link" data-toggle="modal" data-target="#myModal2">
                                <i class="tim-icons icon-settings-gear-63"></i> Admin
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="wrapper">
            <div class="page-header clear-filter">
                <div class="page-header-image" style="background-image: url('img/RE.png');"></div>
                <div class="container">

                </div>
            </div>
            <div class="main" style="background-color: black">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <br><br>
                            <center><h2 class="title">Explore the world of Electronic Products with RecommendoMart and get catchy recommendations!!!!</h2></center>
                            <h2><p align="justify">
                                    Welcome to RecommendoMart !!!
                                    An Electronic Product Recommendation System along with sentiment analysis.
                                    Here, you can purchase electronic products and provide reviews for the products. 
                                    Then you can see whether the product's review is +ve or -ve. 
                                    Basically the System analyses your review which eventually helps other users to get a quick insights about the product instead of reading the complete reviews!
                                    <br>
                                    <%
                                        Connection con = SQLconnection.getconnection();
                                        Statement st = con.createStatement();
                                         try {
                                        // Query to get all user details
                                       // ResultSet rs = st.executeQuery("SELECT * FROM user_reg");

                                        // Query to get the total number of users
                                        ResultSet countRs = st.executeQuery("SELECT COUNT(*) AS totalUsers FROM user_reg");
                                        countRs.next();
                                        int totalUsers = countRs.getInt("totalUsers");
                                    %>
                                        <h2>Total No. of users as of now are : <%=totalUsers%></h2>

                                    <% 

                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                        }
                                    %>

                                </p></h2>
                            <br><br><br>
                        </div>
                        <div class="modal fade modal-black" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content" style="background-color: black">>
                                    <div class="modal-header justify-content-center">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                            <i class="tim-icons icon-simple-remove text-white"></i>
                                        </button>
                                        <div class="text-muted text-center ml-auto mr-auto">
                                            <h3 class="mb-0">Admin Login</h3>
                                        </div>
                                    </div>
                                    <div class="modal-body">
                                        <form role="form" action="admin" method="post">
                                            <div class="form-group mb-3">
                                                <div class="input-group input-group-alternative">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">
                                                            <i class="tim-icons icon-email-85"></i>
                                                        </span>
                                                    </div>
                                                    <input class="form-control" placeholder="Email" type="text" name="name" required="required" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group input-group-alternative">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">
                                                            <i class="tim-icons icon-key-25"></i>
                                                        </span>
                                                    </div>
                                                    <input class="form-control" placeholder="Password" type="password" name="pass">
                                                </div>
                                            </div>
                                            <div class="form-check mt-3">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" checked>
                                                    <span class="form-check-sign"></span>
                                                    Remember me!
                                                </label>
                                            </div>
                                            <div class="text-center">
                                                <button type="submit" class="btn btn-primary my-4">Sign in</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade modal-black" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog" >
                                <div class="modal-content" style="background-color: black">
                                    <div class="modal-header justify-content-center">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                            <i class="tim-icons icon-simple-remove text-white"></i>
                                        </button>
                                        <div class="text-muted text-center ml-auto mr-auto">
                                            <h3 class="mb-0">User Login</h3>
                                        </div>
                                    </div>
                                    <div class="modal-body">
                                        <form role="form" action="user_signin.jsp" method="post">
                                            <div class="form-group mb-3">
                                                <div class="input-group input-group-alternative">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">
                                                            <i class="tim-icons icon-email-85"></i>
                                                        </span>
                                                    </div>
                                                    <input class="form-control" placeholder="Email" type="email" name="email" required="required" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group input-group-alternative">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">
                                                            <i class="tim-icons icon-key-25"></i>
                                                        </span>
                                                    </div>
                                                    <input class="form-control" placeholder="Password" type="password" name="pass">
                                                </div>
                                            </div>
                                            <div class="form-check mt-3">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" checked>
                                                    <span class="form-check-sign"></span>
                                                    Remember me!
                                                </label>
                                            </div>
                                            <div class="text-center">
                                                <button type="submit" class="btn btn-primary my-4">Sign in</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade modal-black" id="myModal0" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content" style="background-color: black">
                                    <div class="modal-header justify-content-center">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                            <i class="tim-icons icon-simple-remove text-white"></i>
                                        </button>
                                        <div class="text-muted text-center ml-auto mr-auto">
                                            <h3 class="mb-0">User Register</h3>
                                        </div>
                                    </div>
                                    <div class="modal-body">
                                        <form role="form" action="user_reg" method="post">
                                            <div class="form-group mb-3">
                                                <div class="input-group input-group-alternative">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">
                                                            <i class="fa fa-user mu-contact-icon"></i>
                                                        </span>
                                                    </div>
                                                    <input class="form-control" placeholder="Full Name" type="text" name="username" required="required" />
                                                </div>
                                            </div>
                                            <div class="form-group mb-3">
                                                <div class="input-group input-group-alternative">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">
                                                            <i class="tim-icons icon-calendar-60"></i>
                                                        </span>
                                                    </div>
                                                    <input class="form-control" type="date" name="dob" required="required" />
                                                </div>
                                            </div>
                                            <div class="form-group mb-3">
                                                <div class="input-group input-group-alternative">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">
                                                            <i class="tim-icons icon-email-85"></i>
                                                        </span>
                                                    </div>
                                                    <input class="form-control" placeholder="Email" type="email" name="email" required="required" />
                                                </div>
                                            </div>
                                            <div class="form-group mb-3">
                                                <div class="input-group input-group-alternative">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">
                                                            <i class="fa fa-male mu-contact-icon"></i>
                                                        </span>
                                                    </div>
                                                    <select class="form-control" name="gender" required="required">
                                                        <option value="" style="color: black;">--Gender--</option>
                                                        <option style="color: black;">Male</option>
                                                        <option style="color: black;">Female</option>
                                                        <option style="color: black;">Others</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group mb-3">
                                                <div class="input-group input-group-alternative">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">
                                                            <i class="fa fa-phone mu-contact-icon"></i>
                                                        </span>
                                                    </div>
                                                    <input class="form-control" placeholder="Phone NO" type="text" name="phone" required="required" />
                                                </div>
                                            </div>
                                            <div class="form-group mb-3">
                                                <div class="input-group input-group-alternative">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">
                                                            <i class="fa fa-home mu-contact-icon"></i>
                                                        </span>
                                                    </div>
                                                    <input class="form-control" placeholder="Address" type="text" name="address" required="required" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group input-group-alternative">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">
                                                            <i class="tim-icons icon-key-25"></i>
                                                        </span>
                                                    </div>
                                                    <input class="form-control" placeholder="Password" type="password" name="pass">
                                                </div>
                                            </div>
                                            <div class="text-center">
                                                <button type="submit" class="btn btn-primary my-4">Sign Up</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer" style="background: green">
                <div class="container">
                    <div class="row">

                    </div>
                </div>
            </footer>
        </div>
        <!--   Core JS Files   -->
        <script src="./assets/js/core/jquery.min.js" type="text/javascript"></script>
        <script src="./assets/js/core/popper.min.js" type="text/javascript"></script>
        <script src="./assets/js/core/bootstrap.min.js" type="text/javascript"></script>
        <script src="./assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  
        <script src="./assets/js/plugins/bootstrap-switch.js"></script>
      
        <script src="./assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
        <!-- Chart JS -->
        <script src="./assets/js/plugins/chartjs.min.js"></script>
     
        <script src="./assets/js/plugins/moment.min.js"></script>
        <script src="./assets/js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
      
        <script src="./assets/demo/demo.js"></script>
       
        <script src="./assets/js/blk-design-system.min.js?v=1.0.0" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                blackKit.initDatePicker();
                blackKit.initSliders();
            });

            function scrollToDownload() {

                if ($('.section-download').length != 0) {
                    $("html, body").animate({
                        scrollTop: $('.section-download').offset().top
                    }, 1000);
                }
            }
        </script>
    </body>

</html>


