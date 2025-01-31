import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String routeNameOfSharedPreferencesDemoPage = '/SharedPreferencesDemoPage';

class SharedPreferencesDemo extends StatelessWidget {
  SharedPreferencesDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SharedPreferencesDemoPage(
      title: 'Shared Preferences Demo Page',
    );
  }
}

class SharedPreferencesDemoPage extends StatefulWidget {
  SharedPreferencesDemoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SharedPreferencesDemoPageState createState() {
    return _SharedPreferencesDemoPageState();
  }
}

class _SharedPreferencesDemoPageState extends State<SharedPreferencesDemoPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<int> _counter;
  final String _counterKey = 'counter';

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt(_counterKey) ?? 0) + 1;
    print('Pressed $counter times.');

    setState(() {
      _counter = prefs.setInt(_counterKey, counter).then((bool success) {
        return counter;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    _counter = _prefs.then((SharedPreferences prefs){
      return (prefs.getInt(_counterKey) ?? 0);
    });
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
        child: FutureBuilder<int>(
          future: _counter,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting: {
                return const CircularProgressIndicator();
              }
              default: {
                if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                } else {
                  return Text(
                    'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
                        'This should persist across restarts.',
                  );
                }
              }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: 'Increment',
        onPressed: _incrementCounter,
      ),
    );
  }
}