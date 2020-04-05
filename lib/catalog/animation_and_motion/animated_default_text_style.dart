import 'package:flutter/material.dart';

class AnimatedDefaultTextStylePage extends StatefulWidget {
  AnimatedDefaultTextStylePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimatedDefaultTextStylePageState createState() {
    return _AnimatedDefaultTextStylePageState();
  }
}

class _AnimatedDefaultTextStylePageState extends State<AnimatedDefaultTextStylePage> {
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
                AnimatedDefaultTextStyle(
                  child: Text('Kenmu Huang'),
                  style: TextStyle(
                    fontSize: _selected ? 24.0 : 20.0,
                    fontWeight: _selected ? FontWeight.w900 : FontWeight.normal,
                    fontStyle: _selected ? FontStyle.italic : FontStyle.normal,
                    color: _selected ? Colors.black26 : Colors.deepPurple,
                  ),
                  duration: const Duration(seconds: 1),
                  curve: Curves.elasticInOut,
                  onEnd: () {
                    print('_selected: $_selected');
                  },
                )
              ],
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