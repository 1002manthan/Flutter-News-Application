import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class AboutUsScreen extends StatelessWidget {
  static Uri? url;
  String? msg;
  void launchGithub() async{
    url = Uri.parse('https://github.com/1002manthan');
    try{
      launchUrl(url!);
    }catch(err){
      msg="can't open";
    }
  }

  void launchLinkedin() async{
    url = Uri.parse('https://www.linkedin.com/in/manthan-suthar-9138002a3/');
    try{
      launchUrl(url!);
    }catch(err){
      msg="can't open";
    }
  }

  AboutUsScreen(this.pageName, {super.key});
  String? pageName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red.shade600,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black54.withOpacity(0.3),
                  offset: Offset.zero,
                  blurRadius: 18)
            ]),
            child: const Text(
              "News17",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Details About Developer",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              const Icon(
                Icons.account_circle_rounded,
                size: 68,
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.blueGrey,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12),  topRight: Radius.circular(12))
                ),
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Developer",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Manthan Suthar",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 1,
                color: Colors.black,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.blueGrey),
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Study (Aug/24)",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "CE (Diploma, Sem 5)",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 1,
                color: Colors.black,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.blueGrey),
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Description by developer",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "This Application is Outcome of the internship I did in 5th semester of CE (Diploma).",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 1,
                color: Colors.black,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.blueGrey),
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Internship duration",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "6 Weeks (27-June-2024 to 07-August-2024)",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 1,
                color: Colors.black,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.blueGrey),
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Company of Internship",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Infolabz IT Services Pvt. LTd.",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 1,
                color: Colors.black,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.blueGrey,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                ),
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Information about internship",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Flutter (Cross-platform application development language), Dart (Fully object-oriented programming language)",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 85,
                        child: ElevatedButton(
                            onPressed: (){
                              launchGithub();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                )
                            ),
                            child: Image.asset('assets/Images/github.png', height: 50, width: 50,)
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Opacity(
                        opacity: 0.6,
                        child: Text('My Github', style: TextStyle(fontSize: 12.5),),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 85,
                        child: ElevatedButton(
                            onPressed: (){
                              launchLinkedin();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                )
                            ),
                            child: Image.asset('assets/Images/linkedin.png', height: 50, width: 50,)
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Opacity(
                        opacity: 0.6,
                        child: Text('My LinkedIn', style: TextStyle(fontSize: 12.5),),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Opacity(
                opacity: 0.5,
                child: Text( pageName == 'About us' ? '' : 'The $pageName Page is under construction.'),
              ),
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
                      spreadRadius: 2)
                ]),
          ),
          FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: Colors.blueGrey,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 7.2),
              child: Icon(
                Icons.arrow_back_ios,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.white,
              offset: Offset.zero,
              blurRadius: 16,
              spreadRadius: 10)
        ]),
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
