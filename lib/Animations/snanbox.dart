import 'package:flutter/material.dart';
class Sanbox extends StatefulWidget {
  @override
  _SanboxState createState() => _SanboxState();
}

class _SanboxState extends State<Sanbox> {

  double _margin = 0;
  double _opacity = 1;
  double _width =200;
  Color _color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:AnimatedContainer(
        duration: Duration(seconds: 1),
        margin: EdgeInsets.all(_margin),
        width: _width ,
        color: _color,
        child: Column(children: <Widget>[
              // ignore: deprecated_member_use
              RaisedButton(
                child: Text('animated margin'),
                onPressed: () => setState(() => _margin = 50)
                
                ),

                 // ignore: deprecated_member_use
                 RaisedButton(
                child: Text('animated color'),
                onPressed: () => setState(() => _color = Colors.pinkAccent)
                
                ),
 // ignore: deprecated_member_use
 RaisedButton(
                child: Text('animated color'),
                onPressed: () => setState(() => _width = 500)
                
                ),

                 // ignore: deprecated_member_use
                 RaisedButton(
                child: Text('animated opacity'),
                onPressed: () => setState(() => _opacity=0)
                
                ),
                AnimatedOpacity(
                  opacity: _opacity, 
                  duration: Duration(seconds: 2),
                  child: Text('Hide me',
                  style: TextStyle(color: Colors.white),),
                  )
        ],),
        ),
    );
  }
}