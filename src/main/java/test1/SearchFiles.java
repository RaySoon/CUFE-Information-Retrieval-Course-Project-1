package test1;

//import java.nio.file.Paths;

import java.io.*;
import java.nio.file.Paths;
import java.util.ArrayList;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.*;
import org.apache.lucene.search.highlight.*;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import test2.fileeach;


public class SearchFiles {
    public static Version luceneVersion = Version.LATEST;

    public static ArrayList<fileeach> indexSearch(String keywords, String type1) {
        //String res = "";

        ArrayList<fileeach> filelist = new ArrayList<fileeach>();
        try {

//            1、创建Directory
            FSDirectory directory = FSDirectory.open(Paths.get("E:\\server\\apache-tomcat-9.0.12\\webapps\\IR_Project1\\index"));//在硬盘上生成Directory
//            2、创建IndexReader
            IndexReader reader = DirectoryReader.open(directory);
//            3、根据IndexWriter创建IndexSearcher
            //System.out.println(reader.numDocs());
            IndexSearcher searcher = new IndexSearcher(reader);
//            4、创建搜索的query
//            创建parse用来确定搜索的内容，第二个参数表示搜索的域
            QueryParser parser = new QueryParser(type1, new StandardAnalyzer());//content表示搜索的域或者说字段
            Analyzer analyzer1 = new StandardAnalyzer();
            Query query = parser.parse(keywords);//被搜索的内容
//            5、根据Searcher返回TopDocs
            TopDocs tds = searcher.search(query, 3000);//查询20条记录
//            6、根据TopDocs获取ScoreDoc
            ScoreDoc[] sds = tds.scoreDocs;
            int cou = 0;
            for (ScoreDoc sd : sds) {
                cou++;
                fileeach new1 = new fileeach();
                Document d = searcher.doc(sd.doc);
                // System.out.println("哈哈哈"+d.get("filePath"));
                String text1 = d.get(type1);
                SimpleHTMLFormatter simpleHTMLFormatter = new SimpleHTMLFormatter("<span style=\"background-color: yellow\"><b>", "</b></span>");
                Highlighter highlighter = new Highlighter(simpleHTMLFormatter, new QueryScorer(query));
                highlighter.setTextFragmenter(new SimpleFragmenter(500));
                if (text1 != null) {
                    TokenStream tokenStream = analyzer1.tokenStream(type1, new StringReader(text1));

                    String highLightText = highlighter.getBestFragment(tokenStream, text1);

                    // System.out.println(highLightText);
                    if (highLightText != null)
                        new1.setHighlight(highLightText);
                    else
                        new1.setHighlight("\n\n");
                }
                new1.setFilename(d.get("fileName"));
                new1.setFilepath(d.get("filePath"));
                new1.setAuthor(d.get("author"));
                new1.setTitle(d.get("title"));
                new1.setAffiliation(d.get("affiliation"));
                new1.setDate(d.get("date"));
                new1.setFulltext(type1);
                new1.setPage(d.get("page5"));
                filelist.add(new1);
            }
            //System.out.println(cou);
            reader.close();
            return filelist;

        } catch (Exception e) {
            e.printStackTrace();
            return filelist;
        }

    }

    public static String indexSearch2(String keywords, String returnfile, String type1) {
        String res = "";
        try {

//            1、创建Directory
            FSDirectory directory = FSDirectory.open(Paths.get("E:\\server\\apache-tomcat-9.0.12\\webapps\\IR_Project1\\index"));//在硬盘上生成Directory
//            2、创建IndexReader
            IndexReader reader = DirectoryReader.open(directory);
//            3、根据IndexWriter创建IndexSearcher
            //System.out.println(reader.numDocs());
            IndexSearcher searcher = new IndexSearcher(reader);
//            4、创建搜索的query
//            创建parse用来确定搜索的内容，第二个参数表示搜索的域
            QueryParser parser = new QueryParser(type1, new StandardAnalyzer());//content表示搜索的域或者说字段
            Query query = parser.parse(keywords);//被搜索的内容
//            5、根据Searcher返回TopDocs
            TopDocs tds = searcher.search(query, 18);//查询20条记录
//            6、根据TopDocs获取ScoreDoc
            ScoreDoc[] sds = tds.scoreDocs;
//            7、根据Searcher和ScoreDoc获取搜索到的document对象
            int cou = 0;
            for (ScoreDoc sd : sds) {
                cou++;
                Document d = searcher.doc(sd.doc);
//                    8、根据document对象获取查询的字段值
                res += d.get(returnfile);
            }
            reader.close();
            return res;

        } catch (Exception e) {
            e.printStackTrace();
            return res;
        }

    }

    public static String realPath(String path) {
        path = path.replace(".xml", "");
//        path = "/Users/alexsun/IdeaProjects/Information_Retrieval/data/" + path;
        return path;
    }

    public static void main(String[] args) throws IOException {
        ArrayList<fileeach> ooo = indexSearch("math", "fulltext");
        for (int i = 0; i < ooo.size(); i++) {

            System.out.println(ooo.get(i).getTitle());
            System.out.println(ooo.get(i).getAuthor());
            System.out.println(ooo.get(i).getHighlight());
            System.out.println("*****************************");
        }
    }
}