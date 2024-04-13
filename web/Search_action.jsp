
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
                                <i class="tim-icons icon-cart"></i> Products
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
                <div class="page-header-image" style="background-image: url('img/RE.png');"></div>
                <div class="container">

                </div>
            </div>
            <div class="main" style="background-color: black">
                <div class="section section-basic" id="basic-elements">
                    <div class="container" style="float: right">
                        <form action="Search_action.jsp" method="post">
                            <div class="space-70"></div>
                            <div id="inputs">
                                <h3>Search product</h3>
                                <div class="row">
                                    <div class="col-sm-6 col-lg-3">
                                        <div class="form-group">
                                            <select class="form-control" name="category" required="required">
                                                <option value="" style="color: black;">--Category--</option>
                                                <option style="color: black;">Mobile</option>
                                                <option style="color: black;">Laptop</option>
                                                <option style="color: black;">Accessories</option>
                                                <option style="color: black;">Electronics</option>
                                                <option style="color: black;">Others</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-info">
                                                <i class="fa fa-search"></i>
                                                Search
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="container">
                    <center><h2 class="title">Products</h2></center>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="section section-examples" data-background-color="black">
                                <div class="space-50"></div>
                                <div class="container">
                                    <div class="row">
                                        <%
                                            String category = request.getParameter("category");

                                            Connection con = SQLconnection.getconnection();
                                            Statement st = con.createStatement();
                                            try {
                                                ResultSet rs = st.executeQuery("SELECT * FROM product WHERE category ='" + category + "' ORDER BY id DESC ");
                                                if (rs.next()) {

                                                    rs.previous();

                                                    while (rs.next()) {
                                                        String id = rs.getString("id");
                                        %>
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-4">
                                            <a href="Product_details.jsp?pid=<%=rs.getString("id")%>&pname=<%=rs.getString("pname")%>">
                                                <img src="Getimage?id=<%=rs.getString("id")%>" width="300" height="240" alt="Image" class="img-raised">
                                            </a>
                                            <br><br><br>
                                        </div>
                                        <div class="col-sm-6">
                                            <br>
                                            <a href="Product_details.jsp?pid=<%=rs.getString("id")%>&pname=<%=rs.getString("pname")%>">
                                                <h3 style="color: #ff9900"><%=rs.getString("pname")%></h3>
                                            </a>
                                            <h3 style="color: #00ccff">Rs.<%=rs.getString("price")%></h3>
                                            <a href="Product_details.jsp?pid=<%=rs.getString("id")%>&pname=<%=rs.getString("pname")%>" class="btn btn-warning"><i class="tim-icons icon-cart"></i>&nbsp;&nbsp;
                                                Buy
                                            </a>
                                            <a href="Product_reviews.jsp?pid=<%=rs.getString("id")%>&pname=<%=rs.getString("pname")%>" class="btn btn-link btn-info" style="font-size: 20px; "> 
                                                Reviews
                                            </a>
                                        </div>
                                        <div class="col-sm-1"></div>
                                        <%
                                            }
                                        } else {
                                        %>
                                        <br><br><br>
                                        <center><h2 style="color: whitesmoke;">Product Not Found ...</h2></center>
                                            <%
                                                }
                                            %>
                                            <%
                                                } catch (Exception ex) {
                                                    ex.printStackTrace();
                                                }

                                            %>
                                    </div>
                                </div>
                                <br><br><br><br>
                            </div>
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

