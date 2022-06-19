import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarSelected extends StatefulWidget {
  const AvatarSelected({Key? key, required this.url, required this.index}) : super(key: key);
  final String url;
  final int index;
  @override
  State<AvatarSelected> createState() => _AvatarSelectedState();
}

class _AvatarSelectedState extends State<AvatarSelected> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "demotag",
              child: Image.network(
                "${widget.url}${widget.index}",
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              "You are all set!",
              style: TextStyle(color: Colors.black54, fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
