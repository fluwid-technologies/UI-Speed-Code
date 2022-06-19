import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'datacontainer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.poppins().fontFamily,
        canvasColor: Colors.white,
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double yourWidth = width / 5;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: const Text(
          'WhatsApp',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              size: 25.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.more_vert,
              size: 25.0,
            ),
          )
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          // padding: ,
          indicatorPadding: const EdgeInsets.all(0),
          indicatorSize: TabBarIndicatorSize.tab,
          isScrollable: true,
          controller: _tabController,
          tabs: [
            Container(
              width: 30,
              height: 50,
              alignment: Alignment.center,
              child: const Icon(Icons.camera_alt),
            ),
            Container(
                width: yourWidth,
                height: 50,
                alignment: Alignment.center,
                child: const Text(
                  "CHATS",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                )),
            Container(
                width: yourWidth,
                height: 50,
                alignment: Alignment.center,
                child: const Text("STATUS",
                    style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600))),
            Container(
                width: yourWidth,
                height: 50,
                alignment: Alignment.center,
                child: const Text("CALL",
                    style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600)))
          ],
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        itemExtent: 80.0,
        children: contentData,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF075E54),
        child: const Icon(Icons.chat),
      ),
    );
  }
}

class ScreenContent extends StatelessWidget {
  final String? imgUrl;
  final String? name;
  final String? message;
  final String? time;
  const ScreenContent({Key? key, this.imgUrl, this.name, this.message, this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  imgUrl!,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              name!,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
            ),
            subtitle: Text(
              message!,
              maxLines: 1,
            ),
            trailing: Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      time!,
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey.shade700),
                    )),
              ],
            ),
          ),
        ),
        // const Padding(
        //   padding: EdgeInsets.only(left: 85, right: 10),
        //   child: Divider(
        //     thickness: 0.5,
        //   ),
        // ),
      ],
    );
  }
}
