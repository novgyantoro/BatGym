package Servlet;

import Database.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    static Connection conn;
    static PreparedStatement ps;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String eName = request.getParameter("eName");
        String pWord = request.getParameter("pWord");

        ResultSet rsu = null;

        try {
            conn = new DBConnection().setConnection();
            ps = conn.prepareStatement("SELECT * FROM tbl_admin WHERE username = ? AND password = ?");
            ps.setString(1, eName);
            ps.setString(2, pWord);
            rsu = ps.executeQuery();

            if (rsu.next()) {
                // Login successful
                HttpSession session = request.getSession();
                session.setAttribute("user", eName);
                session.setAttribute("login", true);

                // Set user details in session
//                session.setAttribute("id", rsu.getInt("id"));
//                session.setAttribute("email", rsu.getString("email"));
//                session.setAttribute("paket", rsu.getString("paket"));
//                session.setAttribute("program", rsu.getString("program"));

                request.setAttribute("eName", eName);
                RequestDispatcher rd = request.getRequestDispatcher("beranda.jsp");
                rd.forward(request, response);
            } else {
                // Login failed
                response.sendRedirect("beranda.jsp");
            }
        } catch (SQLException e) {
            response.sendRedirect("beranda.jsp");
        } catch (IllegalStateException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Illegal state encountered.");
        } finally {
            try {
                if (rsu != null) rsu.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Login Servlet";
    }
}
