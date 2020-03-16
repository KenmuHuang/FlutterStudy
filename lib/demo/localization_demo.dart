import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

final String routeNameOfLocalizationDemoPage = '/LocalizationDemoPage';

class Strings {
  static String welcomeMessage = 'Welcome To Flutter';
}

class Localization {
  // Flutter 国际化适配实战：https://juejin.im/post/5e65b860518825492a721289
  // https://github.com/flutter/website/blob/master/examples/internationalization/minimal/lib/main.dart
  // https://flutter.dev/docs/development/accessibility-and-localization/internationalization#appendix-updating-the-ios-app-bundle
  Localization(this.locale);

  final Locale locale;

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Localization Demo Page',
      'content': 'Hello World～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～',
    },
    'zh': {
      'title': '本地化示例页面',
      'content': '您好，世界～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～',
    },
  };

  String get title {
    Map<String, String> localizedValue = _localizedValues[locale.languageCode];
    return localizedValue != null ? localizedValue['title'] : '';
  }

  String get content {
    Map<String, String> localizedValue = _localizedValues[locale.languageCode];
    return localizedValue != null ? localizedValue['content'] : '';
  }
}

class LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const LocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of Localization.
    return SynchronousFuture<Localization>(Localization(locale));
  }

  @override
  bool shouldReload(LocalizationDelegate old) => false;
}

class LocalizationDemo extends StatelessWidget {
  LocalizationDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LocalizationDemoPage(title: Localization.of(context).title);
  }
}

class LocalizationDemoPage extends StatefulWidget {
  LocalizationDemoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LocalizationDemoPageState createState() {
    return _LocalizationDemoPageState();
  }
}

class _LocalizationDemoPageState extends State<LocalizationDemoPage> {
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
      ),
      body: Center(
        child: Text(
          Localization.of(context).content,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.cyan,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.deepOrange,
            decorationStyle: TextDecorationStyle.solid,
            decorationThickness: 1.0,
            letterSpacing: 10.0,
            wordSpacing: 50.0,
          ),
        ),
      ),
    );
  }
}
