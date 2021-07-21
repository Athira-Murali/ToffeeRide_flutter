import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

AudioPlayer player = AudioPlayer();

class ColorMatching extends StatefulWidget {
  const ColorMatching({Key key}) : super(key: key);

  @override
  _ColorMatchingState createState() => _ColorMatchingState();
}

class _ColorMatchingState extends State<ColorMatching> {
//audio
  Function playSound = () {
    player.play();
    return 1;
  };

  final Map<String, bool> score = {};
  final Map<String, Color> choices = {
    '🍎': Colors.red,
    '🥒': Colors.green,
    '🔵': Colors.blue,
    '🍍': Colors.yellow,
    '🥕': Colors.orange,
    '🍇': Colors.purple,
    '🥥': Colors.brown,
  };
  int index = 0;
  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body:
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: choices.keys.map((element) {
              return Expanded(
                  child: Draggable<String>(
                data: element,
                child: Movable(element),
                feedback: Movable(element),
                childWhenDragging: Movable('✔️'),
              ));
            }).toList(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: choices.keys.map((element) {
              return buildTarget(element);
            }).toList()
              ..shuffle(Random(index)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.refresh,
        ),
        onPressed: () {
          setState(() {
            score.clear();
          });
        },
      ),
    );
  }

  Widget buildTarget(emoji) {
    return DragTarget<String>(
      builder: (context, incoming, rejects) {
        if (score[emoji] == true) {
          return Container(
            color: Colors.white,
            child: Text('congrats !'),
            alignment: Alignment.center,
            height: 80,
            width: 200,
          );
        } else {
          return Container(
            color: choices[emoji],
            height: 80,
            width: 200,
          );
        }
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        setState(() {
          score[emoji] = true;

          player.setUrl(
              "https://www2.cs.uic.edu/~i101/SoundFiles/CantinaBand60.wav");
          playSound();
        });
      },
      onLeave: (data) {},
    );
  }
}

class Movable extends StatelessWidget {
  final String emoji;
  Movable(this.emoji);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        padding: EdgeInsets.all(15),
        child: Text(emoji, style: TextStyle(color: Colors.black, fontSize: 60)),
      ),
    );
  }
}
