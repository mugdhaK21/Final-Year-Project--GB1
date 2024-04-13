
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
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
                            <a class="nav-link" href="User_Home.jsp">
                                <i class="tim-icons icon-app"></i> Home
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn btn-default" href="Products.jsp">
                                <i class="tim-icons icon-cart"></i> Product
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Recommended_products.jsp">
                                <i class="tim-icons icon-send"></i>Recommended Product
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Your_orders.jsp">
                                <i class="fa fa-shopping-basket"></i>Your Orders
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">
                                <i class="fa fa-lock"></i> Logout
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="wrapper">
            <div class="page-header clear-filter">
                <div class="page-header-image" style="background-image: url('img/RE2.png');"></div>
                <div class="container">

                </div>
            </div>
            <div class="main" style="background-color: black">
                <div class="container">
                    <center><h2 class="title">Product Reviews</h2></center><br><br>
                    <div class="row">
                        <%

                            String pid = request.getParameter("pid");
                            String pname = request.getParameter("pname");

                            Connection con = SQLconnection.getconnection();
                            Statement st = con.createStatement();
                            Statement st1 = con.createStatement();
                            try {
                                ResultSet rs = st.executeQuery("SELECT * FROM product WHERE id = '" + pid + "'");

                                while (rs.next()) {
                        %>
                        <div class="col-md-6">
                            <div class="container">
                                <div class="row">
                                    <br><br>
                                    <img src="Getimage?id=<%=rs.getString("id")%>" width="380" height="300" alt="Image" class="img-raised">
                                    <br>
                                    <div>
                                        <h3 style="color: #ff9900"><%=rs.getString("pname")%></h3>
                                        <h3 style="color: #00ccff">Rs.<%=rs.getString("price")%></h3>
                                    </div>
                                    <br>
                                    <p><%=rs.getString("des")%></p>
                                </div>
                            </div>
                            <br><br><br>
                        </div>
                        <div class="col-md-6">
                            <div class="card-content">
                                <div class="card-body">
                                    <form action="add_comments.jsp" method="post">
                                        <input type="hidden" name="pid" value="<%=rs.getString("id")%>">
                                        <input type="hidden" name="brand" value="<%=rs.getString("brand_name")%>">
                                        <input type="hidden" name="category" value="<%=rs.getString("category")%>">
                                        <input type="hidden" name="pname" value="<%=rs.getString("pname")%>">
                                        <div class="form-group">
                                            <label>Product Rating :</label>
                                            <input class="form-control" placeholder="Enter Product Rating" type="number" name="rating" min="1" max="5" required="required" />
                                        </div>
                                        <div>
                                            <label>Comment :</label><br>
                                            <textarea name="comment" style="background-color: transparent;border-color: #cccccc;border-width: 0.01px;width: 500px;height: 100px;resize: none;color: white; " required="required"></textarea>
                                        </div>
                                        <div class="text-center">
                                            <button type="submit" class="btn btn-success my-4">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <br><br><br>
                        </div>
                        <%                                        }
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }

                        %>
                        <div class="col-md-12">
                            <table id="customers" style="margin-right: 300px">
                                <th>User Name</th>
                                <th>Rating</th>
                                <th>Comments</th>
                                <th>Sentiment Analysis</th>
                                    <%                                        
                                        double verypos = 0, veryneg = 0, poscount = 0, negcount = 0, undefined = 0, neutralcount = 0;
                                        try {
                                            ResultSet rs1 = st1.executeQuery("SELECT * FROM comments WHERE pid = '" + pid + "'");

                                            while (rs1.next()) {
                                                String temp = "";
                                                int i = 1;
                                                float sen = Float.parseFloat(rs1.getString("sentiment"));
                                                if (sen > 1) {
                                                    verypos++;
                                                    temp = "Very Positive";
                                                }
                                                if (sen == 1) {
                                                    poscount++;
                                                    temp = "Positive";
                                                }
                                                if (sen < -1) {
                                                    veryneg++;
                                                    temp = "Very Negative";
                                                }

                                                if (sen >= -1 && sen < 0) {
                                                    negcount++;
                                                    temp = "Negative";
                                                }
                                                if (sen == 0) {
                                                    neutralcount++;
                                                    temp = "Neutral";
                                                }

                                    %>
                                <tr>
                                    <td><%=rs1.getString("uname")%></td>
                                    <td><%=rs1.getString("rating")%></td>
                                    <td><%=rs1.getString("comment")%></td>
                                    <td><b><%=temp%></b></td>
                                </tr>
                                <%

                                        }

                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>
                            </table>
                            <br><br><br>
                            
                        </div>
                    </div>


                    <div class="row">
                    <div class="col-md-12">
                        <center><h2 class="title">Sentiment Analysis Graph</h2></center>
                           <%
                                Gson gsonObj = new Gson();
                                Map<Object, Object> map = null;
                                List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
                                String dataPoints = null;

                                try {
                                    Connection connection = SQLconnection.getconnection();
                                    Statement statement = connection.createStatement();
                                    String xVal, yVal;

                                    ResultSet resultSet = statement.executeQuery("SELECT sentiment_analysis, COUNT(*) as count FROM comments WHERE pid = '" + pid + "' GROUP BY sentiment_analysis");

                                    while (resultSet.next()) {
                                        xVal = resultSet.getString("sentiment_analysis");
                                        yVal = resultSet.getString("count");
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
                                    var chart = new CanvasJS.Chart("sentimentChartContainer", {
                                        animationEnabled: true,
                                        title: {
                                            text: "Sentiment Analysis"
                                        },
                                        data: [{
                                            type: "pie",
                                            startAngle: 240,
                                            yValueFormatString: "##0",
                                            indexLabel: "{label} {y}",
                                            dataPoints: <%= dataPoints %>
                                        }]
                                    });

                                    chart.render();
                                }
                            </script>

                            <div id="sentimentChartContainer" style="height: 400px; width: 100%; margin-top: 50px;"></div>

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

