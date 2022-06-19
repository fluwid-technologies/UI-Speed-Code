import 'package:flutter/material.dart';
import 'package:concentric_transition/page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
  List<dynamic> pages = [
    "https://ouch-cdn2.icons8.com/S8KXTdQ-zmk5mUNiDkAOF1o-3rkrhvkjSHHGxtThjKQ/rs:fit:256:256/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMzA1/LzUyN2YzMzAzLTRm/M2MtNDJhMC05MmRj/LTJjY2MwOWFjNzM1/NC5zdmc.png",
    "https://ouch-cdn2.icons8.com/2XLYqUFXzbFj2cMbYqLpZ5zEmwhZUa260ZTVS1xmpX0/rs:fit:256:256/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvOTUw/LzkwNzBlNzRjLWUx/MjAtNGFlOC1hMTVm/LTNlOGY2NTdmMTY0/Mi5wbmc.png",
    "https://ouch-cdn2.icons8.com/-rgir3gqXlVvgux8p8kIVILaYv9HxcvuxZ1CNRk55fs/rs:fit:256:256/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvMzgw/L2UxOTNkZGQwLTE5/OTktNDhmYS05MmZl/LWNjYTJlZTNmZWVi/ZC5wbmc.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
          radius: 35,
          colors: const [Color(0xff93b7d8), Color(0xffd7b6da), Color(0xff8d8dca)],
          itemBuilder: (int index) {
            int pindex = index % pages.length;
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(pages[pindex], ),
                ],
              ),
            );
          }),
    );
  }
}
