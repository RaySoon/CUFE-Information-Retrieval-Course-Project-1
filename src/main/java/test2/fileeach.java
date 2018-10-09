package test2;

public class fileeach {
    private String filename;
    private String filepath;
    private String title;
    private String author;
    private String date;
    private String affiliation;
    private String address;
    private String page;
    private String highlight;



    private String fulltext;
    public String getHighlight() {
        return highlight;
    }

    public void setHighlight(String highlight) {
        this.highlight = highlight;
    }
    public String getPage() {
        return page;
    }
    public void setPage(String page2) {
        this.page = page2;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getAuthor() {
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    public String getAffiliation() {
        return affiliation;
    }
    public void setAffiliation(String affiliation) {
        this.affiliation = affiliation;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getFulltext() {
        return fulltext;
    }
    public void setFulltext(String fulltext) {
        this.fulltext = fulltext;
    }
    public String toString(){
        return "fulltext [title="+title+", authors="
                +author+",date="+ date+", affiliation="+affiliation+", address="+address+" and fulltext="+fulltext+"]";
    }
    public String getFilename() {
        return filename;
    }
    public void setFilename(String filename) {
        this.filename = filename;
    }
    public String getFilepath() {
        return filepath;
    }
    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }
}
