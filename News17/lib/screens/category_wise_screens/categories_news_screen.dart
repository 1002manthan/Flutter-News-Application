import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_application_flutter/components/business_news_cards.dart';
import '../splash_screen_category.dart';

// ignore: must_be_immutable
class CategoriesNewsScreen extends StatefulWidget {
  CategoriesNewsScreen(this.apiName, this.newsName, {super.key});
  String? apiName;
  String? newsName;
  @override
  State<CategoriesNewsScreen> createState() => CategoriesNewsScreenState();
}

class CategoriesNewsScreenState extends State<CategoriesNewsScreen> {
  String? data;
  var ScienceNewsData;

  Future<void> getData() async{
    http.Response response;
    response = await http.get(Uri.parse("https://saurav.tech/NewsAPI/top-headlines/category/${widget.apiName}/in.json"));
    setState(() {
      data = response.body;
      ScienceNewsData = jsonDecode(data!)['articles'];
    });
  }
  @override
  void initState(){
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return ScienceNewsData == null
        ? const SplashScreenCategory()
        : Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black54.withOpacity(0.3),
                  offset: Offset.zero,
                  blurRadius: 18)
            ]),
            child: Text(
              "Recent ${widget.newsName} News",
              style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )),
        backgroundColor: Colors.red.shade600,
        iconTheme: IconThemeData(color: Colors.white, shadows: [
          BoxShadow(
              color: Colors.black54.withOpacity(0.3),
              offset: Offset.zero,
              blurRadius: 18)
        ]),
      ),
      body: Container(
        child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12, left: 8, right: 8, top: 8),
              child: Column(
                children: [
                  Column(
                    children: List.generate(
                        ScienceNewsData.length,
                            (index){ return BusinessNewsCards(ScienceNewsData[index]); }
                    ),
                  ),
                ],
              ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Stack(
        children: [
          Container(
            height: 28,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset.zero,
                      blurRadius: 16,
                      spreadRadius: 2
                  )
                ]
            ),
          ),
          FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: Colors.blueGrey,
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 7.2),
              child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.white,),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: Offset.zero,
              blurRadius: 16,
              spreadRadius: 10
            )
          ]
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          height: 50,
          color: Colors.red.shade600,
          notchMargin: 5.0,
        ),
      ),
    );
  }
}
