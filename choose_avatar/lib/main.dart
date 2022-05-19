import 'package:choose_avatar/avatar_selected.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

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
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.montserrat().fontFamily,
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
  int? selected;
  List<dynamic> avatar = [
    {
      "name": "SpiderMan",
      "imgUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrigm7Iklm62D_zuZBOknJbCHZDibm6j1UEg&usqp=CAU"
    },
    {
      "name": "IronMan",
      "imgUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUvYaJOC1XJEMneXwSLCUizp-FaD-75JIxkg&usqp=CAU",
    },
    {
      "name": "Captain America",
      "imgUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdlQYj2gj9Xqz0zLXmJuzftf_ADfxvX_cq1w&usqp=CAU",
    },
    {
      "name": "Hulk",
      "imgUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs5jPqimEk8lmmIEt-LSSGlVDVs7p-AUVxQg&usqp=CAU",
    },
    {
      "name": "Black Panther",
      "imgUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOrkyviOGe1pwIpWvXBOpVPH3R6GroNSHbrQ&usqp=CAU",
    },
    {
      "name": "Doctor Strange",
      "imgUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ81BQK2XQCSJa_hSs90RiO9wD4EFkCG9gwkQ&usqp=CAU",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Choose A Avatar For You",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white),
                ),
                const SizedBox(
                  height: 25,
                ),
                GridView.builder(
                    itemCount: avatar.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 30,
                    ),
                    itemBuilder: (cotext, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: selected == index ? Colors.amber : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Hero(
                                tag: "demotag$index",
                                child: Image.network(
                                  avatar[index]["imgUrl"],
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: selected == null ? Colors.grey : Colors.amber,
        onPressed: selected == null
            ? null
            : () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AvatarSelected(
                              url: avatar[selected!]["imgUrl"],
                              index: selected!,
                            )));
              },
        label: const Text(
          "Done",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
