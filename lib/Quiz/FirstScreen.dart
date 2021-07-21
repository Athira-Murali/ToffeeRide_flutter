import 'package:background_music/Quiz/errorScreen.dart';
import 'package:background_music/components/styles.dart';
import 'package:background_music/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Widget headerButton({
    @required String buttonText,
    @required Color buttonColor,
    @required void Function() buttonAction,
    bool isSelected = false,
  }) {
    return Container(
      width: 250,
      // ignore: deprecated_member_use
      child: FlatButton(
        color: Colors.limeAccent[100],
        splashColor: buttonColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        onPressed: buttonAction,
        child: Text(
          buttonText,
          style: TextStyle(color: isSelected ? Colors.black : Colors.grey),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          'Fill in the blanks. \n'
                          'Plants that are big and Strong are called  \n'
                          '------------',
                          style: heading,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child:
                            Image(image: AssetImage("assets/images/video.png")),
                      ),
                    ],
                  ),

                  //2nd column
                  Row(children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.height * 0.4,
                      color: Colors.red,
                      child: Image(
                        image: AssetImage('assets/images/images.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Column(
                      children: [
                        headerButton(
                          buttonAction: () {
                            print('grass');
                            //Navigator.push(context, ScaleTransition1(ErrorScreen()));
                            Navigator.of(context).pushReplacement(
                              PageTransition(
                                type: PageTransitionType.leftToRightWithFade,
                                child: ErrorScreen(),
                              ),
                            );
                          },
                          buttonColor: Colors.red,
                          buttonText: "grass",
                        ),
                        headerButton(
                          buttonAction: () {
                            print('tree calll');
                            //Navigator.push(context, FadeRoute1(MyCustomWidget())
                            showDialog(
                              context: context,
                              builder: (_) => FunkyOverlay(),
                            );
                          },
                          buttonColor: Colors.green,
                          buttonText: "tree",
                        ),
                        headerButton(
                          buttonAction: () {
                            print('gress');
                            Navigator.of(context).pushReplacement(
                              PageTransition(
                                type: PageTransitionType.leftToRightWithFade,
                                child: ErrorScreen(),
                              ),
                            );
                          },
                          buttonColor: Colors.red,
                          buttonText: "climbers",
                        ),
                      ],
                    )
                  ]),

                  
                ]),
          ),
        ),
      ],
    );
  }
}

class FunkyOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<FunkyOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: 150,
            decoration: ShapeDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('assets/images/particles.jpg'),
                    fit: BoxFit.fill),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.all(80.0),
              child: Text(""),
            ),
          ),
        ),
      ),
    );
  }
}
