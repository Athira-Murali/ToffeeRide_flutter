import 'package:background_music/components/styles.dart';
import 'package:flutter/material.dart';

class PinkButtonSmall extends StatefulWidget {
  PinkButtonSmall({this.onPress, this.text,this.buttoncolor});
  Function onPress;
  String text;
  Color buttoncolor;

  @override
  _PinkButtonSmallState createState() => _PinkButtonSmallState();
}

class _PinkButtonSmallState extends State<PinkButtonSmall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: null,
       margin: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width / 4.5,
          0,
          MediaQuery.of(context).size.width / 4.5,
          MediaQuery.of(context).size.height * .01),
      child: Row(
        children: [
          Expanded(
            
            child: RaisedButton(
            color: widget.buttoncolor,
            onPressed: widget.onPress,
            child: Text(widget.text,style: buttontext,
            ),
            padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width *.05,
            MediaQuery.of(context).size.height *.025,
            MediaQuery.of(context).size.width * .05,
            MediaQuery.of(context).size.height *.025
            ),
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            ),
            ),
          
      
        ],
      ),
    );
  }
}