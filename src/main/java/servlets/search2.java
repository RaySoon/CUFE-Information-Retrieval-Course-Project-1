package servlets;

import test1.SearchFiles;
import test2.fileeach;
import test2.listlala;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "search2",urlPatterns = "/search2")
public class search2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword=request.getParameter("keyword");
        String page=request.getParameter("page");
        System.out.println(keyword);
        ArrayList<fileeach> lp3= SearchFiles.indexSearch(keyword);
        int yvshu=lp3.size()%5;
        int yv=0;
        if(yvshu>0)yv=1;
        int allpagenumber=lp3.size()/5+yv;
        int page2=Integer.valueOf(page).intValue();

        System.out.println("size"+lp3.size());
        System.out.println("yvshu"+yvshu);
        System.out.println("yv"+yv);
        System.out.println("page"+page2);
        System.out.println("allpage"+allpagenumber);

        if(page2<=allpagenumber&&page2>0){
            request.setAttribute("keyword1",keyword);
            request.setAttribute("page1",page);
            listlala listAll=new listlala();
            listAll.setPage(page2);
            listAll.setAllPage(allpagenumber);
            listAll.setKeyword(keyword);
            if(page2<allpagenumber){
                ArrayList<fileeach> tem=new ArrayList<>();
                for(int ii=(page2-1)*5;ii<page2*5;ii++)
                {
                    tem.add(lp3.get(ii));
                }
                listAll.setContent(tem);
            }
            else {
                ArrayList<fileeach> tem=new ArrayList<>();
                for(int ii=(page2-1)*5;ii<lp3.size();ii++)
                {
                    tem.add(lp3.get(ii));
                }
                listAll.setContent(tem);


            }


            request.setAttribute("listAll2",listAll);
            request.getRequestDispatcher("/html/answer2.jsp").forward(request,response);
        }
        else{
System.out.println("yvshu"+yvshu);
            System.out.println("yv"+yv);
            System.out.println("page"+page2);
            System.out.println("allpage"+allpagenumber);
            System.out.println("size"+lp3.size());
//request.getRequestDispatcher("../html/Members.html").forward(request,response);
        }
    }
}
