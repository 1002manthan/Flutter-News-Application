import 'package:flutter/material.dart';
import 'package:news_application_flutter/screens/home_screen.dart';
import 'package:news_application_flutter/screens/business_screen.dart';
import 'package:news_application_flutter/screens/tech_screen.dart';
import 'package:news_application_flutter/screens/categories_screen.dart';
import 'package:news_application_flutter/screens/about_us_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Raleway'
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {

  @override
  void initState(){
    super.initState();
    HomeScreenState();
  }

  var selectedIndex = 0;
  String number = "";
  String settings = "";
  String mail = "";
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> screens = [
    const HomeScreen(),
    const BusinessScreen(),
    const TechScreen(),
    const CategoriesScreen()
  ];

  List<String> drawerName = [
    'Account',
    'Email us',
    'Setting',
    'About us',
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red.shade800,
        title: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54.withOpacity(0.3),
                      offset: Offset.zero,
                      blurRadius: 18
                  )
                ]
            ),
            child: const Text(
              "News17",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )
        ),
        iconTheme: IconThemeData(color: Colors.white, shadows: [BoxShadow(color: Colors.black54.withOpacity(0.3), offset: Offset.zero, blurRadius: 18)]),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                  color: Colors.red.shade600
              ),
              accountName: const Text("Manthan17", style: TextStyle(fontWeight: FontWeight.bold),),
              accountEmail: const Text("manthan@info.com"),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.black45,
                foregroundColor: Colors.white,
                child: ClipRRect(
                  child: Text("M", style: TextStyle(fontSize: 20),),
                ),
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.key),
                  title: const Text("Account", style: TextStyle(fontWeight: FontWeight.bold),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsScreen(drawerName[0])));
                  },
                ),
                const Divider(
                  height: 2,
                ),
                ListTile(
                  leading: const Icon(Icons.email_outlined),
                  title: const Text("Email us", style: TextStyle(fontWeight: FontWeight.bold),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsScreen(drawerName[1])));
                  },
                ),
                const Divider(
                  height: 2,
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings", style: TextStyle(fontWeight: FontWeight.bold),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsScreen(drawerName[2])));
                  },
                ),
                const Divider(
                  height: 2,
                ),
                ListTile(
                  leading: const Icon(Icons.people_alt_outlined),
                  title: const Text("About us", style: TextStyle(fontWeight: FontWeight.bold),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsScreen(drawerName[3])));
                  },
                )
              ],
            ),
            const Divider(
              height: 2,
            )
          ],
        ),
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.white,
                  offset: Offset.zero,
                  blurRadius: 16,
                  spreadRadius: 10
              )
            ],
            color: Colors.black, borderRadius: BorderRadius.circular(40)),
        height: 83,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.white,
          unselectedFontSize: 7,
          selectedItemColor: Colors.red.shade800,
          selectedFontSize: 12,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Icon(Icons.home_outlined),
                label: 'HOME',
                tooltip: 'Common News'),
            BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Icon(Icons.business),
                label: 'BUSINESS',
                tooltip: 'Business News'),
            BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Icon(Icons.rss_feed_rounded),
                label: 'TECHNOLOGY',
                tooltip: 'Tech News'),
            BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Icon(Icons.newspaper_outlined),
                label: 'CATEGORIES',
                tooltip: 'All Categories'),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ),
      ),
    );
  }
}
