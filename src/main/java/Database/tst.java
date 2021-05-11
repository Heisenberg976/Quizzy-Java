//package Database;
//
//
//import org.jsoup.Jsoup;
//import org.jsoup.nodes.Document;
//import org.jsoup.nodes.Element;
//import org.jsoup.select.Elements;
//
//import javax.swing.text.Document;
//import java.io.IOException;
//
//public class tst {
//    public static void main(String[] args) {
//        try {
//            // Here we create a document object and use JSoup to fetch the website
//            Document doc = Jsoup.connect("https://www.mymarket.ge/ka/search/?Keyword=macbook+pro").get();
//
//            // With the document fetched, we use JSoup's title() method to fetch the title
//            System.out.printf("Title: %s\n", doc.title());
//
//            // Get the list of repositories
//            Elements searches = doc.getElementsByClass("products grid");
//
//            /**
//             * For each repository, extract the following information:
//             * 1. Title
//             * 2. Number of issues
//             * 3. Description
//             * 4. Full name on github
//             */
//            for (Element repository : searches) {
//
//            }
//
//            // In case of any IO errors, we want the messages written to the console
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
//
//}
