import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:word_search/word_search.dart';

class CrosswordWidget extends StatefulWidget {
  CrosswordWidget({Key key}) : super(key: key);

  @override
  _CrosswordWidgetState createState() => _CrosswordWidgetState();
}

class _CrosswordWidgetState extends State<CrosswordWidget> {
  // generate crossword char array
  // example like this : [["x","x"],["x","x"]]

  // sorry. hhahaa
  int numBoxPerRow = 6;
  double padding = 5;
  // sory .. not assign this yet.. :(
  Size sizeBox = Size.zero;

  ValueNotifier<List<List<String>>> listChars;
  // save all answers on generate crossword data
  ValueNotifier<List<CrosswordAnswer>> answerList;
  ValueNotifier<CurrentDragObj> currentDragObj;
  ValueNotifier<List<int>> charsDone;

  @override
  void initState() {
    super.initState();
    listChars = new ValueNotifier<List<List<String>>>([]);
    answerList = new ValueNotifier<List<CrosswordAnswer>>([]);
    currentDragObj = new ValueNotifier<CurrentDragObj>(new CurrentDragObj());
    charsDone = new ValueNotifier<List<int>>(new List<int>());
    // generate char array crossword
    generateRandomWord();
  }

  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // ok.. need build 2 widget.. 1 box 1 list

    // get size width
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
      
                  child: Center(
            child: Container(
              child: Column(
                children: [
                  Container(
                    color: Colors.pink[300],  
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    height: size.width - padding * 2,
                    padding: EdgeInsets.all(padding),
                    margin: EdgeInsets.all(padding),
                    child: drawCrosswordBox(),
                  ),
                  Container(
                    alignment: Alignment.center,
                    // lets show list word we need solve
                    child: drawAnswerList(),
                  ),
                ],
              ),
            ),
          ),
       
      ),
    );
  }

  void onDragEnd(PointerUpEvent event) {
    print("PointerUpEvent");
    // check if drag line object got value or not.. if no no need to clear
    if (currentDragObj.value.currentDragLine == null) return;

    currentDragObj.value.currentDragLine.clear();
    currentDragObj.notifyListeners();
  }

  void onDragUpdate(PointerMoveEvent event) {
    // generate ondragLine so we know to highlight path later & clear if condition dont meet .. :D
    generateLineOnDrag(event);

    // get index on drag

    int indexFound = answerList.value.indexWhere((answer) {
      return answer.answerLines.join("-") ==
          currentDragObj.value.currentDragLine.join("-");
    });

    print(currentDragObj.value.currentDragLine.join("-"));
    if (indexFound >= 0) {
      answerList.value[indexFound].done = true;
      // save answerList which complete
      charsDone.value.addAll(answerList.value[indexFound].answerLines);
      charsDone.notifyListeners();
      answerList.notifyListeners();
      onDragEnd(null);
    }
  }

  int calculateIndexBasePosLocal(Offset localPosition) {
    // get size max per box
    double maxSizeBox =
        ((sizeBox.width - (numBoxPerRow - 1) * padding) / numBoxPerRow);

    if (localPosition.dy > sizeBox.width || localPosition.dx > sizeBox.width)
      return -1;

    int x = 0, y = 0;
    double yAxis = 0, xAxis = 0;
    double yAxisStart = 0, xAxisStart = 0;

    for (var i = 0; i < numBoxPerRow; i++) {
      xAxisStart = xAxis;
      xAxis += maxSizeBox +
          (i == 0 || i == (numBoxPerRow - 1) ? padding / 2 : padding);

      if (xAxisStart < localPosition.dx && xAxis > localPosition.dx) {
        x = i;
        break;
      }
    }

    for (var i = 0; i < numBoxPerRow; i++) {
      yAxisStart = yAxis;
      yAxis += maxSizeBox +
          (i == 0 || i == (numBoxPerRow - 1) ? padding / 2 : padding);

      if (yAxisStart < localPosition.dy && yAxis > localPosition.dy) {
        y = i;
        break;
      }
    }

    return y * numBoxPerRow + x;
  }

  void generateLineOnDrag(PointerMoveEvent event) {
    // if current drag line is null, dlcare new list for we can save value
    if (currentDragObj.value.currentDragLine == null)
      currentDragObj.value.currentDragLine = new List<int>();

    // we need calculate index array base local position on drag
    int indexBase = calculateIndexBasePosLocal(event.localPosition);

    if (indexBase >= 0) {
      // check drag line already pass 2 box
      if (currentDragObj.value.currentDragLine.length >= 2) {
        // check drag line is straight line
        WSOrientation wsOrientation;

        if (currentDragObj.value.currentDragLine[0] % numBoxPerRow ==
            currentDragObj.value.currentDragLine[1] % numBoxPerRow)
          wsOrientation =
              WSOrientation.vertical; // this should vertical.. my mistake.. :)
        else if (currentDragObj.value.currentDragLine[0] ~/ numBoxPerRow ==
            currentDragObj.value.currentDragLine[1] ~/ numBoxPerRow)
          wsOrientation = WSOrientation.horizontal;

        if (wsOrientation == WSOrientation.horizontal) {
          if (indexBase ~/ numBoxPerRow !=
              currentDragObj.value.currentDragLine[1] ~/ numBoxPerRow)
            onDragEnd(null);
        } else if (wsOrientation == WSOrientation.vertical) {
          if (indexBase % numBoxPerRow !=
              currentDragObj.value.currentDragLine[1] % numBoxPerRow)
            onDragEnd(null);
        } else
          onDragEnd(null);
      }

      if (!currentDragObj.value.currentDragLine.contains(indexBase))
        currentDragObj.value.currentDragLine.add(indexBase);
      else if (currentDragObj.value.currentDragLine.length >=
          2) if (currentDragObj.value.currentDragLine[
              currentDragObj.value.currentDragLine.length - 2] ==
          indexBase) onDragEnd(null);
    }
    // before mistake , should in here
    currentDragObj.notifyListeners();
  }

  void onDragStart(int indexArray) {
    try {
      List<CrosswordAnswer> indexSelecteds = answerList.value
          .where((answer) => answer.indexArray == indexArray)
          .toList();

      // check indexSelecteds got any match , if 0 no proceed!
      if (indexSelecteds.length == 0) return;
      // nice triggered
      currentDragObj.value.indexArrayOnTouch = indexArray;
      currentDragObj.notifyListeners();
    } catch (e) {}
  }

  // nice one

  Widget drawCrosswordBox() {
    // add listener tp catch drag, push down & up
    return Listener(
      onPointerUp: (event) => onDragEnd(event),
      onPointerMove: (event) => onDragUpdate(event),
      child: LayoutBuilder(
        builder: (context, constraints) {
          sizeBox = Size(constraints.maxWidth, constraints.maxWidth);
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: numBoxPerRow,
              crossAxisSpacing: padding,
              mainAxisSpacing: padding,
            ),
            itemCount: numBoxPerRow * numBoxPerRow,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              // we need expand because to merge 2d array to become 1..
              // example [["x","x"],["x","x"]] become ["x","x","x","x"]
              String char = listChars.value.expand((e) => e).toList()[index];

              // yeayy.. now we got crossword box.. easy right!!
              // later i will show how to display current word on crossword
              // next show color path on box when drag, we will using Valuelistener
              // done .. yeayy.. this is simple crossword system
              return Listener(
                onPointerDown: (event) => onDragStart(index),
                child: ValueListenableBuilder(
                  valueListenable: currentDragObj,
                  builder: (context, CurrentDragObj value, child) {
                    Color color = Colors.pinkAccent[300];

                    if (value.currentDragLine.contains(index))
                      color = Colors
                          .blue; // change color when path line is contain index
                    else if (charsDone.value.contains(index))
                      color =
                          Colors.green; // change color box already path correct

                    return Container(
                      decoration: BoxDecoration(
                        color: color,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        char.toUpperCase(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void generateRandomWord() {
    // this words we want put on crossword game
    final List<String> wl = ['hello', 'world', 'foo', 'bar', 'baz', 'dart','green'];

    // setup configuration to generate crossword

    // Create the puzzle sessting object
    final WSSettings ws = WSSettings(
      width: numBoxPerRow,
      height: numBoxPerRow,
      orientations: List.from([
        WSOrientation.horizontal,
        WSOrientation.horizontalBack,
        WSOrientation.vertical,
        WSOrientation.verticalUp,
        // WSOrientation.diagonal,
        // WSOrientation.diagonalUp,
      ]),
    );

    // Create new instance of the WordSearch class
    final WordSearch wordSearch = WordSearch();

    // Create a new puzzle
    final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wl, ws);

    /// Check if there are errors generated while creating the puzzle
    if (newPuzzle.errors.isEmpty) {
      // if no error.. proceed

      // List<List<String>> charsArray = newPuzzle.puzzle;
      listChars.value = newPuzzle.puzzle;
      // done pass..ez

      // Solve puzzle for given word list
      final WSSolved solved = wordSearch.solvePuzzle(newPuzzle.puzzle, wl);

      answerList.value = solved.found
          .map((solve) => new CrosswordAnswer(solve, numPerRow: numBoxPerRow))
          .toList();
    }
  }

  drawAnswerList() {
    return Container(
      child: ValueListenableBuilder(
        valueListenable: answerList,
        builder: (context, List<CrosswordAnswer> value, child) {
          // lets make custom widget using Column & Row

          // how many row child we want show per row?
          int perColTotal = 3;

          // generate using list.generate
          List<Widget> list = List.generate(
              (value.length ~/ perColTotal) +
                  ((value.length % perColTotal) > 0 ? 1 : 0), (int index) {
            int maxColumn = (index + 1) * perColTotal;

            return Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                // generate child row per row
                // all close on each other.. let make row child distance equally
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    maxColumn > value.length
                        ? maxColumn - value.length
                        : perColTotal, ((indexChild) {
                  // forgot to declare array for access answerList
                  int indexArray = (index) * perColTotal + indexChild;

                  return Text(
                    // make text more clearly to read
                    "${value[indexArray].wsLocation.word}",
                    style: TextStyle(
                      fontSize: 18,
                      color:
                          value[indexArray].done ? Colors.green : Colors.black,
                      decoration: value[indexArray].done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  );
                })).toList(),
              ),
            );
          }).toList();

          return Container(
            child: Column(
              children: list,
            ),
          );
        },
      ),
    );
  }
}

class CurrentDragObj {
  Offset currentDragPos;
  Offset currentTouch;
  int indexArrayOnTouch;
  List<int> currentDragLine = new List<int>();

  CurrentDragObj({
    this.indexArrayOnTouch,
    this.currentTouch,
  });
}

class CrosswordAnswer {
  bool done = false;
  int indexArray;
  WSLocation wsLocation;
  List<int> answerLines;

  CrosswordAnswer(this.wsLocation, {int numPerRow}) {
    this.indexArray = this.wsLocation.y * numPerRow + this.wsLocation.x;
    generateAnswerLine(numPerRow);
  }

  // get answer index for each character word
  void generateAnswerLine(int numPerRow) {
    // declare new list<int>
    this.answerLines = new List<int>();

    // push all index based base word array
    this.answerLines.addAll(List<int>.generate(this.wsLocation.overlap,
        (index) => generateIndexBaseOnAxis(this.wsLocation, index, numPerRow)));
  }

// calculate index base axis x & y
  generateIndexBaseOnAxis(WSLocation wsLocation, int i, int numPerRow) {
    int x = wsLocation.x, y = wsLocation.y;

    if (wsLocation.orientation == WSOrientation.horizontal ||
        wsLocation.orientation == WSOrientation.horizontalBack)
      x = (wsLocation.orientation == WSOrientation.horizontal) ? x + i : x - i;
    else
      y = (wsLocation.orientation == WSOrientation.vertical) ? y + i : y - i;

    return x + y * numPerRow;
  }
}
