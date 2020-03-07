import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/ios_test/custom_button.dart';
import 'package:flutter_app/ios_test/signature_painter.dart';
import 'ios_test/sample.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
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
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  int _pushSignaturePainterCount = 0;

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
              (WordPair pair) {
                return ListTile(
                  title: Text(
                    pair.asPascalCase,
                    style: _biggerFont,
                  ),
                );
              }
          );
          final List<Widget> divided = ListTile.divideTiles(
              context: context,
              tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
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

  void _pushSignaturePainter() {
    String routeName = _pushSignaturePainterCount % 2 == 0 ? kRouteNameOfSignaturePage1 : kRouteNameOfSignaturePage2;
    Navigator.of(context).pushNamed(routeName);

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
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
          IconButton(icon: Icon(Icons.link), onPressed: _pushSample),
          IconButton(icon: Icon(Icons.brush), onPressed: _pushSignaturePainter),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) {
        // Split Line
        return Divider();
      }

      // 0, 1, 2, 3, 4, 5 => index = 0, 0, 1, 1, 2, 2
      final int index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index], index);
    });
  }

  Widget _buildRow(WordPair pair, int row) {
    final bool alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      subtitle: CustomButton(labelText: ('Hello Kenmu ' + row.toString())),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}