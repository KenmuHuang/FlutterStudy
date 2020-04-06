import 'package:flutter/material.dart';

class AnimatedSizePage extends StatefulWidget {
  AnimatedSizePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimatedSizePageState createState() {
    return _AnimatedSizePageState();
  }
}

class _AnimatedSizePageState extends State<AnimatedSizePage> with TickerProviderStateMixin {
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
                AnimatedSize(
                    child: Container(
                      width: _selected ? 300.0 : 100.0,
                      height: _selected ? 300.0 : 100.0,
                      color: _selected ? Colors.lightBlue : Colors.lightBlueAccent,
                    ),
                    duration: const Duration(seconds: 1),
                    vsync: this,
                  curve: Curves.fastLinearToSlowEaseIn,
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