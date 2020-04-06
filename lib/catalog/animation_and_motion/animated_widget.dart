import 'package:flutter/material.dart';

import 'dart:math' as math;

class AnimatedWidgetPage extends StatefulWidget {
  AnimatedWidgetPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimatedWidgetPageState createState() {
    return _AnimatedWidgetPageState();
  }
}

class _AnimatedWidgetPageState extends State<AnimatedWidgetPage> with TickerProviderStateMixin {
  AnimationController _controller;
  bool _selected = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
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
                AnimatedWidgetContainer(
                  controller: _controller,
                ),
              ],
            )
        ),
        onTap: () {
          setState(() {
            _selected = !_selected;
            if (_selected) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          });
        },
      ),
    );
  }
}

class AnimatedWidgetContainer extends AnimatedWidget {
  AnimatedWidgetContainer({Key key, AnimationController controller}) : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.green,
      ),
    );
  }
}