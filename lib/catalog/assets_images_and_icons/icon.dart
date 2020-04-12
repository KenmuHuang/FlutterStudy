import 'package:flutter/material.dart';

class IconPage extends StatefulWidget {
  IconPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IconPageState createState() {
    return _IconPageState();
  }
}

class _IconPageState extends State<IconPage> {
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
                Padding(
                  child: Icon(
                    _selected ? Icons.favorite : Icons.favorite_border,
                    color: _selected ? Colors.red : Colors.black,
                    size: 36.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                ),
                Icon(
                  _selected ? Icons.star : Icons.star_border,
                  color: _selected ? Colors.blue : Colors.black,
                  size: 36.0,
                ),
                Padding(
                  child: Icon(
                    _selected ? Icons.bookmark : Icons.bookmark_border,
                    color: _selected ? Colors.green : Colors.black,
                    size: 36.0,
                  ),
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
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