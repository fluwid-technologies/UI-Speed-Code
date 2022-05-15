import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'dart:math';

import 'Data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        canvasColor: Colors.white,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          showSelectedLabels: false,
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  LineIcons.home,
                  color: Colors.black,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  LineIcons.search,
                  color: Colors.black,
                ),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(
                  LineIcons.playCircleAlt,
                  color: Colors.black,
                ),
                label: "Reels"),
            BottomNavigationBarItem(
                icon: Icon(
                  LineIcons.heart,
                  color: Colors.black,
                ),
                label: "Heart"),
            BottomNavigationBarItem(
                icon: Icon(
                  LineIcons.userCircle,
                  color: Colors.black,
                ),
                label: "Account"),
          ],
        ),
        body: SafeArea(
            child: Column(
          children: [
            Row(
              textBaseline: TextBaseline.ideographic,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5),
                  child: Image.asset(
                    'assets/instagram.png',
                    width: 120,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add_box_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        LineIcons.facebookMessenger,
                        color: Colors.black,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              height: 114,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: StoryData,
                ),
              ),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              height: 1,
              thickness: 0.6,
            ),
            Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
              children: PostData,
            ))
          ],
        )));
  }
}
