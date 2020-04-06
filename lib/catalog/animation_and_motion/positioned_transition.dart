import 'package:flutter/material.dart';

class PositionedTransitionPage extends StatefulWidget {
  PositionedTransitionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PositionedTransitionPageState createState() {
    return _PositionedTransitionPageState();
  }
}

class _PositionedTransitionPageState extends State<PositionedTransitionPage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<RelativeRect> _animation;
  bool _selected = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(200.0, 200.0, 0.0, 0.0),
      end: RelativeRect.fromLTRB(0.0, 0.0, 40.0, 40.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  PositionedTransition(
                      rect: _animation,
                      child: Container(
                        child: FlutterLogo(
                          style: FlutterLogoStyle.stacked,
                          size: 100.0,
                        ),
                        width: 100.0,
                        height: 100.0,
                      )
                  ),
                ],
              ),
              color: Colors.lightBlueAccent,
              height: 300.0,
            )
          ],
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