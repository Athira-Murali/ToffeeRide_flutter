import 'package:background_music/ToffeeRideScreens/Boyorgirl.dart';
import 'package:background_music/ToffeeRideScreens/ClassSelect.dart';
import 'package:background_music/ToffeeRideScreens/childname.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool changeColor1 = false;
  bool changeColor2 = false;
  bool changeColor3 = false;
  bool changeColor4 = false;
  bool changeColorboy = false;
  bool changeColorgirl = false;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: pageController,
      children: [
        Container(
          child: ClassSelect(
            c1color: !changeColor1 ? Colors.pink : Colors.greenAccent[400],
            c2color: !changeColor2 ? Colors.pink : Colors.greenAccent,
            c3color: !changeColor3 ? Colors.pink : Colors.greenAccent,
            c4color: !changeColor4 ? Colors.pink : Colors.greenAccent,
            c1onPress: () {
              setState(() {
                this.changeColor1 = !this.changeColor1;
              });
              pageController.animateToPage(1,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInBack);
            },
            c2onPress: () {
              setState(() {
                this.changeColor2 = !this.changeColor2;
              });
              pageController.animateToPage(1,
                  duration: Duration(milliseconds: 400), curve: Curves.easeIn);
            },
            c3onPress: () {
              setState(() {
                this.changeColor3 = !this.changeColor3;
              });
              pageController.animateToPage(1,
                  duration: Duration(milliseconds: 400), curve: Curves.easeIn);
            },
            c4onPress: () {
              setState(() {
                this.changeColor4 = !this.changeColor4;
              });
              pageController.animateToPage(1,
                  duration: Duration(milliseconds: 400), curve: Curves.easeIn);
            },
          ),
        ),

//select girl or boy
        Container(
          child: BoyGirl(
            colorBoy: !changeColorboy ? Colors.pink : Colors.greenAccent[200],
            colorGirl: !changeColorgirl ? Colors.pink : Colors.greenAccent[200],

            //boy select
            onPressBoy: () {
              setState(() {
                this.changeColorboy = !this.changeColorboy;
              });
              pageController.animateToPage(2,
                  duration: Duration(milliseconds: 400), curve: Curves.easeIn);
            },
            onPressGirl: () {
              setState(() {
                this.changeColorgirl = !this.changeColorgirl;
              });
              pageController.animateToPage(2,
                  duration: Duration(milliseconds: 400), curve: Curves.easeIn);
            },
          ),
        ),
//end

 // Child Name Page
          Container(
            child: Childname(),
          ),


      ],
    ));
  }
}
