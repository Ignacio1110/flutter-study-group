// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:studygroupweek3/main.dart';

void main() {
  test("my test", () {
    List<String> scale = ["C", "D", "E", "F", "G", "A", "B"];
    List<Widget> children;

    // ()=> ;  (){ return};
    children = scale.map((e) {
      return Text("$e");
    }).toList();

    print(children);

    List<String> scaleHalf = ["C", "D", "", "F", "G", "A"];
    List<Widget> children2;

    children2 = scaleHalf.map((e) {
      return Container(
        color: Colors.transparent,
      );
    }).toList();

    children2 = scaleHalf.map((e) {
      //透明 or 黑色
      return e == ""
          ? Container(
              color: Colors.transparent,
            )
          : Container(
              color: Colors.black,
            );
    }).toList();
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
