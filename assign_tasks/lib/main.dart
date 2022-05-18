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
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.montserrat().fontFamily),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

@immutable
class Missions {
  const Missions({
    required this.name,
    required this.uid,
    required this.imageProvider,
  });
  final String name;
  final String uid;
  final ImageProvider imageProvider;
}

@immutable
class Avengers {
  Avengers({
    required this.onMission,
    required this.name,
    required this.uid,
    required this.imageProvider,
  });
  late bool onMission;
  final String name;
  final String uid;
  final String imageProvider;
}

const List<Missions> _missions = [
  Missions(
    name: 'The Chimera',
    uid: '1',
    imageProvider: NetworkImage(
        'https://i.pinimg.com/originals/6f/24/a9/6f24a9a04bb643c18156a19565f085b8.jpg'),
  ),
  Missions(
    name: 'The End',
    uid: '2',
    imageProvider: NetworkImage(
        'https://static0.gamerantimages.com/wordpress/wp-content/uploads/2020/09/marvels-avengers-ending.jpg?q=50&fit=contain&w=943&h=472&dpr=1.5'),
  ),
  Missions(
      name: 'The First Avenger',
      uid: '3',
      imageProvider: NetworkImage(
          "https://upload.wikimedia.org/wikipedia/en/c/c0/Avengers_2020_cover_art.png")),
];

List<Avengers> _avengers = [
  Avengers(
    name: 'Ironman',
    uid: '1',
    imageProvider: 'https://i.pinimg.com/736x/b2/c8/e5/b2c8e59ebfadb0d172ca281f262485f7.jpg',
    onMission: false,
  ),
  Avengers(
    name: 'Hulk',
    uid: '2',
    imageProvider: 'https://images3.alphacoders.com/113/1138289.jpg',
    onMission: false,
  ),
  Avengers(
      name: 'You',
      uid: '3',
      imageProvider: "https://wallpapercave.com/wp/wp1808944.jpg",
      onMission: false),
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final GlobalKey _draggableKey = GlobalKey();
  List customColors = [0xff93b7d8, 0xffd7b6da, 0xff8d8dca];
  List avengerColors = [0xfff778ba, 0xff6c49fb, 0xffffe5a5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black54),
        actions: const [
          Icon(
            Icons.search,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.notifications,
            size: 30,
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      drawer: const Drawer(),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
                child: Text(
                  "What's up, Captain!",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
                child: Text(
                  "LIST OF MISSIONS",
                  style: TextStyle(
                    letterSpacing: 1,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return LongPressDraggable<Missions>(
                        data: _missions[index],
                        dragAnchorStrategy: pointerDragAnchorStrategy,
                        feedback: DraggingListMission(
                            dragKey: _draggableKey, photoProvider: _missions[index].imageProvider),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(customColors[index]),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                    child: Image(
                                      image: _missions[index].imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Text(
                                  _missions[index].name,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 12,
                      );
                    },
                    itemCount: _missions.length),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
                child: Text(
                  "YOUR TEAM",
                  style: TextStyle(
                    letterSpacing: 1,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                child: Row(
                  children: _avengers.map(_buildAvengerWithDropZone).toList(),
                ),
              )
            ],
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildAvengerWithDropZone(Avengers avenger) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: DragTarget<Missions>(
        builder: (context, missions, rejectedMissions) {
          return AvengerCard(
            avenger: avenger,
            highlighted: missions.isNotEmpty,
          );
        },
        onAccept: (mission) {
          setState(() {
            avenger.onMission = true;
          });
        },
      ),
    ));
  }
}

class AvengerCard extends StatelessWidget {
  const AvengerCard({
    Key? key,
    required this.avenger,
    required this.highlighted,
  }) : super(key: key);

  final Avengers avenger;
  final bool highlighted;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: highlighted ? 1.085 : 1,
      child: Material(
        elevation: highlighted ? 8.0 : 4.0,
        borderRadius: BorderRadius.circular(22.0),
        color: highlighted ? Colors.green : Color(0xff121212),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 24.0,
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const CircleAvatar(
                    radius: 43,
                    backgroundColor: Colors.white,
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      avenger.imageProvider.toString(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(avenger.name,
                  style: TextStyle(
                      fontSize: 16,
                      color: highlighted ? Colors.black54 : Colors.white,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 20.0),
              Visibility(
                visible: avenger.onMission,
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                child: const Text("On Mission",
                    style:
                        TextStyle(fontSize: 14, color: Colors.green, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DraggingListMission extends StatelessWidget {
  const DraggingListMission({
    Key? key,
    required this.dragKey,
    required this.photoProvider,
  }) : super(key: key);

  final GlobalKey dragKey;
  final ImageProvider photoProvider;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FractionalTranslation(
      translation: const Offset(-0.2, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          height: 150,
          width: 150,
          child: Opacity(
            opacity: 0.85,
            child: Image(
              image: photoProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
