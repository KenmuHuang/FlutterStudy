import 'dart:convert' show json;

import 'package:flutter/material.dart';

class AssetBundlePage extends StatefulWidget {
  AssetBundlePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AssetBundlePageState createState() {
    return _AssetBundlePageState();
  }
}

class _AssetBundlePageState extends State<AssetBundlePage> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage(
                'assets/images/home_top_card.png',
              ),
              width: 44.0,
              height: 44.0,
            ),
            Padding(
              child: Image.asset(
                _selected ? 'assets/images/lake.jpg' : 'assets/images/wechat.png',
                width: _selected ? 44.0 : 88.0,
                height: _selected ? 44.0 : 88.0,
              ),
              padding: EdgeInsets.only(top: 22.0, left: 5.0, bottom: 22.0, right: 5.0),
            ),
            Padding(
              child: Image.asset(
                'assets/images/${_selected ? "pic1" : "pic2"}.jpg',
                width: _selected ? 44.0 : 88.0,
                height: _selected ? 44.0 : 88.0,
              ),
              padding: EdgeInsets.only(top: 20.0),
            ),
            Padding(
              child: Text(
                'Kenmu Huang 黄',
                style: TextStyle(
                  fontFamily: 'Charmonman',
                  fontSize: 17.0,
                  fontWeight: _selected ? FontWeight.w700 : FontWeight.normal,
                  color: Colors.black54,
                ),
              ),
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "\u{e7d7}",
                  style: TextStyle(
                    fontFamily: "Iconfont",
                    fontSize: 24.0,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  "\u{e7d9}",
                  style: TextStyle(
                    fontFamily: "Iconfont",
                    fontSize: 30.0,
                    color: Colors.lightBlue,
                  ),
                ),
                Text(
                  "\u{e7df}",
                  style: TextStyle(
                    fontFamily: "Iconfont",
                    fontSize: 36.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ],
            ),
            Container(
              child: JsonWidget(),
              height: 210.0,
              color: Colors.black12,
            ),
          ],
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

class JsonWidget extends StatefulWidget {
  JsonWidget({Key key}) : super(key: key);

  @override
  _JsonWidgetState createState() {
    return _JsonWidgetState();
  }
}

class _JsonWidgetState extends State<JsonWidget> {
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
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(
          'assets/person.json',
          cache: true,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> data = json.decode(snapshot.data.toString());

          return ListView.builder(
            itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text('Name: ${data[index]["name"]}'),
                      Text('Age: ${data[index]["age"]}'),
                      Text('Height: ${data[index]["height"]}'),
                      Text('Gender: ${data[index]["gender"]}'),
                    ],
                  ),
                  margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                );
              }
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}