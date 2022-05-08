import 'package:flutter/material.dart';
import 'package:netflix_ui_speedcode/DataContainer/DataObjects.dart';

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
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'BebasNeue'),
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
      body: Container(
        color: Colors.black,
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Stack(
              children: [
                ShaderMask(
                  child: Container(
                    width: double.infinity,
                    height: 530,
                    child: Image.asset(
                      "assets/images/LovePoster.jpg",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black87,
                          Colors.white60,
                          Colors.white,
                          Colors.redAccent,
                          Colors.black
                        ]).createShader(bounds);
                  },
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/images/logo.ico"))),
                          ),
                        ),
                        Expanded(child: Container()),
                        const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/images/Drive.png"))),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: const Text(
                              "TV SHOWS",
                              style: TextStyle(fontSize: 25.0, color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: const Text("Movies",
                                style: TextStyle(fontSize: 25.0, color: Colors.white)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: const Text("Categories",
                                style: TextStyle(fontSize: 25.0, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 300,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            child: const Text(
                              "Gritty.Dark.Western.Love.Stories.Romantic.Binge",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.white, letterSpacing: 1.5),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 35.0,
                              ),
                              Container(
                                child: const Text(
                                  "My List",
                                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 2, 12, 2),
                            child: Center(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                    size: 35.0,
                                  ),
                                  Text("Play",
                                      style: TextStyle(fontSize: 25.0, color: Colors.black)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.info_outline,
                                color: Colors.white,
                                size: 35.0,
                              ),
                              Container(
                                child: const Text(
                                  "Info",
                                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            categoryGenerator("Trending Now", trendingNow),
            const SizedBox(
              height: 10.0,
            ),
            categoryGenerator("International TV Shows", internationalTVShows),
            const SizedBox(
              height: 10.0,
            ),
            categoryGenerator("Made in India", madeInIndia),
            const SizedBox(
              height: 10.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Text("Top 10 TV Shows in India Today",
                      style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                Container(
                  height: 220,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 200,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 20.0,
                                top: 0.0,
                                bottom: 0.0,
                                right: 0.0,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(),
                                    ),
                                    Container(
                                      height: 220,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(5.0),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                            top10[index]['img'],
                                          ),
                                        ),
                                      ),
                                      width: 165,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: -90.0,
                                bottom: -25.0,
                                top: 60,
                                right: 30.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      fit: BoxFit.scaleDown,
                                      image: AssetImage(
                                        top10[index]['img1'],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        selectedFontSize: 12.0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.new_label), label: 'New'),
          BottomNavigationBarItem(icon: Icon(Icons.file_download), label: 'Download')
        ],
      ),
    );
  }

  Widget categoryGenerator(String categoryName, List category) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
            child: Text(categoryName, style: TextStyle(fontSize: 30, color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
            child: Container(
                height: 200,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5.0),
                              image: DecorationImage(
                                  fit: BoxFit.cover, image: AssetImage(category[index]['img']))),
                        ),
                      );
                    })),
          )
        ],
      ),
    );
  }
}
