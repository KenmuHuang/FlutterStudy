import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String routeNameOfCacheDemoPage = '/CacheDemoPage';

class CacheDemo extends StatelessWidget {
  CacheDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CacheDemoPage(
      title: 'Cache Demo Page',
    );
  }
}

class CacheDemoPage extends StatefulWidget {
  CacheDemoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CacheDemoPageState createState() {
    return _CacheDemoPageState();
  }
}

class _CacheDemoPageState extends State<CacheDemoPage> {
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
        child: RaisedButton(
          onPressed: _incrementCounter,
          child: Text('Increment Counter'),
        ),
      ),
    );
  }

  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('Pressed $counter times.');

    await prefs.setInt('counter', counter);
  }
}