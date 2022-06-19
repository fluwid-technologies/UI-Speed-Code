import 'package:carousel_slider/carousel_slider.dart';
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

  List<dynamic> movies = [
    {
      'title': 'Rap God',
      'imgUrl': 'https://m.media-amazon.com/images/I/819IY9RcssL._AC_SS450_.jpg',
    },
    {
      'title': 'Mocking Bird',
      'imgUrl': 'https://m.media-amazon.com/images/I/517xKMN9dDL._AC_UL320_.jpg',
    },
    {
      'title': 'Venom',
      'imgUrl': 'https://i1.sndcdn.com/artworks-696CKxwdzichGwvR-jXj1Gg-t500x500.jpg',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d1a25),
      body: Stack(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white60, Colors.white, Colors.black]).createShader(bounds);
              },
              child: Image.asset("assets/images/image.jpg")),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.6,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.5,
                    enlargeCenterPage: true,
                    onPageChanged: (i, r) {}),
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
                            Image.network(e["imgUrl"]),
                            // Text(
                            //   e['title'],
                            //   style: const TextStyle(
                            //       fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black54),
                            //   textAlign: TextAlign.center,
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
