import 'package:background_music/ToffeeRideScreens/Home.dart';
import 'package:background_music/ToffeeRideScreens/Main/TaskScreen.dart';
import 'package:background_music/ToffeeRideScreens/Numberlogin.dart';
import 'package:background_music/components/UnderlineButton.dart';
import 'package:background_music/components/pinkButton.dart';
import 'package:background_music/components/styles.dart';
import 'package:background_music/widgets/background.dart';
import 'package:flutter/material.dart';

class EmailLogin extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<EmailLogin> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SkyBackground(),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: SafeArea(
                  child: Form(
                child: Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 9.5,
                  ),
                  Text('Login here', style: title),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 11,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width / 9,
                        MediaQuery.of(context).size.height * .01,
                        MediaQuery.of(context).size.width / 9,
                        MediaQuery.of(context).size.height * .01),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) => input.contains('@')
                          ? "Email Id should be valid"
                          : null,
                      decoration: InputDecoration(
                          hintText: 'enter the email address',
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(width: 0, color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                            width: 0,
                            color: Colors.white,
                          ))),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  PinkButtonSmall(
                    text: 'Continue',
                    buttoncolor: Colors.pink,
                    onPress: () {
                      print('button continue');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => TaskScreen()));
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  UnderlineBtn(
                    buttonAction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NumberLogin()),
                      );
                    },
                    buttonText: "Login with mobile",
                  ),
                
       SizedBox(height: MediaQuery.of(context).size.height / 35),

                    UnderlineBtn(
                      buttonAction: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      buttonText: "New User? Sign up now",
                    ),
                ]),
              )),
            ))
      ],
    );
  }
}
