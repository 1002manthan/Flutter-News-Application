import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreenCategory extends StatefulWidget {
  const SplashScreenCategory({super.key});

  @override
  State<SplashScreenCategory> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreenCategory> with SingleTickerProviderStateMixin{
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
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white38
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.newspaper,
              size: 55,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Connecting to internet",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
            LoadingAnimationWidget.newtonCradle(
                color: Colors.black,
                size: 50
            )
          ],
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
