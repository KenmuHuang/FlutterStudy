import 'package:flutter/material.dart';
import 'package:flutter_app/ios_test/table_and_collection_demo.dart';
import 'package:flutter_app/ios_test/threading_isolate_demo.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'ios_test/localization_demo.dart';
import 'ios_test/name_generator_demo.dart';
import 'ios_test/fade_demo.dart';
import 'ios_test/signature_painter_demo.dart';
import 'ios_test/threading_asynchronicity_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => Localization.of(context).title,
      localizationsDelegates: [
        const LocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale.fromSubtags(languageCode: 'zh'),
      ],
      title: 'Home Page',
      theme: ThemeData(
        primaryColor: Colors.purple[600],
      ),
      home: RandomWords(),
      routes: <String, WidgetBuilder> {
        routeNameOfSignaturePainterDemoPage1: (BuildContext context) => SignaturePainterDemoPage(title: routeNameOfSignaturePainterDemoPage1.substring(1)),
        routeNameOfSignaturePainterDemoPage2: (BuildContext context) => SignaturePainterDemoPage(title: routeNameOfSignaturePainterDemoPage2.substring(1)),
        routeNameOfThreadingAsynchronicityDemoPage: (BuildContext context) => ThreadingAsynchronicityDemo(),
        routeNameOfThreadingIsolateDemoPage: (BuildContext context) => ThreadingIsolateDemo(),
        routeNameOfLocalizationDemoPage: (BuildContext context) => LocalizationDemo(),
        routeNameOfTableAndCollectionDemoPage: (BuildContext context) => TableAndCollectionDemo(),
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
  static const String _keyOfTitle = 'title';
  static const String _keyOfSubtitle = 'subtitle';
  static const String _keyOfRouteName = 'routeName';
  final List<Map<String, String>> _pageInfoList = [
    {
      _keyOfTitle: 'Threading & asynchronicity',
      _keyOfSubtitle: 'How do I write asynchronous code?',
      _keyOfRouteName: routeNameOfThreadingAsynchronicityDemoPage
    },
    {
      _keyOfTitle: 'Threading & asynchronicity',
      _keyOfSubtitle: 'How do you move work to a background thread?',
      _keyOfRouteName: routeNameOfThreadingIsolateDemoPage
    },
    {
      _keyOfTitle: 'Localization',
      _keyOfSubtitle: 'Where do I store strings? How do I handle localization?',
      _keyOfRouteName: routeNameOfLocalizationDemoPage
    },
    {
      _keyOfTitle: 'Layouts',
      _keyOfSubtitle: 'What is the equivalent of UITableView or UICollectionView in Flutter?',
      _keyOfRouteName: routeNameOfTableAndCollectionDemoPage
    },
  ];
  int _pushSignaturePainterCount = 0;

  void _pushNameGeneratorDemo() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return NameGeneratorDemo();
        }
      ),
    );
  }

  void _pushFadeDemo() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return FadeDemo();
        }
      ),
    );
  }

  void _pushSignaturePainterDemo() async {
    String routeName = _pushSignaturePainterCount % 2 == 0 ? routeNameOfSignaturePainterDemoPage1 : routeNameOfSignaturePainterDemoPage2;
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

  void _pushPageByRouteName(String routeName) async {
    final result = await Navigator.of(context).pushNamed(routeName);
    print('The result of pop ${routeName.substring(1)}: $result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.welcomeMessage),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushNameGeneratorDemo),
          IconButton(icon: Icon(Icons.link), onPressed: _pushFadeDemo),
          IconButton(icon: Icon(Icons.brush), onPressed: _pushSignaturePainterDemo),
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

  Widget _buildRow(Map<String, String> pageInfo, int row) {
    return ListTile(
      title: Text(
        pageInfo[_keyOfTitle],
        style: const TextStyle(fontSize: 18.0, color: Colors.black),
      ),
      subtitle: Text(
        pageInfo[_keyOfSubtitle],
        style: const TextStyle(fontSize: 14.0),
      ),
      onTap: () {
        _pushPageByRouteName(pageInfo[_keyOfRouteName]);
      },
    );
  }
}