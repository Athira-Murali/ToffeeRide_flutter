import 'package:background_music/components/pinkButton.dart';
import 'package:background_music/components/styles.dart';
import 'package:background_music/widgets/background.dart';
import 'package:flutter/material.dart';

class BoyGirl extends StatefulWidget {
  BoyGirl({this.onPressBoy, this.onPressGirl, this.colorBoy, this.colorGirl});
  final Function onPressBoy;
  final Function onPressGirl;
  final Color colorBoy;
  final Color colorGirl;

  @override
  _BoyGirlState createState() => _BoyGirlState();
}

class _BoyGirlState extends State<BoyGirl> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SimpleBackground(),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 9.5),
                  Text(
                    "My child is a",
                    style: title,
                  ),
                  Container(
                      child: Image.asset(
                    "assets/toffee/icon2.png",
                    height: MediaQuery.of(context).size.height * .1,
                  )),
                  Center(
                      child: PinkButtonSmall(
                    text: 'Boy',
                    onPress: widget.onPressBoy,
                    buttoncolor: widget.colorBoy,
                  )),
                  Container(
                    height: 50,
                    child: Image.asset(
                      "assets/toffee/icon3.png",
                      height: MediaQuery.of(context).size.height * 1,
                    ),
                  ),
                  Center(
                    child: PinkButtonSmall(
                        text: 'Girl',
                        onPress: widget.onPressGirl,
                        buttoncolor: widget.colorGirl),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
