import 'package:flutter/material.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  AnimatedCrossFadePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimatedCrossFadePageState createState() {
    return _AnimatedCrossFadePageState();
  }
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  bool _isFirst = true;
  int _count = 0;
  
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
              AnimatedCrossFade(
                firstChild: const FlutterLogo(
                  style: FlutterLogoStyle.horizontal,
                  size: 150.0,
                  textColor: Colors.blue,
                ),
                secondChild: const FlutterLogo(
                  style: FlutterLogoStyle.stacked,
                  size: 100.0,
                  textColor: Colors.lightBlue,
                ),
                duration: const Duration(seconds: 1),
                sizeCurve: Curves.linearToEaseOut,
                firstCurve: Curves.fastOutSlowIn,
                secondCurve: Curves.linear,
                crossFadeState: _isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              ),
              AnimatedSwitcher(
                child: Text(
                  '$_count',
                  key: ValueKey<int>(_count),
                  style: Theme.of(context).textTheme.display4,
                ),
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    child: child,
                    scale: animation,
                  );
                },
              )
            ],
          )
        ),
        onTap: () {
          setState(() {
            _isFirst = !_isFirst;
            _count++;
          });
        },
      ),
    );
  }
}