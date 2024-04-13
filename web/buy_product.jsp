
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String pid = request.getParameter("pid");
    String pname = request.getParameter("pname");

    String uid = (String) session.getAttribute("uid");
    String uname = (String) session.getAttribute("uname");

    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    try {
        ResultSet rs1 = st1.executeQuery("SELECT * FROM product where id='" + pid + "'");
        if (rs1.next()) {
            String brand_name = rs1.getString("brand_name");
            String category = rs1.getString("category");
            String price = rs1.getString("price");
            String tag = rs1.getString("tag");

            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);
            System.out.println("Date and Time : " + time);

            int i = st.executeUpdate("insert into purchased (uname, uid, pid, pname, brand_name, price, category, tag, time) values ('" + uname + "','" + uid + "','" + pid + "','" + pname + "','" + brand_name + "','" + price + "','" + category + "','" + tag + "','" + time + "')");
            if (i != 0) {
                System.out.println("Product Ordered");
                response.sendRedirect("Products.jsp?Product_puchased");
            } else {
                response.sendRedirect("Products.jsp?failed");
                System.out.println("failed...");
            }
        } else {
            response.sendRedirect("Product_details.jsp?Failed");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>