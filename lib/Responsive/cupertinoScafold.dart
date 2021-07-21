

import 'package:background_music/components/styles.dart';
import 'package:flutter/cupertino.dart';


/// This is the stateful widget that the main application instantiates.
class CupertinoScafold extends StatefulWidget {
  const CupertinoScafold({Key key}) : super(key: key);

  @override
  State<CupertinoScafold> createState() => _CupertinoScafoldState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _CupertinoScafoldState extends State<CupertinoScafold> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // Uncomment to change the background color
       backgroundColor: CupertinoColors.white,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Sample Code'),
         ),
      child: ListView(
        children: <Widget>[
          CupertinoButton(
            onPressed: () => setState(() => _count++),
            child: const Icon(CupertinoIcons.add),
          ),
          Center(
            child: Text('You have pressed the button $_count times.',style: heading,),
          ),
        ],
      ),
    );
  }
}
