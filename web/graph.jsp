
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.google.gson.Gson"%>
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
                            <a class="nav-link" href="User_details.jsp">
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
                            <a class="nav-link btn btn-default" href="graph.jsp">
                                <i class="tim-icons icon-chart-bar-32"></i> Analytics
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
                    <div class="content-center">
                        <h1 style="color: #00ffff" class="title"><b></b>
                        </h1>
                        <br/>
                    </div>
                </div>
            </div>
            <div class="main" style="background-color: black">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <br><br>
                            <center><h2 class="title">Analysis</h2></center>
                                <%
                                    Gson gsonObj = new Gson();
                                    Map<Object, Object> map = null;
                                    List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
                                    String dataPoints = null;

                                    try {

                                        Connection connection = SQLconnection.getconnection();
                                        Statement statement = connection.createStatement();
                                        String xVal, yVal;

                                        ResultSet resultSet = statement.executeQuery("SELECT pname,AVG(rating) FROM comments group by pname");

                                        while (resultSet.next()) {
                                            xVal = (resultSet.getString("pname") + " Rating:");
                                            yVal = resultSet.getString("AVG(rating)");
                                            map = new HashMap<Object, Object>();
                                            map.put("label", xVal);
                                            map.put("y", yVal);
                                            list.add(map);
                                            dataPoints = gsonObj.toJson(list);
                                        }
                                        System.out.println(dataPoints);
                                    } catch (SQLException e) {
                                        System.out.println(e);
                                        out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
                                        dataPoints = null;
                                    }
                                %>
                            <script type="text/javascript">
                                window.onload = function () {


                                    var chart = new CanvasJS.Chart("chartContainer", {
                                        animationEnabled: true,

                                        title: {
                                            text: "Product Rating"
                                        },
                                        data: [{
                                                type: "pie",
                                                radius: "200%",
                                                showInLegend: true,
                                                legendText: "{label}",
                                                toolTipContent: "{label}: <strong>{y}</strong>",
                                                indexLabel: "{label} {y}",
                                                dataPoints: <%out.print(dataPoints);%>
                                            }]
                                    });

                                    chart.render();

                                }
                            </script>
                            <div  id="chartContainer" style="height: 500px; width: 100%; margin-right: 150px"></div>
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

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>


        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
                                $(document).ready(function () {
                                    // navigation click actions 
                                    $('.scroll-link').on('click', function (event) {
                                        event.preventDefault();
                                        var sectionID = $(this).attr("data-id");
                                        scrollToID('#' + sectionID, 750);
                                    });
                                    // scroll to top action
                                    $('.scroll-top').on('click', function (event) {
                                        event.preventDefault();
                                        $('html, body').animate({scrollTop: 0}, 'slow');
                                    });
                                    // mobile nav toggle
                                    $('#nav-toggle').on('click', function (event) {
                                        event.preventDefault();
                                        $('#main-nav').toggleClass("open");
                                    });
                                });
                                // scroll function
                                function scrollToID(id, speed) {
                                    var offSet = 0;
                                    var targetOffset = $(id).offset().top - offSet;
                                    var mainNav = $('#main-nav');
                                    $('html,body').animate({scrollTop: targetOffset}, speed);
                                    if (mainNav.hasClass("open")) {
                                        mainNav.css("height", "1px").removeClass("in").addClass("collapse");
                                        mainNav.removeClass("open");
                                    }
                                }
                                if (typeof console === "undefined") {
                                    console = {
                                        log: function () { }
                                    };
                                }
        </script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        
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

