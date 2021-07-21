// import 'dart:async';
// import 'dart:ui' as ui show Image;
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:spritewidget/spritewidget.dart';
// import 'package:background_music/weather/weather_button.dart';


// // The image map hold all of our image assets.
// ImageMap _images;

// // The sprite sheet contains an image and a set of rectangles defining the
// // individual sprites.
// SpriteSheet _sprites;

// enum WeatherType {
//   sun,
//   rain,
//   snow
// }

// class WeatherDemo extends StatefulWidget {
//   WeatherDemo({ Key key }) : super(key: key);

//   static const String routeName = '/weather';

//   @override
//   _WeatherDemoState createState() => new _WeatherDemoState();
// }

// class _WeatherDemoState extends State<WeatherDemo> {

//   @override

//   Widget build(BuildContext context) {
//     return Scaffold(

//     );
//   }


//   // This method loads all assets that are needed for the demo.
//   Future<Null> _loadAssets(AssetBundle bundle) async {
//     // Load images using an ImageMap
//     _images = new ImageMap(bundle);
//     await _images.load(<String>[
//       'assets/clouds-0.png',
//       'assets/clouds-1.png',
//       'assets/ray.png',
//       'assets/sun.png',
//       'assets/weathersprites.png',
//       'assets/icon-sun.png',
//       'assets/icon-rain.png',
//       'assets/icon-snow.png'
//     ]);

//     // Load the sprite sheet, which contains snowflakes and rain drops.
//     String json = await DefaultAssetBundle.of(context).loadString('assets/weathersprites.json');
//     _sprites = new SpriteSheet(_images['assets/weathersprites.png'], json);
//   }

//   @override
//   void initState() {
//     // Always call super.initState
//     super.initState();

//     // Get our root asset bundle
//     AssetBundle bundle = rootBundle;
    
//     // Load all graphics, then set the state to assetsLoaded and create the
//     // WeatherWorld sprite tree
// //  _loadAssets(assetBundle).then((_) {
// //       setState(() {
// //         assetsLoaded = true;
// //         world = new RainWorld();
// //       });
// //     });

//     _loadAssets(bundle).then((_) {
//       setState(() {
//         assetsLoaded = true;
//         weatherWorld = new WeatherDemo ();
//       });

      
//     });
//   }
// }