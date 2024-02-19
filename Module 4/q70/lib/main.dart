// ignore_for_file: unused_import, depend_on_referenced_packages, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _Q70(),
    );
  }
}

class _Q70 extends StatefulWidget {
  _Q70({super.key});

  @override
  State<_Q70> createState() => __Q70State();
}

class __Q70State extends State<_Q70> {
  List items = [GalleryPage(), AudioPage(), VideoPage()];
  int currentindex = 0;
  void tapClick(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: items.elementAt(currentindex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: "Gallery"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.audio_file,
                color: Colors.black,
              ),
              label: "Audio"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.video_call,
                color: Colors.black,
              ),
              label: "Video"),
        ],
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        elevation: 5,
        onTap: tapClick,
        currentIndex: currentindex,
      ),
    );
  }
}

//Gallery Page
class GalleryPage extends StatelessWidget {
  GalleryPage({super.key});
  List images = ['1.jpeg', '2.jpeg', '3.jpeg', '4.jpeg', '5.jpeg', '6.jpeg'];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(images.length, (index) {
          return Container(
            height: 300,
            width: double.maxFinite,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(width: 5),
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    image: AssetImage("images/${images[index]}"),
                    fit: BoxFit.cover)),
          );
        }),
      ),
    );
  }
}

//Video Page
class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Video"),
    );
  }
}

//Audio Page
class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  late AudioPlayer music;
  bool isPlaying = false;
  Source paths = (AssetSource('audio/kftn.mp3'));
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text("Music"),
          trailing: IconButton(
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: () {
              if (isPlaying) {
                pauseAudio();
              } else {
                playAudio();
              }
            },
          ),
        ),
        ListTile(
          leading: Text("Music"),
          trailing: IconButton(
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: () {
              if (isPlaying) {
                pauseAudio();
              } else {
                playAudio();
              }
            },
          ),
        ),
        ListTile(
          leading: Text("Music"),
          trailing: IconButton(
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: () {
              if (isPlaying) {
                pauseAudio();
              } else {
                playAudio();
              }
            },
          ),
        ),
      ],
    );
  }

  Future<void> playAudio() async {
    dynamic result = music.play(paths);
    if (result == 1) {
      setState(() {
        isPlaying = true;
      });
    }
  }

  void initState() {
    super.initState();
    music = AudioPlayer();
  }

  void dispose() {
    music.dispose();
    super.dispose();
  }

  Future<void> pauseAudio() async {
    dynamic result = music.pause();
    if (result == 1) {
      setState(() {
        isPlaying = false;
      });
    }
  }
}
