import 'package:background_music/ToffeeRideScreens/Emaillogin.dart';
import 'package:background_music/ToffeeRideScreens/Home.dart';
import 'package:background_music/ToffeeRideScreens/Main/TaskScreen.dart';
import 'package:background_music/components/UnderlineButton.dart';
import 'package:background_music/components/pinkButton.dart';
import 'package:background_music/components/styles.dart';
import 'package:background_music/widgets/background.dart';
import 'package:country_code_picker/country_code_picker.dart';

import 'package:flutter/material.dart';

class NumberLogin extends StatefulWidget {
  @override
  _NumberLoginState createState() => _NumberLoginState();
}

class _NumberLoginState extends State<NumberLogin> {
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
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 9.5,
                    ),
                    Text(
                      'Login here',
                      style: title,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 11,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * .099,
                          MediaQuery.of(context).size.height * .025,
                          MediaQuery.of(context).size.width * .099,
                          MediaQuery.of(context).size.height * .005),
                      child: CountryCodePicker(
                        initialSelection: 'IN',
                        showDropDownButton: true,
                        //showFlagMain: false,
                        favorite: ['+91', 'IN'],
                        alignLeft: true,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width / 9,
                          MediaQuery.of(context).size.height * .01,
                          MediaQuery.of(context).size.width / 9,
                          MediaQuery.of(context).size.height * .01),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        decoration: InputDecoration(
                            hintText: 'Enter Your Mobile Number',
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
                    PinkButtonSmall(
                      text: 'Continue',
                      buttoncolor: Colors.pink,
                      onPress: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TaskScreen()));
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                  UnderlineBtn(
                              buttonAction: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EmailLogin()),
                                );
                              },
                              buttonText: "Login with Email ",
                            ),
                
                   Positioned(
                     bottom: 0,
                     child:UnderlineBtn(
                              buttonAction: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                );
                              },
                              buttonText: "New User? Sign up now",
                            ), ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
