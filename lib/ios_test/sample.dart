import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SamplePage();
  }
}

class SamplePage extends StatefulWidget {
  SamplePage({Key key}) : super(key: key);

  @override
  _SamplePageState createState() {
    return _SamplePageState();
  }
}

class _SamplePageState extends State<SamplePage> {
  String textToShow = 'I Like Flutter';
  void _updateText() {
    setState(() {
      textToShow = 'Flutter is Awesome';
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(textToShow),
            CupertinoButton(
              child: Text('Hello'),
              onPressed: () {
                setState(() {
                  textToShow = 'Hello KenmuHuang';
                });
              },
              padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 0.0, right: 10.0),
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}
