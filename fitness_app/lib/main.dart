import 'dart:ui';

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:fitness_app/DataContainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        primarySwatch: Colors.blue,
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
      extendBody: true,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Hi Coders",
          style: GoogleFonts.montserrat(
              color: const Color(0xff121212), fontWeight: FontWeight.w500, fontSize: 20),
        ),
        backgroundColor: Colors.grey.shade200,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xfffd7b45),
                  radius: 22,
                ),
                CircleAvatar(
                  radius: 18,
                  foregroundImage: AssetImage("assets/images/Drive.png"),
                )
              ],
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 320,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Welcome back",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 24,
                                      color: const Color(0xff121212).withOpacity(0.5),
                                      fontWeight: FontWeight.w500)),
                              RichText(
                                text: TextSpan(
                                  text: "Get in ",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 30,
                                      color: const Color(0xff121212),
                                      fontWeight: FontWeight.w500),
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: 'Shape',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold, color: Color(0xFFfd7b45))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 8),
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: const Color(0xFFfd7b45),
                                borderRadius: BorderRadius.circular(32.0)),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(30, 25, 0, 25),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15.0)),
                                    child: Text("Entry-Level",
                                        style: GoogleFonts.montserrat(
                                            letterSpacing: 0.5,
                                            fontSize: 12,
                                            color: const Color(0xFFfd7b45),
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  Text(
                                    "Running",
                                    style: GoogleFonts.montserrat(
                                        letterSpacing: 0.5,
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Text("No Goals completed \nfor today",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, color: Colors.white)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20.0)),
                                        child: const Icon(
                                          Icons.play_arrow,
                                          color: Color(0xFFFF5200),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      const Text(
                                        "30 minutes left",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      top: 0.0,
                      right: 0.0,
                      left: 170.0,
                      bottom: 30.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/Running.png"))),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Text(
                      "Popular Exercises",
                      style: GoogleFonts.montserrat(
                          fontSize: 24,
                          color: const Color(0xff121212),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                      decoration: BoxDecoration(
                          color: Colors.transparent, borderRadius: BorderRadius.circular(15.0)),
                      child: const Text("View All",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFfd7b45),
                          )),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: fitnessData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Color(fitnessData[index]['color'])),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 30, 0, 30),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        fitnessData[index]['name'],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 28.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${fitnessData[index]['level']} Level",
                                        style: const TextStyle(
                                            fontSize: 20.0, fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(12.0)),
                                          child: Text(
                                            fitnessData[index]['Items'],
                                            style: const TextStyle(
                                                fontSize: 14.0, fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 160,
                                  top: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(fitnessData[index]['img']))),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: DotNavigationBar(
        currentIndex: 0,
        onTap: (value) {
          print(value);
        },
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            spreadRadius: 3.0,
            offset: Offset(1.0, 1.0), // shadow direction: bottom right
          )
        ],
        // dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: Icon(Icons.home),
            selectedColor: Colors.purple,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            selectedColor: Colors.pink,
          ),

          /// Search
          DotNavigationBarItem(
            icon: Icon(Icons.search),
            selectedColor: Colors.orange,
          ),

          /// Profile
          DotNavigationBarItem(
            icon: Icon(Icons.person),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
