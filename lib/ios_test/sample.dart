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
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  Widget _getToggleChild() {
    if (toggle) {
      return Text(textToShow + ', Toggle One');
    } else {
      return CupertinoButton(
        child: Text(textToShow + ', Toggle Two'),
        onPressed: null,
      );
    }
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
            _getToggleChild(),
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
        onPressed: _toggle,
        tooltip: 'Toggle Child',
        child: Icon(Icons.update),
      ),
    );
  }
}
