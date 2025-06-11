import 'package:flutter/material.dart';
import 'package:news_application_flutter/screens/news_details_page.dart';

class TechNewsTiles extends StatefulWidget {
  TechNewsTiles(this.news, this.index, {super.key});
  var news;
  int index;
  @override
  State<TechNewsTiles> createState() => TechNewsTilesState();
}

class TechNewsTilesState extends State<TechNewsTiles> {
  @override
  Widget build(BuildContext context) {
    return (widget.index%2 != 0)
        ? OddCard(widget.news)
        : EvenCard(widget.news);
  }
}

class OddCard extends StatefulWidget {
  OddCard(this.news, {super.key});
  var news;
  @override
  State<OddCard> createState() => OddCardState();
}

class OddCardState extends State<OddCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailsPage(widget.news)));
      },
      child: Card(
          elevation: 8,
          child: Container(
            padding: const EdgeInsets.all(0),
            width: double.infinity,
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                    height: 165,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        image: DecorationImage(
                            image: (widget.news['urlToImage'] == null? NetworkImage('https://salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled.png'):NetworkImage(widget.news['urlToImage'])),
                            fit: BoxFit.cover,
                        )
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text((widget.news['title'].length) > 30? (widget.news['title'].substring(0, 30))+ "...": widget.news['title'],
                                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              widget.news['content'] ?? 'To view content go to website.',
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Text(widget.news['publishedAt'].substring(0,10) +", "+ widget.news['publishedAt'].substring(11,16), style: const TextStyle(color: Colors.black54, fontSize: 10),),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text("More Details", style: TextStyle(color: Colors.black54, fontSize: 12, shadows: [BoxShadow(color: Colors.black.withOpacity(0.4), offset: Offset.zero, blurRadius: 8, spreadRadius: 2)]),),
                            const Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 12,)
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}

class EvenCard extends StatefulWidget {
  EvenCard(this.news, {super.key});
  var news;
  @override
  State<EvenCard> createState() => EvenCardState();
}

class EvenCardState extends State<EvenCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailsPage(widget.news)));
      },
      child: Card(
          elevation: 8,
          child: Container(
            padding: const EdgeInsets.all(0),
            width: double.infinity,
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text((widget.news['title'].length) > 30? (widget.news['title'].substring(0, 30))+ "...": widget.news['title'],
                            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          widget.news['content'] ?? '',
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(widget.news['publishedAt'].substring(0,10) +", "+ widget.news['publishedAt'].substring(11,16), style: const TextStyle(color: Colors.black54, fontSize: 10),),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text("More details", style: TextStyle(color: Colors.black54, fontSize: 12, shadows: [BoxShadow(color: Colors.black.withOpacity(0.4), offset: Offset.zero, blurRadius: 8, spreadRadius: 2)]),),
                            const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.black54,)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    height: 165,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                        image: DecorationImage(
                            image: (widget.news['urlToImage'] == null? NetworkImage('https://salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled.png'):NetworkImage(widget.news['urlToImage'])),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
