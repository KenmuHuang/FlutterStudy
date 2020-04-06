import 'package:flutter/material.dart';

class AnimatedPhysicalModelPage extends StatefulWidget {
  AnimatedPhysicalModelPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimatedPhysicalModelPageState createState() {
    return _AnimatedPhysicalModelPageState();
  }
}

class _AnimatedPhysicalModelPageState extends State<AnimatedPhysicalModelPage> {
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
                AnimatedPhysicalModel(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: FlutterLogo(
                      style: FlutterLogoStyle.stacked,
                      size: 100.0,
                      colors: Colors.deepPurple,
                    ),
                  ),
                  shape: BoxShape.rectangle,
                  elevation: _selected ? 30.0 : 15.0,
                  color: _selected ? Colors.teal : Colors.blue,
                  shadowColor: _selected ? Colors.green : Colors.lightBlueAccent,
                  duration: const Duration(seconds: 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  animateColor: false,
                  animateShadowColor: false,
                  onEnd: () {
                    print('_selected: $_selected');
                  },
                ),
              ]
            )
        ),
        onTap: () {
          setState(() {
            _selected = !_selected;
          });
        },
      ),
    );
  }
}