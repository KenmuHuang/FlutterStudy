import 'package:flutter/material.dart';

class FutureBuilderPage extends StatefulWidget {
  FutureBuilderPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FutureBuilderPageState createState() {
    return _FutureBuilderPageState();
  }
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  bool _selected = false;
  Future<String> _calculation = Future<String>.delayed(
    Duration(seconds: 2),
        () => 'Data Loaded',
  );

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
        title: Text(widget.title ?? ''),
      ),
      body: GestureDetector(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FutureBuilder(
                    future: _calculation,
                    builder: (BuildContext context,
                        AsyncSnapshot<String> snapshot) {
                      List<Widget> _children;

                      if (snapshot.hasData) {
                        _children = <Widget>[
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                            size: 60.0,
                          ),
                          Padding(
                            child: Text('Result: ${snapshot.data}'),
                            padding: const EdgeInsets.only(top: 16.0),
                          ),
                        ];
                      } else if (snapshot.hasError) {
                        _children = <Widget>[
                          Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 60.0,
                          ),
                          Padding(
                            child: Text('Result: ${snapshot.error}'),
                            padding: const EdgeInsets.only(top: 16.0),
                          ),
                        ];
                      } else {
                        _children = <Widget>[
                          SizedBox(
                            child: CircularProgressIndicator(),
                            width: 60.0,
                            height: 60.0,
                          ),
                          Padding(
                            child: Text('Awaiting result...(${snapshot.connectionState})'),
                            padding: const EdgeInsets.only(top: 16.0),
                          ),
                        ];
                      }

                      return Center(
                        child: Column(
                          children: _children,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                      );
                    }
                )
              ],
            )
        ),
        onTap: () {
          setState(() {
            _selected = !_selected;
            print('_selected: $_selected');

            if (_selected) {
              // https://github.com/flutter/flutter/issues/34545
              _calculation = Future<String>.delayed(
                Duration(seconds: 2),
                    () => throw StateError('Data Load Failure'),
              );
            }
          });
        },
      ),
    );
  }
}