import 'dart:io';
import 'dart:async';
import 'package:background_music/Puzzle/puzzle.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Puzzle extends StatefulWidget {
  final String title;
   final int rows =  3;
    final int cols = 3;
  const Puzzle({Key key, this.title}) : super(key: key);

  @override
  _PuzzleState createState() => _PuzzleState();
}

class _PuzzleState extends State<Puzzle> {
  File _image;
  List<Widget> pieces = [];
  final picker = ImagePicker();

  Future getImagefromCamera() async {
    final image = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        _image = File(image.path);
        pieces.clear();
      } else{
splitImage(Image.file(_image));
      }
      
      
    });
    
  }
  //2nd function
  Future getImagefromGallery() async {
    final image = await picker.getImage(source: ImageSource.gallery);

     setState(() {
      if (image != null) {
        _image = File(image.path);
        pieces.clear();
      } else {
        splitImage(Image.file(_image));
      }
    });
  }

  // we need to find out the image size, to be used in the PuzzlePiece widget
  Future<Size> getImageSize(Image image) async {
    final Completer<Size> completer = Completer<Size>();
  image.image
        .resolve(new ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(Size(

         info.image.width.toDouble(),
          info.image.height.toDouble(),
      ));
    }));

    // image.image.resolve(const ImageConfiguration())
    // .addListener((ImageInfo info, bool _) {
    //     completer.complete(Size(
    //       info.image.width.toDouble(),
    //       info.image.height.toDouble(),
    //     ));
    //   },
    // );

    final Size imageSize = await completer.future;

    return imageSize;
  }

  // here we will split the image into small pieces using the rows and columns defined above; each piece will be added to a stack
  void splitImage(Image image) async {
    Size imageSize = await getImageSize(image);

    for (int x = 0; x < widget.rows; x++) {
      for (int y = 0; y < widget.cols; y++) {
        setState(() {
          pieces.add(PuzzlePiece(key: GlobalKey(),
              image: image,
              imageSize: imageSize,
              row: x,
              col: y,
              maxRow: widget.rows,
              maxCol: widget.cols));
        });
      }
    }
  }



  // Future getImage(ImageSource source) async {
  //   var image = await ImagePicker.pickImage(source: source);

  //   if (image != null) {
  //     setState(() {
  //       _image = image;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: SafeArea(
        child: new Center(
            child: _image == null
                ? new Text('No image selected.')
                : Image.file(_image)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return SafeArea(
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new ListTile(
                        leading: new Icon(Icons.camera),
                        title: new Text('Camera'),
                        onTap: () {
                          getImagefromCamera();
                          // getImage(ImageSource.camera);
                          // this is how you dismiss the modal bottom sheet after making a choice
                          Navigator.pop(context);
                        },
                      ),
                      new ListTile(
                        leading: new Icon(Icons.image),
                        title: new Text('Gallery'),
                        onTap: () {
                         getImagefromGallery();
                          // dismiss the modal sheet
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              });
        },
        tooltip: 'New Image',
        child: Icon(Icons.add),
      ),
    );
  }
}






