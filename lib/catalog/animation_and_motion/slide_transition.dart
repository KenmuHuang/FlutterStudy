import 'package:flutter/material.dart';

class SlideTransitionPage extends StatefulWidget {
  SlideTransitionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SlideTransitionPageState createState() {
    return _SlideTransitionPageState();
  }
}

class _SlideTransitionPageState extends State<SlideTransitionPage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;
  bool _selected = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    ))..addListener(() {
      print('_animation.value: ${_animation.value}');
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
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SlideTransition(
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
              position: _animation,
              transformHitTests: false,
              textDirection: _selected ? TextDirection.ltr : TextDirection.rtl,
            )
          ],
        )),
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
