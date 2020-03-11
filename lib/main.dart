import 'package:flutter/material.dart';
import 'package:flutter_app/ios_test/threading_isolate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'ios_test/localization.dart';
import 'ios_test/name_generator.dart';
import 'ios_test/sample.dart';
import 'ios_test/signature_painter.dart';
import 'ios_test/threading_asynchronicity.dart';

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
        routeNameOfSignaturePage1: (BuildContext context) => Signature(title: routeNameOfSignaturePage1.substring(1)),
        routeNameOfSignaturePage2: (BuildContext context) => Signature(title: routeNameOfSignaturePage2.substring(1)),
        routeNameOfThreadingAsynchronicityPage: (BuildContext context) => ThreadingAsynchronicity(),
        routeNameOfThreadingIsolatePage: (BuildContext context) => ThreadingIsolate(),
        routeNameOfLocalizationDemoPage: (BuildContext context) => LocalizationDemo(),
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
      _keyOfRouteName: routeNameOfThreadingAsynchronicityPage
    },
    {
      _keyOfTitle: 'Threading & asynchronicity',
      _keyOfSubtitle: 'How do you move work to a background thread?',
      _keyOfRouteName: routeNameOfThreadingIsolatePage
    },
    {
      _keyOfTitle: 'Localization',
      _keyOfSubtitle: 'Where do I store strings? How do I handle localization?',
      _keyOfRouteName: routeNameOfLocalizationDemoPage
    },
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
    String routeName = _pushSignaturePainterCount % 2 == 0 ? routeNameOfSignaturePage1 : routeNameOfSignaturePage2;
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