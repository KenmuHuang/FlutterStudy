// Importing core libraries

// Importing libraries from external packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Importing files
import 'catalog/animation_and_motion/main.dart' as animation_and_motion;
import 'catalog/assets_images_and_icons/main.dart' as assets_images_and_icons;
import 'catalog/async/main.dart' as async;
import 'catalog/basics/main.dart' as basics;
import 'catalog/cupertino/main.dart' as cupertino;
import 'catalog/input/main.dart' as input;
import 'catalog/interaction_models/main.dart' as interaction_models;
import 'catalog/layout/main.dart' as layout;
import 'catalog/material_components/main.dart' as material_components;
import 'catalog/painting_and_effects/main.dart' as painting_and_effects;
import 'catalog/scrolling/main.dart' as scrolling;
import 'catalog/styling/main.dart' as styling;
import 'catalog/text/main.dart' as text;
import 'demo/cache/database_demo.dart';
import 'demo/cache/shared_preferences_demo.dart';
import 'demo/dart/language_samples.dart';
import 'demo/dart/language_tour.dart';
import 'demo/extension/string_extension_demo.dart';
import 'demo/gesture/gesture_detector_demo.dart';
import 'demo/gesture/signature_painter_demo.dart';
import 'demo/layout/name_generator_demo.dart';
import 'demo/layout/table_and_collection_demo.dart';
import 'demo/layout/text_field_demo.dart';
import 'demo/localization/localization_demo.dart';
import 'demo/thread/threading_asynchronicity_demo.dart';
import 'demo/thread/threading_isolate_demo.dart';

final bool isAllGrayForApp = false;

void main() => runApp(app());

Widget app() => isAllGrayForApp ? ColorFiltered(
  colorFilter: ColorFilter.mode(Colors.grey, BlendMode.color),
  child: MyApp(),
) : MyApp();

class MyApp extends StatelessWidget {
  final staticRoutes = <String, WidgetBuilder> {
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
    animation_and_motion.routeNameOfMainPage: (BuildContext context) => animation_and_motion.Main.shareInstance(),
    assets_images_and_icons.routeNameOfMainPage: (BuildContext context) => assets_images_and_icons.Main.shareInstance(),
    async.routeNameOfMainPage: (BuildContext context) => async.Main.shareInstance(),
    basics.routeNameOfMainPage: (BuildContext context) => basics.Main.shareInstance(),
    cupertino.routeNameOfMainPage: (BuildContext context) => cupertino.Main.shareInstance(),
    input.routeNameOfMainPage: (BuildContext context) => input.Main.shareInstance(),
    interaction_models.routeNameOfMainPage: (BuildContext context) => interaction_models.Main.shareInstance(),
    layout.routeNameOfMainPage: (BuildContext context) => layout.Main.shareInstance(),
    material_components.routeNameOfMainPage: (BuildContext context) => material_components.Main.shareInstance(),
    painting_and_effects.routeNameOfMainPage: (BuildContext context) => painting_and_effects.Main.shareInstance(),
    scrolling.routeNameOfMainPage: (BuildContext context) => scrolling.Main.shareInstance(),
    styling.routeNameOfMainPage: (BuildContext context) => styling.Main.shareInstance(),
    text.routeNameOfMainPage: (BuildContext context) => text.Main.shareInstance(),
  };

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
      routes: staticRoutes,
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
  List<Map<String, String>> _pageInfoList = [
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
    {
      _keyOfTitle: animation_and_motion.title,
      _keyOfSubtitle: 'Bring animations to your app.',
      _keyOfRouteName: animation_and_motion.routeNameOfMainPage
    },
    {
      _keyOfTitle: assets_images_and_icons.title,
      _keyOfSubtitle: 'Manage assets, display images, and show icons.',
      _keyOfRouteName: assets_images_and_icons.routeNameOfMainPage
    },
    {
      _keyOfTitle: async.title,
      _keyOfSubtitle: 'Async patterns to your Flutter application.',
      _keyOfRouteName: async.routeNameOfMainPage
    },
    {
      _keyOfTitle: basics.title,
      _keyOfSubtitle: 'Widgets you absolutely need to know before building your first Flutter app.',
      _keyOfRouteName: basics.routeNameOfMainPage
    },
    {
      _keyOfTitle: cupertino.title,
      _keyOfSubtitle: 'Beautiful and high-fidelity widgets for current iOS design language.',
      _keyOfRouteName: cupertino.routeNameOfMainPage
    },
    {
      _keyOfTitle: input.title,
      _keyOfSubtitle: 'Take user input in addition to input widgets in Material Components and Cupertino.',
      _keyOfRouteName: input.routeNameOfMainPage
    },
    {
      _keyOfTitle: interaction_models.title,
      _keyOfSubtitle: 'Respond to touch events and route users to different views.',
      _keyOfRouteName: interaction_models.routeNameOfMainPage
    },
    {
      _keyOfTitle: layout.title,
      _keyOfSubtitle: 'Arrange other widgets columns, rows, grids, and many other layouts.',
      _keyOfRouteName: layout.routeNameOfMainPage
    },
    {
      _keyOfTitle: material_components.title,
      _keyOfSubtitle: 'Visual, behavioral, and motion-rich widgets implementing the Material Design guidelines.',
      _keyOfRouteName: material_components.routeNameOfMainPage
    },
    {
      _keyOfTitle: painting_and_effects.title,
      _keyOfSubtitle: 'These widgets apply visual effects to the children without changing their layout, size, or position.',
      _keyOfRouteName: painting_and_effects.routeNameOfMainPage
    },
    {
      _keyOfTitle: scrolling.title,
      _keyOfSubtitle: 'Scroll multiple widgets as children of the parent.',
      _keyOfRouteName: scrolling.routeNameOfMainPage
    },
    {
      _keyOfTitle: styling.title,
      _keyOfSubtitle: 'Manage the theme of your app, makes your app responsive to screen sizes, or add padding.',
      _keyOfRouteName: styling.routeNameOfMainPage
    },
    {
      _keyOfTitle: text.title,
      _keyOfSubtitle: 'Display and style text.',
      _keyOfRouteName: text.routeNameOfMainPage
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
  void initState() {
    super.initState();

    // https://stackoverflow.com/questions/13416278/reverse-iterator-for-list/13417737#13417737
    _pageInfoList = _pageInfoList.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.welcomeMessage),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushNameGeneratorDemo),
          IconButton(icon: Icon(Icons.brush), onPressed: _pushSignaturePainterDemo),
        ],
      ),
      body: _buildItems(),
      floatingActionButton: FloatingActionButton(
        child: Text('Print'),
        backgroundColor: Colors.purple,
        tooltip: 'Test dart',
        onPressed: () {
          LanguageSamples languageSamples = LanguageSamples();
          languageSamples.testControlFlowStatements();
          languageSamples.testFunctions();
          languageSamples.testClasses();
          languageSamples.testInheritanceAndMixins();
          languageSamples.testInterfacesAndAbstractClasses();
          languageSamples.testAsync();

          LanguageTour languageTour = LanguageTour();
          languageTour.testVariables();
          languageTour.testTypes();
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