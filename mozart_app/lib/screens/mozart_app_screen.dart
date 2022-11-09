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
      name: "One",
      imagePath: "image/mozart-compose.jpg",
      audioPath: "audio/mozart.mp3",
    ),
    Item(
      name: "Two",
      imagePath: "image/mozart.jpg",
      audioPath: "audio/mozart_40.mp3",
    ),
  ];

  final AudioPlayer audioPlayer = AudioPlayer();

  int? playingIndex;

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
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(items[index].imagePath),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      items[index].name,
                      style: const TextStyle(
                        fontSize: 22.0,
                        height: 2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    leading: IconButton(
                      iconSize: 50,
                      icon: playingIndex == index
                          ? const Icon(Icons.stop)
                          : const Icon(Icons.play_arrow),
                      onPressed: (() async {
                        if (playingIndex == index) {
                          audioPlayer.stop();

                          setState(() {
                            playingIndex = null;
                          });
                        } else {
                          try {
                            await audioPlayer
                                .setAsset(items[index].audioPath)
                                .catchError((onError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red.withOpacity(0.5),
                                  content: Text("Error"),
                                ),
                              );
                            });
                            audioPlayer.play();

                            setState(() {
                              playingIndex = index;
                            });
                          } catch (error) {
                            print(error);
                          }
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
