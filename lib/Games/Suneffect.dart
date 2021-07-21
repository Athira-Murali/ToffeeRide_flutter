import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class SunEffect1 extends StatefulWidget {
  SunEffect1({Key key}) : super(key: key);

  @override
  _SunEffect1State createState() => _SunEffect1State();
}

class _SunEffect1State extends State<SunEffect1>
    with SingleTickerProviderStateMixin {
  // let animate little

  Animation<double> rotate;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 80), vsync: this);
    rotate = new Tween<double>(begin: 0, end: 1).animate(animationController);

    // reverse will rotate back from 1 to 0 after end
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose(); //dispose animation controller..
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // size sun
    double sizeSun = 30;

    return Scaffold(
      body: Container(
          // let put background color..
          color: Colors.yellowAccent[100],
          child: Stack(
            children: [
              // lets set our sun
              Positioned(
                bottom: MediaQuery.of(context).size.height / 2,
                right: MediaQuery.of(context).size.width / 2 - sizeSun / 2,
                child: RotationTransition(
                  turns: rotate,
                  child: Container(
                    width: sizeSun,
                    height: sizeSun,
                    child: CustomPaint(
                      // use custom to make effect
                      painter: SunEffectPainter(
                          screenWidth: MediaQuery.of(context).size.width - 100),
                      child: Container(
                        width: sizeSun,
                        height: sizeSun,
                        // make sun circle
                        decoration: BoxDecoration(
                          // when u dclare decoration, color must inside it..
                          // yeayy sun out, like make effect
                          color: Colors.yellow,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class SunEffectPainter extends CustomPainter {
  double screenWidth = 100;

  SunEffectPainter({
    this.screenWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // offset for effect on center
    Offset offset = Offset(size.width / 2, size.height / 2);
    // radius for effect cover
    double radiusArcShape = screenWidth;
    double totalEffectShine = 20; // total shine effect

    List<Color> colors = [
      Colors.white.withOpacity(0.2),
      Colors.white.withOpacity(0)
    ]; // list color effect , from center to outside
    //
    Paint paint = new Paint()
      ..shader = ui.Gradient.radial(
        offset,
        radiusArcShape,
        colors,
      );

    // lets generate arc for effect
    double radius = (1 * pi) / totalEffectShine;

    for (var i = 0; i < totalEffectShine; i++) {
      // my bad
      canvas.drawPath(
          drawPieShape(radiusArcShape, radius * (i * 2), radius, size, offset),
          paint);
    }
  }

  // this method will generate pie shape for each shine effect
  Path drawPieShape(double radiusArcShape, double d, double radius, Size size,
      Offset offset) {
    return new Path()
      ..moveTo(offset.dx, offset.dy)
      ..arcTo(Rect.fromCircle(center: offset, radius: radiusArcShape), d,
          radius, false)
      ..close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
