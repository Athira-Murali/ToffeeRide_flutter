import 'package:background_music/components/pinkButton.dart';
import 'package:background_music/components/styles.dart';
import 'package:background_music/widgets/background.dart';
import 'package:flutter/material.dart';

class ClassSelect extends StatefulWidget {
  ClassSelect(
      {this.c1onPress,
      this.c1color,
      this.c2onPress,
      this.c2color,
      this.c3onPress,
      this.c3color,
      this.c4onPress,
      this.c4color});

  final Function c1onPress;
  final Color c1color;
  final Function c2onPress;
  final Color c2color;
  final Function c3onPress;
  final Color c3color;
  final Function c4onPress;
  final Color c4color;

  @override
  _ClassSelectState createState() => _ClassSelectState();
}

class _ClassSelectState extends State<ClassSelect> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SkyBackground(),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 9.5,
              ),
              Text(
                "My child is in",
                  style: title,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 11,
              ),

              //pinkbutton  components

              Center(
                child: PinkButtonSmall(
                  buttoncolor: widget.c1color,
                  onPress: widget.c1onPress,
                  text: 'Class 1',
                ),
              ),
              PinkButtonSmall(
                buttoncolor: widget.c2color,
                onPress: widget.c2onPress,
                text: 'Class 2',
              ),
              PinkButtonSmall(
                buttoncolor: widget.c3color,
                onPress: widget.c3onPress,
                text: 'Class 3',
              ),
              Center(
                child: PinkButtonSmall(
                  buttoncolor: widget.c4color,
                  onPress: widget.c4onPress,
                  text: 'Class 4',
                ),
              )
            ],
          )),
        ),
      )
    ]);
  }
}
