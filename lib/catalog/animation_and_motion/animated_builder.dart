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
        child: AnimatedBuilder(
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
        ),
      ),
    );
  }
}