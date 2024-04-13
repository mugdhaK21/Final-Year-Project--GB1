 
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.util.HashMap"%>
<%@page import="Product_Rec_System.Sentiment"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%
    double verypos = 0, veryneg = 0, poscount = 0, negcount = 0, undefined = 0, neutralcount = 0;
    String comment = request.getParameter("comment");
    String rating = request.getParameter("rating");
    String pid = request.getParameter("pid");
    String pname = request.getParameter("pname");
    String brand = request.getParameter("brand");
    String category = request.getParameter("category");
    System.out.println("ok");

    String uid = (String) session.getAttribute("uid");
    String uname = (String) session.getAttribute("uname");

    Connection con = SQLconnection.getconnection();
    
    Sentiment s = new Sentiment();
    float sentiment = s.findSentiment(comment.trim());

    String temp = "";
    if (sentiment > 1) {
        temp = "Very Positive";
    }
    if (sentiment == 1) {
        temp = "Positive";
    }
    if (sentiment < -1) {
        temp = "Very Negative";
    }

    if (sentiment >= -1 && sentiment < 0) {
        temp = "Negative";
    }
    if (sentiment == 0) {
        temp = "Neutral";
    }


    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into comments (uname, uid, pid, pname, brand_name, category, sentiment, rating, comment, sentiment_analysis) values ('" + uname + "','" + uid + "','" + pid + "','" + pname + "','" + brand + "','" + category + "','" + sentiment + "','" + rating + "','" + comment + "','"+ temp +"')");
    if (i != 0) {
        out.println("inserted");
        response.sendRedirect("Product_reviews.jsp?pid=" + pid + "&pname=" + pname + " msg=Review_added");
    } else {
        response.sendRedirect("Product_reviews.jsp?pid=" + pid + "&pname=" + pname + " msg=Failed");
        out.println("failed...");
    }

%>