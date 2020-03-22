import 'package:flutter/material.dart';

import 'string_extension.dart' hide NumberParsing;
import 'string_extension_2.dart' as string_extension_two hide IntParsing2;

final String routeNameOfStringExtensionDemoPage = '/StringExtensionDemoPage';

class StringExtensionDemo extends StatelessWidget {
  StringExtensionDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StringExtensionDemoPage(
      title: 'String Extension Demo Page',
    );
}

class StringExtensionDemoPage extends StatefulWidget {
  StringExtensionDemoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StringExtensionDemoPageState createState() => _StringExtensionDemoPageState();
}

class _StringExtensionDemoPageState extends State<StringExtensionDemoPage> {
  int joinedPersonNumber = 0;
  String addPersonDesc = 'add 10 person each time';
  double score = '42.3'.parseDouble();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: Center(
      child: Text(
          'Joined person number: $joinedPersonNumber',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.deepPurple,
          backgroundColor: Colors.black12,
        ),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add_circle),
      tooltip: addPersonDesc,
      onPressed: () {
        String addPersonNumberText = addPersonDesc.substring(4, 6);

        setState(() {
//          joinedPersonNumber += int.parse(addPersonNumberText);
          joinedPersonNumber += addPersonNumberText.parseInt();
//          joinedPersonNumber += IntParsing(addPersonNumberText).parseInt();
//          joinedPersonNumber += IntParsing2(addPersonNumberText).parseInt(); // Doesn't work
//          joinedPersonNumber += addPersonNumberText.parseNum();
//          joinedPersonNumber += string_extension_two.NumberParsing2(addPersonNumberText).parseNum();
        });
      },
    ),
  );
}