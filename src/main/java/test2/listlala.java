package test2;

import java.util.ArrayList;

public class listlala {
    private String keyword;
    private  int page;
    private int allPage;
    private ArrayList<fileeach> content;

    public int getAllPage() {
        return allPage;
    }

    public void setAllPage(int allPage) {
        this.allPage = allPage;
    }

    public ArrayList<fileeach> getContent() {
        return content;
    }

    public void setContent(ArrayList<fileeach> content) {
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
