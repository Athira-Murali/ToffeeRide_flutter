import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:background_music/Games/Tangram/pages/level_home_page.dart';
import 'package:background_music/Games/crossword.dart';
import 'package:background_music/Games/puzzleJigsaw.dart';
import 'package:background_music/Games/slidePuzzle.dart';
import 'package:background_music/Games/wordFind.dart';
import 'package:background_music/QuizSection/Screen/constants.dart';

import 'package:background_music/Quiz/FirstScreen.dart';
import 'package:background_music/ToffeeRideScreens/Game/Colormatching.dart';
import 'package:background_music/ToffeeRideScreens/Game/DraggablePuzzel.dart';
import 'package:background_music/ToffeeRideScreens/Game/Paint.dart';
import 'package:background_music/ToffeeRideScreens/Game/matchFollow.dart';

import 'package:background_music/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  bool selected = false;

  Widget quizScreensButton({
    @required String buttontext,
    //@required Color buttonColor,
    @required void Function() buttonAction,
  }) {
    return GestureDetector(
      onTap: buttonAction,
      onDoubleTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: AnimatedContainer(
        width: selected ? 150.0 : 100.0,
        height: selected ? 100.0 : 100.0,
        color: selected ? Colors.red : Colors.blue,
        alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: Text(
          buttontext,
          style: btnText,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);
    return Stack(
      children: [
        BookBgImage(),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  AnimatedTextKit(totalRepeatCount: 1,
                      //repeatForever: true,
                      animatedTexts: [
                        TyperAnimatedText('welcome to ToffeeRide',
                            //speed: Duration(milliseconds: 50),
                            textStyle: TextStyle(
                              letterSpacing: 4,
                              fontFamily: 'Ultra-Regular',
                              color: Colors.white,
                              fontSize: 30,
                            )),
                      ]),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 10,
                        ),
                        quizScreensButton(
                            buttontext: 'Quiz Section',
                            buttonAction: () {
                              Navigator.of(context).pushReplacement(
                                PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: FirstScreen(),
                                ),
                              );
                            }),

                        //2nd button
                        quizScreensButton(
                            buttontext: 'Match the Follow',
                            buttonAction: () {
                              Navigator.of(context).pushReplacement(
                                PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: MatchingPage(),
                                ),
                              );
                            }),

                        //3rd button
                        quizScreensButton(
                            buttontext: 'Draggable Puzzel',
                            buttonAction: () {
                              Navigator.of(context).pushReplacement(
                                PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: DragPicture(),
                                ),
                              );
                            }),

//4th button
                        quizScreensButton(
                            buttontext: 'Painting',
                            buttonAction: () {
                              Navigator.of(context).pushReplacement(
                                PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: CanvasPainting(),
                                ),
                              );
                            }),
                        quizScreensButton(
                            buttontext: 'Color Matching',
                            buttonAction: () {
                              Navigator.of(context).pushReplacement(
                                PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: ColorMatching(),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: PuzzleWidget(),
                            ),
                          );
                        },
                        child: Text('Jigsaw Puzzle'),
                      ),

//2nd row
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: SlidePuzzle(),
                            ),
                          );
                        },
                        child: Text('Slide Puzzle'),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: WordFind(),
                            ),
                          );
                        },
                        child: Text('Dictaion'),
                      ),

 ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: CrosswordWidget(),
                            ),
                          );
                        },
                        child: Text('Word search'),
                      ),
                    
//5th row
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: LevelHomePage(),
                            ),
                          );
                        },
                        child: Text('Tangram shapes'),
                      ),
                    ],
                  )
                ]),
              ),
            ))
      ],
    );
  }
}
