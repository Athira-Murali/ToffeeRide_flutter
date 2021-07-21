import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:math';

class MyCustomWidget extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget>
    with SingleTickerProviderStateMixin {
   AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
    );
    _startAnimation();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    controller.stop();
    controller.reset();
    controller.repeat(
      period: Duration(seconds: 1),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: CustomPaint(
          painter: SpritePainter(controller),
          child: Container(),
        ),
      ),
    );
  }
}

class SpritePainter extends CustomPainter {
  final Animation<double> animation;

  SpritePainter(this.animation) : super(repaint: animation);

  void circle(Canvas canvas, Rect rect, double value) {
    double opacity = (1.0 - (value / 4.0)).clamp(.0, 1.0);
    Color color = Colors.blue.withOpacity(opacity);

    double size = rect.width / 2;
    double area = size * size;
    double radius = sqrt(area * value / 2);

    final Paint paint = Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    for (int wave = 5; wave >= 0; wave--) {
      circle(canvas, rect, wave + animation.value);
    }
  }

  @override
  bool shouldRepaint(SpritePainter oldDelegate) {
    return true;
  }
}