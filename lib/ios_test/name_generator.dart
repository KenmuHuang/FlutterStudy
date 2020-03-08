import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'custom_button.dart';

class NameGenerator extends StatelessWidget {
  NameGenerator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NameGeneratorPage(title: 'Startup Name Generator',);
  }
}

class NameGeneratorPage extends StatefulWidget {
  NameGeneratorPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NameGeneratorPageState createState() {
    return _NameGeneratorPageState();
  }
}

class _NameGeneratorPageState extends State<NameGeneratorPage> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

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
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.collections), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        itemBuilder: (context, i) {
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