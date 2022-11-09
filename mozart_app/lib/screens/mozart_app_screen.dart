import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mozart_app/models/item_model.dart';

class MozartAppScreen extends StatefulWidget {
  @override
  _MozartAppScreenState createState() => _MozartAppScreenState();
}

class _MozartAppScreenState extends State<MozartAppScreen> {
  final List<Item> items = [
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

  final AudioPlayer audioPlayer = AudioPlayer();

  int? playingIndex;

  Widget showIcon(int currentIndex) {
    if (playingIndex == currentIndex) {
      return Icon(Icons.stop);
    } else {
      return Icon(Icons.play_arrow);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(items[index].imagePath),
                    ),
                  ),
                  child: ListTile(
                    title: Text(items[index].name),
                    leading: IconButton(
                      icon: showIcon(index),
                      onPressed: (() {
                        if (playingIndex == index) {
                          audioPlayer.stop();

                          setState(() {
                            playingIndex = null;
                          });
                        } else {
                          audioPlayer.setAsset(items[index].audioPath);
                          audioPlayer.play();

                          setState(() {
                            playingIndex = index;
                          });
                        }
                      }),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
