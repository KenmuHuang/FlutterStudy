import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  ImagePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ImagePageState createState() {
    return _ImagePageState();
  }
}

class _ImagePageState extends State<ImagePage> {
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
                Row(
                  children: <Widget>[
                    Text('Local JPG: '),
                    Image.asset(
                      'assets/images/${_selected ? "pic1" : "pic2"}.jpg',
                      width: _selected ? 44.0 : 88.0,
                      height: _selected ? 44.0 : 88.0,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(
                  child: Row(
                    children: <Widget>[
                      Text('Network JPG: '),
                      Image(
                        image: NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                          scale: 1.0,
                        ),
                        width: _selected ? 44.0 : 88.0,
                        height: _selected ? 44.0 : 88.0,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                ),
                Row(
                  children: <Widget>[
                    Text('Network GIF: '),
                    Image.network(
                      'https://p.upyun.com/demo/webp/animated-gif/0.gif',
                      scale: 1.0,
                      width: _selected ? 100.0 : 150.0,
                      height: _selected ? 100.0 : 150.0,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Row(
                  children: <Widget>[
                    Text('Network WebP: '),
                    Image.network(
                      'https://p.upyun.com/demo/webp/webp/animated-gif-0.webp',
                      scale: 1.0,
                      width: _selected ? 100.0 : 150.0,
                      height: _selected ? 100.0 : 150.0,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
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