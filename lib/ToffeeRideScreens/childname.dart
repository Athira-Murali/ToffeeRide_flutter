import 'package:background_music/ToffeeRideScreens/Main/TaskScreen.dart';
import 'package:background_music/components/pinkButton.dart';
import 'package:background_music/components/styles.dart';
import 'package:background_music/widgets/background.dart';
import 'package:flutter/material.dart';

class Childname extends StatefulWidget {
  const Childname({Key key}) : super(key: key);

  @override
  _ChildnameState createState() => _ChildnameState();
}

class _ChildnameState extends State<Childname> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SkyBackground(),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 9.5,
                ),
                Text('child name', style: title),
                SizedBox(height: MediaQuery.of(context).size.height / 10),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width / 9,
                      MediaQuery.of(context).size.height * .01,
                      MediaQuery.of(context).size.width / 9,
                      MediaQuery.of(context).size.height * .01),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'enter child name',
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(width: 0, color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 0,
                          color: Colors.white,
                        ))),
                  ),
                ),
                PinkButtonSmall(
                   onPress: () {
                     
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => TaskScreen()));
                    },
                  text: 'Continue',
                  buttoncolor: Colors.pink,
                )
              ],
            ),
          ))
    ]);
  }
}
