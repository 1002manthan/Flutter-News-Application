import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class NewsDetailsPage extends StatefulWidget {
  NewsDetailsPage(this.newsDetails, {super.key});
  var newsDetails;
  @override
  State<NewsDetailsPage> createState() => NewsDetailsPageState();
}

class NewsDetailsPageState extends State<NewsDetailsPage> {
  String msg = "website";
  static Uri? url;
  void websiteLaunching() async{
    url = Uri.parse(widget.newsDetails['url']);
    try{
      launchUrl(url!);
    }catch(err){
      setState(() {
        msg="can't";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        title: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black54.withOpacity(0.3),
                  offset: Offset.zero,
                  blurRadius: 18)
            ]),
            child: const Text(
              "News17 News Details",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )),
        backgroundColor: Colors.red.shade600,
        iconTheme: IconThemeData(color: Colors.white, shadows: [
          BoxShadow(
              color: Colors.black54.withOpacity(0.3),
              offset: Offset.zero,
              blurRadius: 18)
        ]),
      ),
      body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 40, left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.newsDetails['title'],
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.watch_later_outlined,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        widget.newsDetails['publishedAt'].substring(11,16) +
                            ", " +
                            widget.newsDetails['publishedAt'].substring(0,10),
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.black54,
                      ),
                      Text(
                        (widget.newsDetails['author'] ?? 'Author'),
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 2.2, right: 2.2),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(0, 0),
                                      color: Colors.black54,
                                      blurRadius: 2,
                                      spreadRadius: 1)
                                ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image(
                                image: (widget.newsDetails['urlToImage'] == null? NetworkImage('https://salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled.png'):NetworkImage(widget.newsDetails['urlToImage'])),
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                    ],
                  ),
                  Text.rich(TextSpan(children: [
                    const WidgetSpan(child: Icon(Icons.newspaper_outlined)),
                    const WidgetSpan(child: SizedBox(width: 4)),
                    TextSpan(
                        text: (widget.newsDetails['content'] == null ? 'T' : widget.newsDetails['content'][0]) ,
                        style:
                            const TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                    TextSpan(
                        text: (widget.newsDetails['content'] == null ? 'o view content go to website by clicking the dock button.' : widget.newsDetails['content'].substring(1, widget.newsDetails['content'].length-15)+ "..."),
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                    TextSpan(
                      text: (widget.newsDetails['content'] != null ? 'To read more go to website by clicking the dock button.' : ''),
                      style: const TextStyle(fontSize: 16.5, fontWeight: FontWeight.w600)
                    )
                  ])),
                ],
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
              onPressed: () => websiteLaunching(),
              child: const Icon(Icons.next_plan_outlined, color: Colors.white,)    //Icon(Icons.next_plan_outlined, size: 24, color: Colors.white,
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
