import 'package:background_music/widgets/background.dart';
import 'package:flutter/material.dart';

class Selector extends StatefulWidget {
  const Selector({Key key}) : super(key: key);

  @override
  _SelectorState createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {
  //bool selected = false;
  bool moveIt = false;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    
                            



                        



                  ]),
            ]),
      ),
    ]);
  }
}
