package servlets;

import test1.SearchFiles;
import test2.fileeach;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.ArrayList;


public class searchs extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String keyword = request.getParameter("keywords");
        String type = request.getParameter("type1");
        if (!keyword.matches("[a-zA-Z\\s]+") && !keyword.equals("")) {
            request.getRequestDispatcher("../jsp/Search_Error2.jsp").forward(request, response);
        } else if (keyword.length() < 3) {
            request.getRequestDispatcher("../jsp/Search_Error1.jsp").forward(request, response);
        }else{
            request.setAttribute("keyword1", keyword);
            request.setAttribute("type1", type);
            request.getRequestDispatcher("../jsp/Answer_Page_1.jsp").forward(request, response);
        }
        System.out.println(keyword);
        System.out.println(type);
    }
}
