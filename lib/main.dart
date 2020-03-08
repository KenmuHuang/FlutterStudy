import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/ios_test/name_generator.dart';
import 'package:flutter_app/ios_test/signature_painter.dart';
import 'ios_test/sample.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primaryColor: Colors.purple[600],
      ),
      home: RandomWords(),
      routes: <String, WidgetBuilder> {
        kRouteNameOfSignaturePage1: (BuildContext context) => Signature(title: kRouteNameOfSignaturePage1.substring(1)),
        kRouteNameOfSignaturePage2: (BuildContext context) => Signature(title: kRouteNameOfSignaturePage2.substring(1)),
      },
    );
  }
}

class RandomWords extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return RandomWordsState();
//  }

  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<String> _pageInfoList = [
    'Threading & asynchronicity'
  ];
  int _pushSignaturePainterCount = 0;

  void _pushNameGenerator() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return NameGenerator();
        }
      ),
    );
  }

  void _pushSample() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Sample();
        }
      ),
    );
  }

  void _pushSignaturePainter() async {
    String routeName = _pushSignaturePainterCount % 2 == 0 ? kRouteNameOfSignaturePage1 : kRouteNameOfSignaturePage2;
    final result = await Navigator.of(context).pushNamed(routeName);
    print('The result of pop SignaturePage: $result');

    _pushSignaturePainterCount++;

//    Navigator.of(context).push(
//      MaterialPageRoute<void>(
//          builder: (BuildContext context) {
//            return Signature(title: '绘画');
//          }
//      ),
//    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kenmu Home Page'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushNameGenerator),
          IconButton(icon: Icon(Icons.link), onPressed: _pushSample),
          IconButton(icon: Icon(Icons.brush), onPressed: _pushSignaturePainter),
        ],
      ),
      body: _buildItems(),
    );
  }

  Widget _buildItems() {
    return ListView.builder(
      // https://stackoverflow.com/questions/54977982/rangeerror-index-invalid-value-valid-value-range-is-empty-0
        itemCount: (_pageInfoList.length * 2),
        itemBuilder: (context, i) {
          if (i.isOdd) {
            // Split Line
            return Divider();
          }

          // 0, 1, 2, 3, 4, 5 => index = 0, 0, 1, 1, 2, 2
          final int index = i ~/ 2;
          return _buildRow(_pageInfoList[index], index);
        });
  }

  Widget _buildRow(String pageInfo, int row) {
    return ListTile(
      title: Text(
        pageInfo,
        style: const TextStyle(fontSize: 18.0),
      ),
      onTap: () {
        setState(() {

        });
      },
    );
  }
}