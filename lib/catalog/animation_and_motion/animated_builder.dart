import 'package:flutter/material.dart';

import 'dart:math' as math;

class SpinnerPage extends StatefulWidget {
  SpinnerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SpinnerPageState createState() {
    return _SpinnerPageState();
  }
}

class _SpinnerPageState extends State<SpinnerPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double _targetValue = 100.0;
  bool _isAnimatedBuilderMode = true;

  Widget animationChild() {
    if (_isAnimatedBuilderMode) {
      return AnimatedBuilder(
        animation: _controller,
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.green,
          child: const Center(
            child: Text('Wee'),
          ),
        ),
        builder: (BuildContext context, Widget child) {
          return Transform.rotate(
            angle: _controller.value * 2.0 * math.pi,
            child: child,
          );
        },
      );
    } else {
      return TweenAnimationBuilder(
        child: Icon(Icons.aspect_ratio),
        tween: Tween<double>(
            begin: 0.0,
            end: _targetValue
        ),
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
        builder: (BuildContext context, double size, Widget child) {
          return IconButton(
            icon: child,
            iconSize: size,
            color: Colors.blue,
            onPressed: () {
              setState(() {
                _targetValue = _targetValue == 100.0 ? 200.0 : 100.0;
              });
            },
          );
        },
        onEnd: () {
          print('_targetValue: $_targetValue');
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
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
      body: Center(
        child: animationChild(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('toggle'),
        tooltip: 'toggle child',
        onPressed: () {
          setState(() {
            _isAnimatedBuilderMode = !_isAnimatedBuilderMode;
          });
        },
      ),
    );
  }
}