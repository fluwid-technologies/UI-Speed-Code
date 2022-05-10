import 'package:dot_navigation_bar/dot_navigation_bar.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
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
  List images = [
    "assets/images/Weights2.png",
    "assets/images/Cardio.png",
    "assets/images/Stretching.png",
    "assets/images/Yoga.png"
  ];
  List names = ["Weights", "Cardio", "Stretching", "Yoga"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: const DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("assets/images/Drive.png"))),
          ),
        ),
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.grey.shade100,
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: Icon(
              Icons.star,
              size: 30,
              color: Colors.orangeAccent,
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
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
                            const Text(
                              "Hi Prakhar,",
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Get in Shape",
                              style: TextStyle(
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.8)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 8),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xFFFF5200),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 4.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(3.0, 3.0), // shadow direction: bottom right
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 25, 0, 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white54,
                                      borderRadius: BorderRadius.circular(15.0)),
                                  child: const Text("Entry-Level",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, color: Colors.white)),
                                ),
                                const Text(
                                  "Running",
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
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
                                      child: const Icon(Icons.play_arrow, color: Color(0xFFFF5200)),
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
                      ),
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
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Text(
                    "Popular Exercises",
                    style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                    decoration: BoxDecoration(
                        color: Colors.orange.shade200, borderRadius: BorderRadius.circular(15.0)),
                    child: const Text("View All",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Expanded(
                    child: Container(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: names.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Color(0xFFA1E3D8),
                                    borderRadius: BorderRadius.circular(13.0),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 4.0,
                                        spreadRadius: 2.0,
                                        offset: Offset(2.0, 2.0), // shadow direction: bottom right
                                      )
                                    ]),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(20, 30, 0, 30),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Muscle Training",
                                            style: GoogleFonts.festive(
                                                fontSize: 20.0, fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Amateur Level",
                                            style: GoogleFonts.alexBrush(
                                                fontSize: 17.0, fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "25 items",
                                            style: GoogleFonts.alexBrush(fontSize: 14.0),
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      left: 140,
                                      top: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                        child: Container(
                                          height: 180,
                                          width: 180,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(images[index]))),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ],
            )
          ],
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
