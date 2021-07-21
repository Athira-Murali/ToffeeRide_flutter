import 'package:background_music/components/styles.dart';
import 'package:background_music/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

AudioPlayer player = AudioPlayer();

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key key}) : super(key: key);

  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  void initState() {
    super.initState();
    playSound();
    player.setUrl(
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3");
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  Function playSound = () {
    player.play();
    return 1;
  };

  //Map<int, Widget> output = {1 : ErrorScreen()};

  Widget headerButton({
    @required IconData buttonIcon,
    @required Color buttonColor,
    @required void Function() buttonAction,
  }) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.only(right: 10, top: 25),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        onPressed: () {
          buttonAction();
        },
        //splashColor: buttonColor,
        icon: Icon(
          buttonIcon,
          color: buttonColor,
          size: 35,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    headerButton(
                        buttonAction: () {
                          playSound();
                          print('paused');
                        },
                        buttonIcon: Icons.play_circle_outline_sharp,
                        buttonColor: Colors.white),
                    //2nd row
                    headerButton(
                        buttonAction: () {
                          print('null');
                        },
                        buttonIcon: Icons.arrow_back,
                        buttonColor: Colors.white),
                  ],
                ),

                //2nd column
                Row(children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    // height: MediaQuery.of(context).size.height * 0.4,
                    // width: MediaQuery.of(context).size.height * 0.4,
                    child: Image(
                      image: AssetImage('assets/images/tree.jpg'),
                      fit: BoxFit.fill,
                     height: MediaQuery.of(context).size.height / 0.5,
                    width: MediaQuery.of(context).size.height * 0.4,                  
                      ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),

                  Expanded(
                    child: Text(
                        'Some plants are small while'
                        '\n some are big',
                        style: heading),
                  ),
                ]),
              ]),
        ),
      ],
    );
  }
}
