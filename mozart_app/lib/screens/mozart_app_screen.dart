import 'package:flutter/material.dart';
import 'package:mozart_app/models/item_model.dart';

class MozartAppScreen extends StatefulWidget {
  @override
  _MozartAppScreenState createState() => _MozartAppScreenState();
}

class _MozartAppScreenState extends State<MozartAppScreen> {
  final List<Item> item = [
    Item(
      name: 'One',
      imagePath: 'image/mozart-compose.jpg',
      audioPath: 'audio/mozart.mp3',
    ),
    Item(
      name: 'Two',
      imagePath: 'image/mozart.jpg',
      audioPath: 'audio/mozart_40.mp3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 50,
              color: Colors.yellow,
              child: Text(item[0].name),
            ),
            Container(
              height: 50,
              color: Colors.green,
              child: Text(item[1].name),
            ),
          ],
        ),
      ),
    );
  }
}
