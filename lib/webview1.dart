import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class WebViewClass extends StatefulWidget {
  @override
  _WebViewClassState createState() => _WebViewClassState();
}

class _WebViewClassState extends State<WebViewClass> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView'),
      ),
      body: WebView(
        initialUrl: 'https://google.com',
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}



// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebView extends StatefulWidget {
//   @override
//   _WebViewState createState() => _WebViewState();
// }

// class _WebViewState extends State<WebView> {

//   final Completer<WebViewController> _controller =
//       Completer<WebViewController>();

//   num _stackToView = 1;

//   void _handleLoad(String value) {
//     setState(() {
//       _stackToView = 0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: Builder(builder: (BuildContext context) {
//             return IconButton(
//               icon: Icon(Icons.volume_up, color: Colors.black,),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             );
//           }),
//           backgroundColor: Colors.white10,
//           elevation: 0,
//         ),
//         body: IndexedStack(
//           index: _stackToView,
//           children: [
//             Column(
//               children: <Widget>[
//                 Expanded(
//                     child: WebView(
//                   initialUrl: "https://www.google.co.in/",
//                   javascriptMode: JavascriptMode.unrestricted,
//                   onPageFinished: _handleLoad,
//                   onWebViewCreated: (WebViewController webViewController) {
//                     _controller.complete(webViewController);
//                   },
//                 )),
//               ],
//             ),
//             Container(
//               child: Center(child: CircularProgressIndicator(),)
//             ),
//           ],
//         ));
//   }
// }