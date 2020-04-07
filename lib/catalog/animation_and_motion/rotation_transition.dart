import 'package:flutter/material.dart';

class RotationTransitionPage extends StatefulWidget {
  RotationTransitionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RotationTransitionPageState createState() {
    return _RotationTransitionPageState();
  }
}

class _RotationTransitionPageState extends State<RotationTransitionPage> with TickerProviderStateMixin {
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
                RotationTransition(
                  child: Container(
                    child: FlutterLogo(),
                    width: 200.0,
                    height: 200.0,
                    padding: EdgeInsets.only(
                      bottom: 50.0,
                      right: 50.0,
                    ),
                    color: Colors.lightBlueAccent,
                  ),
                  turns: _animation,
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