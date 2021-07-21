import 'package:flutter/material.dart';


class SkyBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/toffee/sky1.jpg'),
            fit: BoxFit.cover
          )
        ),
    );
  }
}

class SimpleBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
         color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/toffee/iconBg.png'),
            fit: BoxFit.cover
          )
        ),
    );
  }
}


class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.fill,
          
        ),
        ),
      
    );
  }
}

class BookBgImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.jpg'),
          fit: BoxFit.fill,
          
        ),
        ),
      
    );
  }
}