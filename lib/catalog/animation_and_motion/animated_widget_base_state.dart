import 'package:flutter/material.dart';

class AnimatedWidgetBaseStatePage extends StatefulWidget {
  AnimatedWidgetBaseStatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimatedWidgetBaseStatePageState createState() {
    return _AnimatedWidgetBaseStatePageState();
  }
}

class _AnimatedWidgetBaseStatePageState extends State<AnimatedWidgetBaseStatePage> {
  bool _selected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
                CustomAnimatedWidget(
                    child: _selected ? Icon(Icons.panorama_fish_eye) : Icon(Icons.panorama_wide_angle),
                    backgroundColor: _selected ? Colors.lightBlueAccent : Colors.indigo,
                    onPressed: () {
                      print('CustomAnimatedWidget');
                    }),
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
          });
        },
      ),
    );
  }
}

class CustomAnimatedWidget extends ImplicitlyAnimatedWidget {
  CustomAnimatedWidget({
    Key key,
    @required this.child,
    this.foregroundColor = Colors.white,
    @required this.backgroundColor,
    this.tooltip = '',
    @required this.onPressed,
    Duration duration = const Duration(seconds: 1),
    Curve curve = Curves.linear
  }) : super(key: key, duration: duration, curve: curve);

  final Widget child;
  final Color foregroundColor;
  final Color backgroundColor;
  final String tooltip;
  final Function onPressed;

  @override
  _CustomAnimatedWidgetState createState() {
    return _CustomAnimatedWidgetState();
  }
}

class _CustomAnimatedWidgetState extends AnimatedWidgetBaseState<CustomAnimatedWidget> {
  ColorTween _colorTween;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: widget.child,
      foregroundColor: widget.foregroundColor,
      backgroundColor: _colorTween.evaluate(animation),
      tooltip: widget.tooltip,
      onPressed: widget.onPressed,
    );
  }

  @override
  void forEachTween(TweenVisitor visitor) {
    _colorTween = visitor(
      _colorTween,
      widget.backgroundColor,
      (dynamic value) => ColorTween(begin: value),
    );
  }
}