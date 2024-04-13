
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
    <style>

        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            font-size: 18px;
            border-collapse: collapse;
            width: 100%;
        }

        #customers td{
            border: 2px solid black;
            align:"left";  cellpadding:"0"; cellspacing:"2";
            padding: 15px;
            color: white;
        }

        #customers th {
            border: 2px solid black;
            padding: 15px; 
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: green;
            color: white;
            text-transform: uppercase;
        }
    </style>
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
                            <a class="nav-link" href="Admin_Home.jsp">
                                <i class="tim-icons icon-app"></i> Home
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Add_product.jsp">
                                <i class="tim-icons icon-cart"></i> Add Product
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="View_products.jsp">
                                <i class="fa fa-list"></i> View Products
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn btn-default" href="User_details.jsp">
                                <i class="fa fa-address-book"></i> User Details
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="User_reviews.jsp">
                                <i class="fa fa-star"></i> User Reviews
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="View_orders.jsp">
                                <i class="fa fa-shopping-basket"></i> View Orders
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="graph.jsp">
                                <i class="tim-icons icon-chart-bar-32"></i> Graph
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">
                                <i class="fa fa-lock mu-contact-icon"></i> Logout
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
                    <br><br>
                    <center><h2 class="title">User Details</h2></center>
                    <br><br>
                    <div class="row">
                        <div class="col-md-12">
                            <br><br>
                            <table id="customers" style="margin-right: 300px">
                                <thead>
                                    <tr>
                                        <th>User ID</th>
                                        <th>Name </th>
                                        <th>Email </th>
                                        <th>Gender</th>
                                        <th>DOB</th>
                                        <th>address</th>
                                    </tr>
                                </thead>
                                <%
                                    Connection con = SQLconnection.getconnection();
                                    Statement st = con.createStatement();
                                    try {
                                        ResultSet rs = st.executeQuery("SELECT * FROM user_reg");

                                        while (rs.next()) {
                                %>
                                <tr>
                                    <td><%=rs.getString("id")%></td>
                                    <td><%=rs.getString("name")%></td>
                                    <td><%=rs.getString("email")%></td>
                                    <td><%=rs.getString("gender")%></td>
                                    <td><%=rs.getString("dob")%></td>
                                    <td><%=rs.getString("address")%></td>
                                </tr>
                                <%                                        }
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>
                            </table>
                            <br><br><br>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer">
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

