// Importing core libraries

// Importing libraries from external packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Importing files
import 'demo/animation/fade_demo.dart';
import 'demo/cache/database_demo.dart';
import 'demo/cache/shared_preferences_demo.dart';
import 'demo/dart/language_samples.dart';
import 'demo/extension/string_extension_demo.dart';
import 'demo/gesture/gesture_detector_demo.dart';
import 'demo/gesture/signature_painter_demo.dart';
import 'demo/layout/name_generator_demo.dart';
import 'demo/layout/table_and_collection_demo.dart';
import 'demo/layout/text_field_demo.dart';
import 'demo/localization/localization_demo.dart';
import 'demo/thread/threading_asynchronicity_demo.dart';
import 'demo/thread/threading_isolate_demo.dart';

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
        // fix: The getter 'cutButtonLabel' was called on null, https://github.com/flutter/flutter/issues/43050
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale.fromSubtags(languageCode: 'zh'),
      ],
      title: 'Home Page',
      theme: ThemeData(
        primaryColor: Colors.purple[600],
        primarySwatch: Colors.blue,
        textSelectionColor: Colors.green,
        textSelectionHandleColor: Colors.greenAccent
      ),
      home: RandomWords(),
      routes: <String, WidgetBuilder> {
        routeNameOfSignaturePainterDemoPage1: (BuildContext context) => SignaturePainterDemoPage(title: routeNameOfSignaturePainterDemoPage1.substring(1)),
        routeNameOfSignaturePainterDemoPage2: (BuildContext context) => SignaturePainterDemoPage(title: routeNameOfSignaturePainterDemoPage2.substring(1)),
        routeNameOfThreadingAsynchronicityDemoPage: (BuildContext context) => ThreadingAsynchronicityDemo(),
        routeNameOfThreadingIsolateDemoPage: (BuildContext context) => ThreadingIsolateDemo(),
        routeNameOfLocalizationDemoPage: (BuildContext context) => LocalizationDemo(),
        routeNameOfTableAndCollectionDemoPage: (BuildContext context) => TableAndCollectionDemo(),
        routeNameOfGestureDetectorDemoPage: (BuildContext context) => GestureDetectorDemo(),
        routeNameOfTextFieldDemoPage: (BuildContext context) => TextFieldDemo(),
        routeNameOfSharedPreferencesDemoPage: (BuildContext context) => SharedPreferencesDemo(),
        routeNameOfDatabaseDemoPage: (BuildContext context) => DatabaseDemo(),
        routeNameOfStringExtensionDemoPage: (BuildContext context) => StringExtensionDemo(),
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
    {
      _keyOfTitle: 'Gesture detection and touch event handling',
      _keyOfSubtitle: 'How do I add a click listener to a widget in Flutter?',
      _keyOfRouteName: routeNameOfGestureDetectorDemoPage
    },
    {
      _keyOfTitle: 'Theming and text',
      _keyOfSubtitle: 'How do I theme an app?',
      _keyOfRouteName: routeNameOfTextFieldDemoPage
    },
    {
      _keyOfTitle: 'Databases and local storage',
      _keyOfSubtitle: 'How do I access UserDefault in Flutter?',
      _keyOfRouteName: routeNameOfSharedPreferencesDemoPage
    },
    {
      _keyOfTitle: 'Databases and local storage',
      _keyOfSubtitle: 'What is the equivalent to CoreData in Flutter?',
      _keyOfRouteName: routeNameOfDatabaseDemoPage
    },
    {
      _keyOfTitle: 'Extension methods',
      _keyOfSubtitle: 'Introduced in Dart 2.7, are a way to add functionality to existing libraries.',
      _keyOfRouteName: routeNameOfStringExtensionDemoPage
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.smartphone),
        tooltip: 'Test dart',
        onPressed: () {
          LanguageSamples languageSamples = LanguageSamples();
          languageSamples.testControlFlowStatements();
          languageSamples.testFunctions();
          languageSamples.testClasses();
          languageSamples.testInheritanceAndMixins();
          languageSamples.testInterfacesAndAbstractClasses();
          languageSamples.testAsync();
        },
      ),
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