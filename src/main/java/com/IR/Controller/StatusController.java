package com.IR.Controller;

import com.IR.Bean.Search;

import com.IR.Component.File;
import com.IR.Component.List;
import com.IR.Component.SearchFiles;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.*;
import java.util.ArrayList;

@Controller
public class StatusController {

    @RequestMapping(value = "/home", method = {RequestMethod.GET})
    public String home() {
        return "home";
    }

    @RequestMapping(value = "/members", method = {RequestMethod.GET})
    public String members() {
        return "members";
    }

    @RequestMapping(value = "/tasks", method = {RequestMethod.GET})
    public String tasks() {
        return "tasks";
    }

    @RequestMapping(value = "/search", method = {RequestMethod.GET})
    public String search(Model model) {
        if (!model.containsAttribute("search")) {
            Search search = new Search();
            model.addAttribute("search", new Search());
        }
        return "search";
    }

    @RequestMapping(value = "/search", method = {RequestMethod.POST})
    public String searchSave(Model model, ModelMap map, HttpSession session, @Valid @ModelAttribute("search") Search search,
                             BindingResult result, javax.servlet.http.HttpServletRequest request) throws UnsupportedEncodingException {
        //如果存在验证错误信息重定向到表单提交展示错误信息
        if (result.hasErrors()) {
            return search(model);
        }
        if (!search.getContent().matches("[a-zA-Z\\s]+")) {
            model.addAttribute("codeError", "The keyword must be encoded in English.");
            return "search";

        }
        String type = request.getParameter("type1");
        ArrayList<File> answerList = SearchFiles.indexSearch(search.getContent(), type);
        session.setAttribute("answerList", answerList);
        session.setAttribute("type", type);
        session.setAttribute("keyword", search.getContent());

        return "answer_1";
    }

    @RequestMapping(value = "/search/{page}", method = {RequestMethod.GET})
    public String search2(Model model, @PathVariable String page, HttpSession session,
                          javax.servlet.http.HttpServletRequest request) {
        ArrayList<File> answerList = (ArrayList<File>) session.getAttribute("answerList");
        String keyword = (String) session.getAttribute("keyword");
        int yvshu = answerList.size() % 5;
        int yv = 0;
        if (yvshu > 0) yv = 1;
        int allpagenumber = answerList.size() / 5 + yv;
        int page2 = Integer.valueOf(page).intValue();

        if (page2 <= allpagenumber && page2 > 0) {
            List listAll = new List();
            listAll.setPage(page2);
            listAll.setAllPage(allpagenumber);
            listAll.setKeyword(keyword);
            if (page2 < allpagenumber) {
                ArrayList<File> tem = new ArrayList<>();
                for (int ii = (page2 - 1) * 5; ii < page2 * 5; ii++) {
                    tem.add(answerList.get(ii));
                }
                listAll.setContent(tem);
            } else {
                ArrayList<File> tem = new ArrayList<>();
                for (int ii = (page2 - 1) * 5; ii < answerList.size(); ii++) {
                    tem.add(answerList.get(ii));
                }
                listAll.setContent(tem);
            }
            request.setAttribute("pagesize2", answerList.size());
            request.setAttribute("listAll2", listAll);
        }
        return "answer_2";
    }
}
