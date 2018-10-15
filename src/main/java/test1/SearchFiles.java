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

/**
 * @author song
 * @description: 
 * 依赖jar：Lucene-core，lucene-analyzers-common，lucene-queryparser
 * 作用：使用索引搜索文件
 */
public class SearchFiles {
    public static Version luceneVersion = Version.LATEST;
    /**
     * 查询内容
     */
//    /**
//	 * 对建立的索引进行搜索... 通过indexSearcher去搜索
//	 * @throws IOException
//	 */
//	
//public void testSearcher() throws IOException {
//		// 索引在硬盘上面的存储位置
//		Directory directory = FSDirectory.open(new File("/Users/liuxun/Desktop/indexes"));
//		//将索引目录里的索引读取到IndexReader中
//		IndexReader indexReader = DirectoryReader.open(directory);
//		//构造搜索索引的对象（索引搜索器）
//		IndexSearcher indexSearcher = new IndexSearcher(indexReader);
//		
//		//Query 是一个查询条件对象，它是一个抽象类，不同的查询条件就构造不同的子类
//		//Term(fieldName,value) 会将value与当前字段值的分词结果(多个索引)进行匹配 匹配到则命中
//		Query query = new TermQuery(new Term("title", "刘勋简介"));
//		//Query query = new TermQuery(new Term("content", "序"));
//		
//		//检索符合query条件的前N条记录
//		TopDocs topDocs = indexSearcher.search(query, 10);
//		//返回总记录数(命中数)
//		System.out.println(topDocs.totalHits);
//		
//		//存放的是document的id
//		ScoreDoc[] scoreDocs = topDocs.scoreDocs;
//		for (ScoreDoc scoreDoc : scoreDocs) {
//			//返回的就是document id  注意不是设置的字段由Lucene自动生成维护的
//			int docID= scoreDoc.doc;
//			//还需要根据document的id 检索到对应的document
//			Document document = indexSearcher.doc(docID);
//			
//			System.out.println("id== "+document.get("id"));
//			System.out.println("title== "+document.get("title"));
//			System.out.println("content== "+document.get("content"));
//		}
//		
//	}
public static ArrayList<fileeach> indexSearch(String keywords){
	//String res = "";

    ArrayList<fileeach> filelist = new ArrayList<fileeach>();
        try{
        	
//            1、创建Directory
             FSDirectory directory = FSDirectory.open(Paths.get("/Users/alexsun/IdeaProjects/Information_Retrieval/IR_Project1/web/index"));//在硬盘上生成Directory
//            2、创建IndexReader
              IndexReader reader = DirectoryReader.open(directory);
//            3、根据IndexWriter创建IndexSearcher
              //System.out.println(reader.numDocs());
             IndexSearcher searcher =  new IndexSearcher(reader);
//            4、创建搜索的query
//            创建parse用来确定搜索的内容，第二个参数表示搜索的域
             QueryParser parser = new QueryParser("fulltext",new StandardAnalyzer());//content表示搜索的域或者说字段
            Analyzer analyzer1=new StandardAnalyzer();
             Query query = parser.parse(keywords);//被搜索的内容
//            5、根据Searcher返回TopDocs
             TopDocs tds = searcher.search(query,3000);//查询20条记录
//            6、根据TopDocs获取ScoreDoc
             ScoreDoc[] sds = tds.scoreDocs;

             ///////////////////////////
//            SimpleHTMLFormatter simpleHTMLFormatter = new SimpleHTMLFormatter("<font color='red'>", "</font>");
//            Highlighter highlighter = new Highlighter(simpleHTMLFormatter,new QueryScorer(query));
//            highlighter.setTextFragmenter(new SimpleFragmenter(1024));


            ///////////////////

             //高亮
//            Highlighter highlighter = new Highlighter(new SimpleHTMLFormatter("<B>", "</B>"),   //高亮格式，用<B>标签包裹
//                    new QueryScorer(query));
//            Fragmenter fragmenter = new SimpleFragmenter(100);   //高亮后的段落范围在100字内
//            highlighter.setTextFragmenter(fragmenter);


//            7、根据Searcher和ScoreDoc获取搜索到的document对象
             int cou=0;
             //System.out.println(sds.length);
             for(ScoreDoc sd:sds){
                 cou++;
                 fileeach new1=new fileeach();
                 Document d = searcher.doc(sd.doc);
             //    String highoutword=highlighter.getBestFragment(analyzer, fieldName, targetDoc.get("blog"));  //只对“blog”属性高亮
//                    8、根据document对象获取查询的字段值
                 /**  查询结果中content为空，是因为索引中没有存储content的内容，需要根据索引path和name从原文件中获取content**/
                 //res+=cou+". "+d.get("title")+" "+"\n"+d.get("fulltext")+" "+"\n";


                 //高亮
                 String text1= d.get("fulltext");
                 SimpleHTMLFormatter simpleHTMLFormatter=new SimpleHTMLFormatter("<span style=\"background-color: yellow\"><b>", "</b></span>");
                 Highlighter highlighter=new Highlighter(simpleHTMLFormatter,new QueryScorer(query));
                 highlighter.setTextFragmenter(new SimpleFragmenter(500));
                 if (text1!= null) {
                     TokenStream tokenStream=analyzer1.tokenStream("fulltext",new StringReader(text1));

                         String highLightText = highlighter.getBestFragment(tokenStream, text1);

                    // System.out.println(highLightText);
                     if(highLightText!=null)
                     new1.setHighlight(highLightText);
                   else
                        new1.setHighlight("\n\n");



                 }

//                 String text = d.get("bookName");
//                 TokenStream tokenStream = analyzer1.tokenStream("bookName",new StringReader(text));
//                 String highLightText = highlighter.getBestFragment(tokenStream, text);
//                 System.out.println(highLightText);



                 new1.setFilename(d.get("fileName"));
                 new1.setFilepath(d.get("filePath"));
                 new1.setAuthor(d.get("author"));
                 new1.setTitle(d.get("title"));
                 new1.setAffiliation(d.get("affiliation"));
                 new1.setDate(d.get("date"));
                 new1.setFulltext("fulltext");
                 new1.setPage(d.get("page5"));
                 //System.out.println(res+d.toString());
                 filelist.add(new1);
             }
             //System.out.println(cou);
             reader.close();
             return filelist;
            
        }catch(Exception e){
            e.printStackTrace();
            return filelist;
        }
        
    }

public static String indexSearch2(String keywords,String returnfile){
	String res = "";
        try{
        	
//            1、创建Directory
             FSDirectory directory = FSDirectory.open(Paths.get("/Users/alexsun/IdeaProjects/Information_Retrieval/IR_Project1/web/index"));//在硬盘上生成Directory
//            2、创建IndexReader
              IndexReader reader = DirectoryReader.open(directory);
//            3、根据IndexWriter创建IndexSearcher
              //System.out.println(reader.numDocs());
             IndexSearcher searcher =  new IndexSearcher(reader);
//            4、创建搜索的query
//            创建parse用来确定搜索的内容，第二个参数表示搜索的域
             QueryParser parser = new QueryParser("fulltext",new StandardAnalyzer());//content表示搜索的域或者说字段
             Query query = parser.parse(keywords);//被搜索的内容
//            5、根据Searcher返回TopDocs
             TopDocs tds = searcher.search(query, 18);//查询20条记录
//            6、根据TopDocs获取ScoreDoc
             ScoreDoc[] sds = tds.scoreDocs;
//            7、根据Searcher和ScoreDoc获取搜索到的document对象
             int cou=0;
             //System.out.println(sds.length);
             for(ScoreDoc sd:sds){
                 cou++;
                 Document d = searcher.doc(sd.doc);
//                    8、根据document对象获取查询的字段值
                 /**  查询结果中content为空，是因为索引中没有存储content的内容，需要根据索引path和name从原文件中获取content**/
                 res+=d.get(returnfile);
             }
             reader.close();
             return res;
            
        }catch(Exception e){
            e.printStackTrace();
            return res;
        }
        
    }
    public static void main(String[] args) throws IOException
    {
        //System.out.println(indexSearch("reference").size()); //搜索的内容可以修改
        ArrayList<fileeach> ooo=indexSearch("math");
        for(int i=0;i<ooo.size();i++){

            System.out.println(ooo.get(i).getTitle());
            System.out.println(ooo.get(i).getAuthor());
            System.out.println(ooo.get(i).getHighlight());
            System.out.println("*****************************");
        }
    }
}