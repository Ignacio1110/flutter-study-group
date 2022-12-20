import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MaterialApp(
    home: HomePage2(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Row(
        children: [
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
          )
        ],
      ),
    );
  }
}

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  Color showedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        onPressed: () {
          showedColor = getColor();
          setState(() {});
        },
      ),
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Row(
        children: [
          Container(
            color: getColor(),
            width: 100,
            height: 100,
          ),
          Container(
            color: showedColor,
            width: 100,
            height: 100,
            child: SmallWidget(
              parentColor: showedColor,
              parentFunction: getColor,
            ),
          )
        ],
      ),
    );
  }

  Color getColor() {
    return Color.fromARGB(Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255), Random().nextInt(255));
  }
}

class SmallWidget extends StatefulWidget {
  const SmallWidget(
      {Key? key, required this.parentColor, required this.parentFunction})
      : super(key: key);
  final Color parentColor;
  final Function parentFunction;
  @override
  State<SmallWidget> createState() => _SmallWidgetState();
}

class _SmallWidgetState extends State<SmallWidget> {
  Color selfColor = Colors.black;
  Color oldParentColor = Colors.black;

  @override
  void initState() {
    oldParentColor = widget.parentColor;
    selfColor = widget.parentColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build SmallWidget ");
    print("parentColor: ${widget.parentColor}");
    if (widget.parentColor != oldParentColor) {
      selfColor = widget.parentColor;
      oldParentColor = widget.parentColor;
    }
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // foregroundColor: widget.parentColor,
          backgroundColor: selfColor,
        ),
        onPressed: () {
          selfColor = widget.parentFunction();
          setState(() {});
        },
        child: Center(
          child: Text(
            "tap me",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
