import 'package:flutter/material.dart';
import 'package:news_application_flutter/screens/news_details_page.dart';

class BreakingNewsCard extends StatefulWidget {
  BreakingNewsCard(this.News, {super.key});
  var News;
  @override
  State<BreakingNewsCard> createState() => BreakingNewsCardState();
}

class BreakingNewsCardState extends State<BreakingNewsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetailsPage(widget.News)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: (widget.News['urlToImage'] == null? NetworkImage('https://salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled.png'):NetworkImage(widget.News['urlToImage']))
    ),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.News['title'],
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (widget.News['author'] ?? 'Author'),
                        style: const TextStyle(color: Colors.white54),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.News['publishedAt'].substring(0,10)+ " | ",
                            style: const TextStyle(color: Colors.white54, fontSize: 12),
                          ),
                          Text(
                            widget.News['publishedAt'].substring(11,16),
                            style: const TextStyle(color: Colors.white54, fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "More Details",
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 10.5,
                            shadows: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  offset: Offset.zero,
                                  blurRadius: 8,
                                  spreadRadius: 2)
                            ]),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white54,
                        size: 10,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
