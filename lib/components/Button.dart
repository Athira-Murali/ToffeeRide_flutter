

import 'package:flutter/material.dart';

class IconBtn extends StatelessWidget {

  IconBtn({this.onPress, this.buttonIcon, this.buttoncolor, buttonAction});

  final Function onPress;
  final IconData buttonIcon;
  final Color buttoncolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.only(right: 10, top: 25),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(20),
      ),

      child: IconButton(
        onPressed: onPress,
        icon: Icon(buttonIcon,
          color: buttoncolor,size: 35,
         ),
       
      ),
    );
  }
}

