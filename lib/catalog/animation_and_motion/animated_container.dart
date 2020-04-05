import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimatedContainerPageState createState() {
    return _AnimatedContainerPageState();
  }
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
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
          child: AnimatedContainer(
            duration: const Duration(seconds: 2),
            child: FlutterLogo(
              size: 75.0,
            ),
            curve: Curves.fastOutSlowIn,
            width: _selected ? 200.0 : 100.0,
            height: _selected ? 100.0 : 200.0,
            color: _selected ? Colors.red : Colors.blue,
            alignment: _selected ? Alignment.center : Alignment.topCenter,
            padding: _selected ? EdgeInsets.all(30.0) : EdgeInsets.only(top: 20.0),
            margin: _selected ? EdgeInsets.only(bottom: 300.0) : EdgeInsets.only(top: 300.0),
          ),
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