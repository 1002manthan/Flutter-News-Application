import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_application_flutter/screens/splash_screen.dart';
import 'package:news_application_flutter/components/tech_news_tiles.dart';

class TechScreen extends StatefulWidget {
  const TechScreen({super.key});

  @override
  State<TechScreen> createState() => TechScreenState();
}

class TechScreenState extends State<TechScreen> {
  String? data;
  var techNewsData;
  Future<void> getData() async{
    http.Response response;
    response = await http.get(Uri.parse("https://saurav.tech/NewsAPI/top-headlines/category/technology/in.json"));
    setState(() {
      data = response.body;
      techNewsData = jsonDecode(data!)['articles'];
    });
  }
  @override
  void initState(){
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return techNewsData == null
        ? const SplashScreen()
        : Container(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.only(bottom: 76.0, left: 12, right: 12, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(" About Technical News", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                Column(
                  children: List.generate(
                      techNewsData.length,
                      (index){ return TechNewsTiles(techNewsData[index], index); }
                  ),
                ),
              ],
            ),
                  ),
                ),
          ),
        );
  }
}
