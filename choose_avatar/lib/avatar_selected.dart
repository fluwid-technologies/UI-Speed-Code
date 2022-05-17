import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarSelected extends StatefulWidget {
  const AvatarSelected({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  State<AvatarSelected> createState() => _AvatarSelectedState();
}

class _AvatarSelectedState extends State<AvatarSelected> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Hero(
          tag: "demotag",
          child: Image.network(
            widget.url,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
