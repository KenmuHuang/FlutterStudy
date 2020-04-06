import 'package:flutter/material.dart';

class DecoratedBoxTransitionPage extends StatefulWidget {
  DecoratedBoxTransitionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DecoratedBoxTransitionPageState createState() {
    return _DecoratedBoxTransitionPageState();
  }
}

class _DecoratedBoxTransitionPageState extends State<DecoratedBoxTransitionPage> with TickerProviderStateMixin {
  AnimationController _controller;
  bool _selected = false;
  final DecorationTween _decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.black54,
        style: BorderStyle.solid,
        width: 4.0,
      ),
      borderRadius: BorderRadius.zero,
      shape: BoxShape.rectangle,
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x66000000),
          blurRadius: 10.0,
          spreadRadius: 5.0,
        )
      ],
    ),
    end: BoxDecoration(
      color: Colors.black54,
      border: Border.all(
        color: Colors.white,
        style: BorderStyle.solid,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(10.0),
      shape: BoxShape.rectangle,
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x44000000),
          blurRadius: 10.0,
          spreadRadius: 20.0,
        )
      ]
    ),
  );

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: GestureDetector(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBoxTransition(
                  child: Container(
                    child: FlutterLogo(),
                    width: 200.0,
                    height: 200.0,
                    padding: EdgeInsets.all(20.0),
                  ),
                  position: DecorationPosition.background,
                  decoration: _decorationTween.animate(_controller),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: Text(
                    'Click me',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xEEE55599),
                      backgroundColor: _selected ? Colors.lime : Colors.limeAccent,
                    ),
                  ),
                ),
              ],
            )
        ),
        onTap: () {
          setState(() {
            _selected = !_selected;
            print('_selected: $_selected');

            if (_selected) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
          });
        },
      ),
    );
  }
}