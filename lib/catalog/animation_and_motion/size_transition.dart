import 'package:flutter/material.dart';

class SizeTransitionPage extends StatefulWidget {
  SizeTransitionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SizeTransitionPageState createState() {
    return _SizeTransitionPageState();
  }
}

class _SizeTransitionPageState extends State<SizeTransitionPage> with TickerProviderStateMixin {
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
    ))..addListener(() {
//      print('_animation.value: ${_animation.value}');
    })..addStatusListener((AnimationStatus status) {
      print('status: $status');
      if (status == AnimationStatus.completed) {
          _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _selected = true;
    _controller.forward();

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizeTransition(
              child: FlutterLogo(
                style: _selected ? FlutterLogoStyle.horizontal : FlutterLogoStyle.stacked,
                size: 100.0,
              ),
              sizeFactor: _animation,
              axis: _selected ? Axis.horizontal : Axis.vertical,
              axisAlignment: 1.0,
            ),
          ],
        ),
        onTap: () {
          setState(() {
            _selected = !_selected;
            print('_selected: $_selected');
          });
        },
      ),
    );
  }
}