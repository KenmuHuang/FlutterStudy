import 'package:flutter/material.dart';

class AnimatedPositionedPage extends StatefulWidget {
  AnimatedPositionedPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimatedPositionedPageState createState() {
    return _AnimatedPositionedPageState();
  }
}

class _AnimatedPositionedPageState extends State<AnimatedPositionedPage> {
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
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              child: Container(
                child: FlutterLogo(
                  style: FlutterLogoStyle.horizontal,
                  size: 100.0,
                  colors: Colors.amber,
                  textColor: Colors.amber,
                ),
                color: _selected ? Colors.lightBlue : Colors.lightBlueAccent,
              ),
              duration: const Duration(seconds: 1),
              width: _selected ? 300.0 : 200.0,
              height: _selected ? 80.0 : 200.0,
              top: _selected ? 120.0 : 20.0,
              left: _selected ? 70.0 : 20.0,
              curve: Curves.fastOutSlowIn,
              onEnd: () {
                print('_select: $_selected');
              },
            )
          ],
//          alignment: AlignmentDirectional.center,
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