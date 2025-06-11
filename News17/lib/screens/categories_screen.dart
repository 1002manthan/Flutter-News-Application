import 'package:flutter/material.dart';
import 'package:news_application_flutter/components/categories_screen_grid.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => CategoriesScreenState();
}

class CategoriesScreenState extends State<CategoriesScreen> {

  List<String> urls = [
    //all news done in home screen
    //business news done in business screen
    //tech news done in technology screen
    "https://saurav.tech/NewsAPI/top-headlines/category/science/in.json",
    //"https://inshortsapi.vercel.app/news?category=national", THE OLD API HAVE THIS CATEGORY NOW. NOT AVAILABLE
    //"https://inshortsapi.vercel.app/news?category=world", THE OLD API HAVE THIS CATEGORY NOW. NOT AVAILABLE
    //"https://inshortsapi.vercel.app/news?category=politics", THE OLD API HAVE THIS CATEGORY NOW. NOT AVAILABLE
    //"https://inshortsapi.vercel.app/news?category=startup", THE OLD API HAVE THIS CATEGORY NOW. NOT AVAILABLE
    //sports API does not working or not getting new data
    "https://saurav.tech/NewsAPI/top-headlines/category/entertainment/in.json",
    "https://saurav.tech/NewsAPI/top-headlines/category/health/in.json",
    "https://saurav.tech/NewsAPI/top-headlines/category/sports/in.json",
    //"https://inshortsapi.vercel.app/news?category=automobile", THE OLD API HAVE THIS CATEGORY NOW. NOT AVAILABLE
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 12, left: 14, right: 14),
              child: Text("News Categories", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.only(left: 14, right: 14, top: 6,bottom: 58),
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(
                  urls.length,
                  (index){
                    return CategoriesTile(urls, index);
                  }
                ),
              ),
            )
          ],
        ),
    );
  }
}
