import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
        fontFamily: GoogleFonts.montserrat().fontFamily,
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
  CarouselController _controller = CarouselController();
  int current = 0;
  List<dynamic> movies = [
    {
      'title': 'Spider-Man: No Way Home',
      'imgUrl':
          'https://terrigen-cdn-dev.marvel.com/content/prod/1x/snh_online_6072x9000_posed_01.jpg',
    },
    {
      'title': 'Spider-Man: Into The Spider-Verse',
      'imgUrl':
          'https://m.media-amazon.com/images/M/MV5BMjMwNDkxMTgzOF5BMl5BanBnXkFtZTgwNTkwNTQ3NjM@._V1_FMjpg_UX1000_.jpg',
    },
    {
      'title': 'Spider-Man: Far From Home',
      'imgUrl': 'https://i.pinimg.com/736x/30/4a/cc/304acce13de30b9c650ffd12cac55ab6.jpg',
    }
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff121212),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.network(
                movies[current]['imgUrl'],
                fit: BoxFit.contain,
              ),
              Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 3,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Color(0xff121212).withOpacity(0.5),
                        Color(0xff121212).withOpacity(0.5),
                        Color(0xff121212).withOpacity(0.5),
                        Color(0xff121212).withOpacity(0.5),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.5),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )),
                  )),
              Positioned(
                bottom: 40,
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.6,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.5,
                      enlargeCenterPage: true,
                      onPageChanged: (i, r) {
                        setState(() {
                          current = i;
                        });
                      }),
                  carouselController: _controller,
                  items: movies.map((e) {
                    return Builder(builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.32,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    e['imgUrl'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                e['title'],
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              AnimatedOpacity(
                                duration: const Duration(microseconds: 500),
                                opacity: current == movies.indexOf(e) ? 1 : 0.3,
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.white,
          onPressed: () {},
          label: Row(
            children: const [
              Text("Play",
                  style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black54)),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.play_circle_outline, color: Colors.black54),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
