package com.IR.Component;

import java.util.ArrayList;

public class List {
    private String keyword;
    private int page;
    private int allPage;
    private ArrayList<File> content;

    public int getAllPage() {
        return allPage;
    }

    public void setAllPage(int allPage) {
        this.allPage = allPage;
    }

    public ArrayList<File> getContent() {
        return content;
    }

    public void setContent(ArrayList<File> content) {
        this.content = content;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
}
