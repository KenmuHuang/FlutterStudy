import 'package:flutter/material.dart';

class ScaleTransitionPage extends StatefulWidget {
  ScaleTransitionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScaleTransitionPageState createState() {
    return _ScaleTransitionPageState();
  }
}

class _ScaleTransitionPageState extends State<ScaleTransitionPage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  bool _selected = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 1.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ScaleTransition(
                  child: Container(
                    child: FlutterLogo(),
                    width: 100.0,
                    height: 100.0,
                    padding: EdgeInsets.only(
                      bottom: 30.0,
                      right: 30.0,
                    ),
                    color: Colors.lightBlueAccent,
                  ),
                  scale: _animation,
                  alignment: Alignment.bottomRight,
                )
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