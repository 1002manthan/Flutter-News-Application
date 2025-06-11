import 'package:flutter/material.dart';
import 'package:news_application_flutter/screens/news_details_page.dart';

class RecentNewsCards extends StatefulWidget {
  RecentNewsCards(this.news, {super.key});
  var news;

  @override
  State<RecentNewsCards> createState() => RecentNewsCardsState();
}

class RecentNewsCardsState extends State<RecentNewsCards> {
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
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        image: DecorationImage(
                            image: (widget.news['urlToImage'] == null)
                                ? NetworkImage(
                                    'https://salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled.png')
                                : NetworkImage(widget.news['urlToImage']),
                            fit: BoxFit.cover)),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 124,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (widget.news['title'].length >= 75)
                                        ? widget.news['title']
                                                .substring(0, 69) +
                                            "..."
                                        : widget.news['title'],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    (widget.news['content'] ?? "To view content go to website."),
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        const TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.news['publishedAt']
                                        .substring(11, 16),
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 11.5),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "More Details",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 10.5,
                                            shadows: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  offset: Offset.zero,
                                                  blurRadius: 8,
                                                  spreadRadius: 2)
                                            ]),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.black54,
                                        size: 10,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
