import 'dart:async';
import 'package:background_music/Games/textStroke.dart';
import 'package:background_music/ToffeeRideScreens/Emaillogin.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:page_transition/page_transition.dart';

final _exampleAudioFilePathMP3 =
      'https://www2.cs.uic.edu/~i101/SoundFiles/BabyElephantWalk60.wav';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();

  bool _mPlayerIsInited = false;

  @override
  void initState() {
    super.initState();

    _mPlayer.openAudioSession().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });

    Timer(
        Duration(seconds: 10),
        () => Navigator.of(context).pushReplacement(PageTransition(
              type: PageTransitionType.leftToRightWithFade,
              child: EmailLogin(),
            )));
  }

  @override
  void dispose() {
    stopPlayer();
    // Be careful : you must `close` the audio session when you have finished with it.
    _mPlayer.closeAudioSession();
    _mPlayer = null;

    super.dispose();
  }

  // -------  Here is the code to playback a remote file -----------------------

  void play() async {
    await _mPlayer.startPlayer(
      fromURI: _exampleAudioFilePathMP3,
      codec: Codec.mp3,
    );
  }

  Future<void> stopPlayer() async {
    if (_mPlayer != null) {
      await _mPlayer.stopPlayer();
    }
  }

  @override
  Widget build(BuildContext context) {
    play();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(image: AssetImage("assets/toffee/logo.png")),
          ),
          Center(
            child: TextWidget("Tofee Ride",
                fontFamily: "Ultra-Regular",
                fontSize: 40,
                strokeWidth: 6,
                color:Colors.pink,
                strokeColor: Colors.white,
                overrideSizeStroke: true, // nice
                shadow: [
                  Shadow(
                      blurRadius: 10,
                      color: Colors.black,
                      offset: Offset(0, 5)),
                ]),

            
            // AnimatedTextKit(
            //   totalRepeatCount: 1,
            //   //repeatForever: true,
            //   animatedTexts: [
            //   TyperAnimatedText(
            //     'Tofee Ride',
            //     //speed: Duration(milliseconds: 50),
            //     textStyle: TextStyle(
            //       letterSpacing: 4,
            //       fontFamily: 'Ultra-Regular',
            //       color: Colors.pink[600],
            //       fontSize: 30,
            //     )
            //     ),
            // ]),
          ),
          Center(
            child: AnimatedTextKit(totalRepeatCount: 1,
                //repeatForever: true,
                animatedTexts: [
                  TyperAnimatedText('Learning App for classes I - IV')
                ]),
          )
        ],
      ),
    );
  }
}
