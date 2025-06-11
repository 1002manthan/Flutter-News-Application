import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_application_flutter/screens/splash_screen.dart';
import 'package:news_application_flutter/components/business_news_cards.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});
  @override
  State<BusinessScreen> createState() => BusinessScreenState();
}

class BusinessScreenState extends State<BusinessScreen> {
  //sport news data for sport screen
  String? business_data;
  var businessScreenNews;
  List? BSN;

  Future<void> getSportNews() async {
    final response = await http
        .get(Uri.parse("https://saurav.tech/NewsAPI/top-headlines/category/business/in.json"));
    setState(() {
      business_data = response.body;
      businessScreenNews = jsonDecode(business_data!)['articles'];
      BSN = businessScreenNews;
    });
  }

  @override
  void initState() {
    super.initState();
    getSportNews();
  }

  @override
  Widget build(BuildContext context) {
    return businessScreenNews == null
        ? const SplashScreen()
        : Padding(
            padding: const EdgeInsets.only(bottom: 55.0, left: 14, right: 14),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0, top: 14),
                    child: Text(
                      "Recent Business News",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      businessScreenNews.length,
                       (index){ return BusinessNewsCards(businessScreenNews[index]);}
                    ),
                  ),
                  const SizedBox(
                    height: 57,
                  )
                ],
              ),
            ));
  }
}