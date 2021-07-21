
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UnderlineBtn extends StatelessWidget {
  UnderlineBtn({
    this.buttonAction,
    this.buttonText,
  });

  @required
  void Function() buttonAction;
  @required
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      child: InkWell(
                      
                      onTap: buttonAction,
                      hoverColor: Colors.grey,
                      child: Text(
                         buttonText,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
    );
   
    
  }
}
