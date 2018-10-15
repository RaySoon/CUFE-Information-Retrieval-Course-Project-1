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
        if (!keyword.matches("[a-zA-Z]+") && !keyword.equals("")) {
            request.setAttribute("keyword1", "error2");
            request.getRequestDispatcher("../jsp/Search_Error2.jsp").forward(request, response);
        } else if (keyword.length() < 3) {
            request.setAttribute("keyword1", "error1");
            request.getRequestDispatcher("../jsp/Search_Error1.jsp").forward(request, response);
        }else{
            request.setAttribute("keyword1", keyword);
            request.getRequestDispatcher("../jsp/Answer_Page_1.jsp").forward(request, response);
        }
        //ArrayList<fileeach> filelist2 = SearchFiles.indexSearch(keyword);

//        ArrayList<fileeach> ooo=SearchFiles.indexSearch("reference");
//        for(int i=0;i<ooo.size();i++){
//
//            System.out.println(ooo.get(i).getTitle());
//            System.out.println(ooo.get(i).getAuthor());
//            System.out.println(ooo.get(i).getFulltext());
//            System.out.println("*****************************");
//        }
        System.out.println(keyword);
    }
}
