import 'package:background_music/SpriteWidgetEx/ParticlesDesigner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spritewidget/spritewidget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ImageMap _images;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();

    _images = new ImageMap(rootBundle);
    _images.load([
      'assets/images/particle-0.png',
      'assets/images/particle-1.png',
      'assets/images/particle-2.png',
      'assets/images/particle-3.png',
      'assets/images/particle-4.png',
      'assets/images/particle-5.png',
    ]).then((images) {
      setState(() => _loaded = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:  ParticleDesigner(images: _images,) ,
    );
  }
}

