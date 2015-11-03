package com.csc540;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
/**
 * Servlet implementation class Regular_Checkout
 */
@WebServlet("/Regular_Checkout")
public class Regular_Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Regular_Checkout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Hello ppl");
		 String pub_id = request.getParameter("pub_id");
         String patron_id = request.getParameter("patron_id");
         int result =0;
         System.out.println(pub_id+":"+patron_id);
         try {
			Class.forName("com.mysql.jdbc.Driver");
		  // MySQL database connection
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LibraryDb?" + "user=root&password=root");
         CallableStatement cstmt = conn.prepareCall("{call publication_checkout(?,?,?)}");
         cstmt.setString(1,pub_id);
         cstmt.setString(2,patron_id);
         cstmt.registerOutParameter(3, java.sql.Types.TINYINT);
         cstmt.executeUpdate();
         result = cstmt.getInt(3);
         System.out.println(result);
         RequestDispatcher rd=request.getRequestDispatcher("Regular_checkout.jsp"); 
 		rd.include(request,response);
          
         } catch (ClassNotFoundException | SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
		
	}

}
