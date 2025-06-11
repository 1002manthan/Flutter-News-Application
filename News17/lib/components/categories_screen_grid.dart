import 'package:flutter/material.dart';
import 'package:news_application_flutter/screens/category_wise_screens/categories_news_screen.dart';

class CategoriesTile extends StatefulWidget {
  CategoriesTile(this.url, this.index, {super.key});
  var news;
  List<String> url;
  int index;
  @override
  State<CategoriesTile> createState() => CategoriesTileState();
}

class CategoriesTileState extends State<CategoriesTile> {

  List<IconData> icons = [
    Icons.rocket_launch_outlined,
    //Icons.flag_outlined,
    //Icons.forest,
    //Icons.local_police_outlined,
    //Icons.data_exploration_outlined,
    Icons.movie_creation_outlined,
    //Icons.difference_outlined,
    //Icons.radio_button_unchecked,
    //Icons.settings,
    Icons.health_and_safety_outlined,
    Icons.sports_outlined
  ];

  static List<String> newsNames = [
    "Science",
    //"Indian National",
    //"World",
    //"Politics",
    //"Startups",
    "Entertainment",
    //"Miscellaneous",
    //"Unconventional",
    //"Automobile",
    "Health",
    "Sports"
  ];

  static List<String> apiNames = [
    "science",
    //"national",
    //"world",
    //"politics",
    //"startups",
    "entertainment",
    //"miscellaneous",
    //"hatke",
    //"automobile",
    "health",
    "sports"
  ];

  static List<Widget> goToScreen = [
    CategoriesNewsScreen(apiNames[0], newsNames[0]),
    CategoriesNewsScreen(apiNames[1], newsNames[1]),
    CategoriesNewsScreen(apiNames[2], newsNames[2]),
    CategoriesNewsScreen(apiNames[3], newsNames[3]),
    //CategoriesNewsScreen(apiNames[4], newsNames[4]),
    //CategoriesNewsScreen(apiNames[5], newsNames[5]),
    //CategoriesNewsScreen(apiNames[6], newsNames[6]),
    //CategoriesNewsScreen(apiNames[7], newsNames[7]),
    //CategoriesNewsScreen(apiNames[8], newsNames[8]),
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => goToScreen[widget.index]));
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          /*
          * boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0, 0),
              blurRadius: 6,
              spreadRadius: 1
            )
          ],
          * */
            //bluegrey was the old colour
          color: Colors.grey
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icons[widget.index], size: 28,),
              const SizedBox(
                height: 16,
              ),
              Text(newsNames[widget.index], style: const TextStyle(fontSize: 16),)
            ],
          ),
        ),
      ),
    );
  }
}
