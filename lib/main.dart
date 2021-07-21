import 'package:background_music/Games/MemoryTest1/memorytest.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//      DeviceOrientation.landscapeLeft,
//       DeviceOrientation.landscapeRight,
// ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'HomeScreen',
      //theme: ThemeData.dark(),
      routes: {
      'HomeScreen': (context) =>MemoryTest1(),
      //'EmailLogin':(context) =>EmailLogin(),
      },
    );
  }
}
