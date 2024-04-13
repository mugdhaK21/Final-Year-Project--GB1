
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.*" %>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
                <div class="page-header-image" style="background-image: url('img/RE.png');"></div>
                <div class="container">

                </div>
            </div>
            <div class="main" style="background-color: black">
                <br><center><h2 class="title">Product Details</h2></center>
                    <%

                        String pid = request.getParameter("pid");
                        String pname = request.getParameter("pname");

                        Connection con = SQLconnection.getconnection();
                        Statement st = con.createStatement();
                        try {
                            ResultSet rs = st.executeQuery("SELECT * FROM product WHERE id = '" + pid + "'");

                            while (rs.next()) {
                    %>
                <div class="col-md-12">
                    <div class="section section-examples" data-background-color="black">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-4">
                                    <br><br>
                                    <img src="Getimage?id=<%=rs.getString("id")%>" width="350" height="300" alt="Image" class="img-raised">
                                </div>
                                <div class="col-sm-6">
                                    <br>
                                    <h3 style="color: #ff9900"><%=rs.getString("pname")%></h3>
                                    <h3 style="color: #00ccff">Rs.<%=rs.getString("price")%></h3>
                                    <h4 style="color: #00ffff">Brand :</h4>
                                    <p><%=rs.getString("brand_name")%></p><br>
                                    <h4 style="color: #00ffff">Product Details :</h4>
                                    <p><%=rs.getString("des")%></p>
                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-6">
                                    <br>
                                    <h4 style="color: #00ffff">Payment Method :</h4>
                                    <div class="form-check form-check-radio">
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="radio" id="exampleRadios1" checked>
                                            <span class="form-check-sign"></span>
                                            Cash On Delivery
                                        </label>
                                    </div>
                                    <br>
                                    <a href="buy_product.jsp?pid=<%=rs.getString("id")%>&pname=<%=rs.getString("pname")%>" class="btn btn-warning"><i class="tim-icons icon-cart"></i>&nbsp;&nbsp;
                                        Buy
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br><br><br>
                    <%                                        }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
                </div>
                <div class="col-md-12">
                    <center><h2 class="title">Recommended Products</h2></center>
                    <div class="section section-examples" data-background-color="black">
                        <div class="space-50"></div>
                        <div class="container">
                            <div class="row">
                                <%
                                            String uid = (String) session.getAttribute("uid");

                                            List<String> uproduct = new ArrayList<>();
                                            List<String> brand = new ArrayList<>();
                                            List<String> type = new ArrayList<>();
                                            List<String> npro = new ArrayList<>();
                                            List<String> product = new ArrayList<>();
                                            Statement st1 = con.createStatement();
                                            Statement st2 = con.createStatement();
                                            Statement st3 = con.createStatement();
                                            Statement st4 = con.createStatement();
                                            Statement st5 = con.createStatement();

                                            try {
                                                ResultSet rs1 = st1.executeQuery("SELECT * FROM comments WHERE uid = '" + uid + "' AND sentiment >'1' AND rating >= '4' ");
                                                while (rs1.next()) {
                                                    brand.add(rs1.getString("brand_name"));
                                                    type.add(rs1.getString("category"));

                                                }
                                                ResultSet rs4 = st2.executeQuery("SELECT * FROM comments WHERE uid = '" + uid + "' AND sentiment <'0' AND rating < '2' ");
                                                while (rs4.next()) {
                                                    npro.add(rs4.getString("pname"));

                                                }
                                                Set<String> set3 = new HashSet<>(npro);

                                                npro.clear();
                                                npro.addAll(set3);

                                                ResultSet rs2 = st3.executeQuery("SELECT * FROM purchased WHERE uid = '" + uid + "'");
                                                while (rs2.next()) {
                                                    brand.add(rs2.getString("brand_name"));
                                                    uproduct.add(rs2.getString("pname"));
                                                    type.add(rs2.getString("category"));
                                                }
                                                Set<String> set = new HashSet<>(brand);

                                                brand.clear();
                                                brand.addAll(set);

                                                Set<String> set1 = new HashSet<>(type);

                                                type.clear();
                                                type.addAll(set1);
                                                System.out.println("[rec_brand]= " + brand);
                                                System.out.println("[rec_category]= " + type);

                                                for (String ptype : type) {
                                                    for (String pbrand : brand) {
                                                        ResultSet rs3 = st4.executeQuery("SELECT * FROM product WHERE category = '" + ptype + "' OR brand_name = '" + pbrand + "'");
                                                        while (rs3.next()) {
                                                            product.add(rs3.getString("pname"));

                                                        }
                                                    }
                                                }
                                                List<String> list = new ArrayList<>();

                                                for (String t : product) {
                                                    if (uproduct.contains(t)) {
                                                        //pro.add(t);
                                                    } else {
                                                        list.add(t);
                                                    }
                                                }
                                                System.out.println("[Purchased_products]= " + list);
                                                List<String> spro = new ArrayList<>();

                                                for (String t : list) {
                                                    if (npro.contains(t)) {
                                                        //pro.add(t);
                                                    } else {
                                                        spro.add(t);
                                                    }
                                                }
                                                Set<String> set2 = new HashSet<>(spro);

                                                spro.clear();
                                                spro.addAll(set2);
                                                List<String> recommended = new ArrayList<>();
                                                
                                                System.out.println("[rec_products]= " + spro);
                                                for (String pro : spro) {
                                                    ResultSet rs = st5.executeQuery("SELECT * FROM product WHERE pname ='" + pro + "'");

                                                    while (rs.next()) {
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
                                    <a href="Product_details.jsp?pid=<%=rs.getString("id")%>&pname=<%=rs.getString("pname")%>" class="btn btn-warning"><i class="tim-icons icon-cart"></i> 
                                        Buy
                                    </a>
                                    <a href="Product_reviews.jsp?pid=<%=rs.getString("id")%>&pname=<%=rs.getString("pname")%>" class="btn btn-link btn-info" style="font-size: 20px; "> 
                                        Reviews
                                    </a>
                                    <br>
                                </div>
                                <div class="col-sm-1"></div>
                                <%                                        }
                                        }
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>
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

