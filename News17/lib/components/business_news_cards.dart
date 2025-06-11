import 'package:flutter/material.dart';
import 'package:news_application_flutter/screens/news_details_page.dart';

class BusinessNewsCards extends StatefulWidget {
  BusinessNewsCards(this.news, {super.key});
  var news;

  @override
  State<BusinessNewsCards> createState() => BusinessNewsCardsState();
}

class BusinessNewsCardsState extends State<BusinessNewsCards> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetailsPage(widget.news)));
      },
      child: Card(
          elevation: 6,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.newspaper_outlined),
                title: Text(widget.news['title']),
                subtitle: Text(
                  widget.news['publishedAt'].substring(0,10),
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                      image: DecorationImage(
                          image: (widget.news['urlToImage'] == null? NetworkImage('https://salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled.png'):NetworkImage(widget.news['urlToImage'])),
                          fit: BoxFit.cover
                      ),
                    ),
                    child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black12,
                                  Colors.black
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft)),
                        padding: const EdgeInsets.all(16),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 3,
                              top: 0,
                              child: Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Tap for detailed news",
                                        style: TextStyle(
                                            shadows: [BoxShadow(color: Colors.black.withOpacity(1), offset: Offset.zero, blurRadius: 8, spreadRadius: 4)],
                                            fontSize: 10,
                                            color: Colors.white60),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 12,
                                        color: Colors.white60,
                                      )
                                    ],
                                  ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 160,
                                          child: Text(widget.news['content'] ?? 'To view content go to website.', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),overflow: TextOverflow.ellipsis,),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          widget.news['author'] ?? 'Author',
                                          style: const TextStyle(color: Colors.white38),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 6, right: 6, top: 2, bottom: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.white54,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        widget.news['publishedAt'].substring(11,16),
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        )),
                  )),
            ],
          )),
    );
  }
}
