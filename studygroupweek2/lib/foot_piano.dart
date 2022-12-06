import 'package:flutter/material.dart';

class FootPianoScreen extends StatelessWidget {
  const FootPianoScreen({Key? key}) : super(key: key);

  static List<String> scale = ["C", "D", "E", "F", "G", "A", "B"];
  static List<String> scaleHalf = ["C", "D", "", "F", "G", "A"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Row(
              children: scale
                  .map(
                    (e) => Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black)),
                        child: Align(
                          alignment: Alignment(0, .6),
                          child: Text(
                            e,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: scaleHalf
                  .map(
                    (e) => TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor:
                            e == "" ? Colors.transparent : Colors.black,
                        padding: EdgeInsets.all(0.0),
                      ),
                      onPressed: e == ""
                          ? null
                          : () {
                              print(e);
                            },
                      child: Container(
                        height: 200,
                        width: 80,
                        child: Center(
                          child: Text(
                            e,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
