import 'dart:math';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

const instagramColors = [
  Color(0xFFfeda75),
  Color(0xfffa7e1e),
  Color(0xffd62976),
  Color(0xff962fbf),
  Color(0xff4f5bd5),
];

const StoryData = [
  StoryContent(
    imgUrl: 'https://media.giphy.com/media/G3FNI3FneNjiw/giphy.gif',
    name: 'Your Story',
  ),
  StoryContent(
    imgUrl: 'https://media.giphy.com/media/10UIAGM7uyvcUo/giphy.gif',
    name: 'Sasuke',
  ),
  StoryContent(
    imgUrl: 'https://media.giphy.com/media/aY1HMl4E1Ju1y/giphy.gif',
    name: 'Kakashi',
  ),
  StoryContent(
    imgUrl: 'https://media.giphy.com/media/kiOGNdQMj04SI/giphy.gif',
    name: 'Sakura',
  ),
  StoryContent(
    imgUrl: 'https://media.giphy.com/media/7BW9U2cJPQZ0s/giphy.gif',
    name: 'Lufi',
  ),
  StoryContent(
    imgUrl: 'https://media.giphy.com/media/OaHp43V1N4OvC/giphy.gif',
    name: 'Natsu Dragneel',
  ),
  StoryContent(
    imgUrl: 'https://media.giphy.com/media/PivTIVskYVjOfPaSw7/giphy.gif',
    name: 'Happy',
  ),
  StoryContent(
    imgUrl: 'https://media.giphy.com/media/skuD9hdP64chi/giphy.gif',
    name: 'Gray',
  ),
  StoryContent(
    imgUrl: 'https://media.giphy.com/media/13n7XeyIXEIrbG/giphy.gif',
    name: 'IamMeme',
  ),
];

class StoryContent extends StatelessWidget {
  final String? imgUrl;
  final String? name;
  const StoryContent({Key? key, required this.imgUrl, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                width: 78,
                height: 78,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(95),
                    gradient: const LinearGradient(
                      colors: instagramColors,
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    )),
              ),
              const CircleAvatar(
                radius: 37,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                radius: 34,
                backgroundImage: NetworkImage(imgUrl!),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            name!,
            style:
                const TextStyle(color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

const PostData = [
  Post(
    userName: 'Sakura',
    userImage: 'https://media.giphy.com/media/kiOGNdQMj04SI/giphy.gif',
    image:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
  ),
  Post(
    userName: 'fluwid',
    userImage: 'https://media.giphy.com/media/spHCUbRqG4cjS/giphy.gif',
    image:
        'https://images.unsplash.com/photo-1524250502761-1ac6f2e30d43?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80',
  ),
  Post(
    userName: 'Gray',
    userImage: 'https://media.giphy.com/media/skuD9hdP64chi/giphy.gif',
    image:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80',
  ),
  Post(
    userName: 'Sasuke',
    userImage: 'https://media.giphy.com/media/10UIAGM7uyvcUo/giphy.gif',
    image:
        'https://images.unsplash.com/photo-1474447976065-67d23accb1e3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80',
  ),
];

class Post extends StatelessWidget {
  final String? userName;
  final String? userImage;
  final String? image;
  const Post({Key? key, this.image, this.userImage, this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: Image.network(userImage!),
                      ),
                    ),
                  ),
                  Text(
                    userName!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.more_horiz,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: Image.network(
            image!,
            filterQuality: FilterQuality.high,
            fit: BoxFit.contain,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/heart.png',
                    color: Colors.black,
                    height: 30.0,
                  ),
                  const SizedBox(width: 16.0),
                  const Icon(
                    LineIcons.commentsAlt,
                    color: Colors.black,
                    size: 25.0,
                  ),
                  const SizedBox(width: 16.0),
                  Transform.translate(
                    offset: Offset(0.0, -3.5),
                    child: Transform.rotate(
                      angle: 335 * pi / 180,
                      child: const Icon(
                        Icons.send,
                        color: Colors.black,
                        size: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.bookmark_border,
                color: Colors.black,
                size: 25.0,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            "Liked by Lufi and thousands of others",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: RichText(
            text: TextSpan(
              text: userName,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: " Today's Progress!!..",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            "Show comments",
            style: TextStyle(
              color: Colors.black.withOpacity(0.75),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            "21 minutes ago",
            style: TextStyle(
              color: Colors.black.withOpacity(0.75),
              fontSize: 10.0,
            ),
          ),
        )
      ],
    );
  }
}
