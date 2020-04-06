import 'package:flutter/material.dart';

class FadeTransitionPage extends StatefulWidget {
  FadeTransitionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FadeTransitionPageState createState() {
    return _FadeTransitionPageState();
  }
}

class _FadeTransitionPageState extends State<FadeTransitionPage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  bool _selected = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
//    _animation = CurvedAnimation(
//      parent: _controller,
//      curve: Curves.easeInOut,
//    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _selected = true;
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
                FadeTransition(
                  child: FlutterLogo(
                    style: FlutterLogoStyle.stacked,
                    size: 100.0,
                    textColor: Colors.blue,
                    colors: Colors.blue,
                  ),
                  opacity: _animation,
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