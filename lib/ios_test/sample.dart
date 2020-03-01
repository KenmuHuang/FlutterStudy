import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SamplePage(title: 'Fade Demo',);
  }
}

class SamplePage extends StatefulWidget {
  SamplePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SamplePageState createState() {
    return _SamplePageState();
  }
}

class _SamplePageState extends State<SamplePage> with TickerProviderStateMixin {
  String textToShow = 'I Like Flutter';
  bool toggle = true;
  AnimationController controller;
  CurvedAnimation curvedAnimation;

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

    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this
    );
    curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut
    );
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
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
                ),
                FadeTransition(
                  opacity: curvedAnimation,
                  child: FlutterLogo(
                    size: 100.0,
                  ),
                ),
              ],
            )
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (toggle) {
            controller.forward();
          } else {
            controller.reverse();
          }

          _toggle();
        },
        tooltip: 'Fade',
        child: Icon(Icons.brush),
      ),
    );
  }
}
