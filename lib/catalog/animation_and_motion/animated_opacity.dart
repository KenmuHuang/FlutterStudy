import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  AnimatedOpacityPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimatedOpacityPageState createState() {
    return _AnimatedOpacityPageState();
  }
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  double _opacity = 1.0;

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
                AnimatedOpacity(
                  child: FlutterLogo(
                    style: FlutterLogoStyle.markOnly,
                    size: 50.0,
                    colors: Colors.teal,
                  ),
                  opacity: _opacity,
                  duration: const Duration(seconds: 1),
                )
              ],
            )
        ),
        onTap: () {
          setState(() {
            _opacity = _opacity == 1.0 ? 0.2 : 1.0;
          });
        },
      ),
    );
  }
}