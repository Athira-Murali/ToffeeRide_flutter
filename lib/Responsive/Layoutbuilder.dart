import 'package:background_music/components/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStatelessWidget extends StatefulWidget {
  const MyStatelessWidget({Key key}) : super(key: key);

  @override
  _MyStatelessWidgetState createState() => _MyStatelessWidgetState();
}

class _MyStatelessWidgetState extends State<MyStatelessWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LayoutBuilder Example')),
      body: SingleChildScrollView(
              child: Column(children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth > 600) {
                return _buildWideContainers();
              } else {
                return _buildNormalContainer();
              }
            },
          ),

          
          Container(
            color: Colors.blue,
            alignment: Alignment.center,
            width: double.infinity,
            height: 100.0,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.green,
              ),
            ),
          ),
          // SizedBox(height: MediaQuery.of(context).size.height/20,),
          // Center(
          //   child: Container(
          //     height: 400,
          //     width: 300,
          //     color: Colors.red,
          //     child: FittedBox(
          //       child: Image.network(
          //           'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
          // CupertinoPageScaffold(
          //   // Uncomment to change the background color
          //   // backgroundColor: CupertinoColors.systemPink,
          //   navigationBar: const CupertinoNavigationBar(
          //     middle: Text('Sample Code'),
          //   ),
          //   child: ListView(
          //     children: <Widget>[
          //       CupertinoButton(
          //         onPressed: () => setState(() => _count++),
          //         child: const Icon(CupertinoIcons.add),
          //       ),
          //       Center(
          //         child: Text('You have pressed the button $_count times.',
          //             style: heading),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(height: MediaQuery.of(context).size.height/10,),
          FractionallySizedBox(
            heightFactor: 0.1,
            widthFactor: 0.7,
            child: ElevatedButton(
              onPressed: () {
                print('button pressed');
              },
              child: Text(
                'press',
                style: buttontext,
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _buildNormalContainer() {
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.red,
      ),
    );
  }

  Widget _buildWideContainers() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.red,
          ),
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
