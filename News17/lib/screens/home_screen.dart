import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_application_flutter/components/breaking_news_card.dart';
import 'package:news_application_flutter/components/recent_news_tile.dart';
import 'package:news_application_flutter/screens/splash_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String? home_data;
  var homeScreenNews;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    http.Response response;
    response = await http.get(
      Uri.parse("https://saurav.tech/NewsAPI/top-headlines/category/general/in.json")
    );
    if (response.statusCode == 200) {
      setState(() {
        home_data = response.body;
        homeScreenNews = jsonDecode(home_data!)['articles'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: homeScreenNews == null
          ? const SplashScreen()
          : Container(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 55.0),
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 12, left: 12, right: 12, bottom:12),
                      child: Text(
                        "Breaking News",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26
                        ),
                      ),
                    ),
                    CarouselSlider.builder(
                        itemCount: 3,
                        itemBuilder: (context, int index, id) {
                          return BreakingNewsCard(homeScreenNews[index]);
                        },
                        options: CarouselOptions(
                            aspectRatio: 16 / 9,
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12, top: 20, right: 12, bottom: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Recent News",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Column(
                            children: List.generate(homeScreenNews.length - 3,
                              (index) {
                              return RecentNewsCards(homeScreenNews[index + 3]);
                                }
                              )
                          ),
                          const SizedBox(
                            height: 42,
                          )
                        ],
                      ),
                    )
                  ],
                )),
          )),
    );
  }
}