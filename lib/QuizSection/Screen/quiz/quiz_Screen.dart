import 'package:background_music/QuizSection/controllers/question_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
        //   IconBtn(buttoncolor: Colors.white,
        // buttonIcon: Icons.arrow_right_alt_sharp,
        // buttonAction:(){
        //   _controller.nextQuestion();
        // })
        
          FlatButton(onPressed: _controller.nextQuestion, child: Text("Skip", style: TextStyle(color: Colors.white,fontSize: 18),)),
        ],
      ),
      body: Body(),
    );
  }
}
