import 'package:flutter/material.dart';

class StreamBuilderPage extends StatefulWidget {
  StreamBuilderPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StreamBuilderPageState createState() {
    return _StreamBuilderPageState();
  }
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  bool _selected = false;
  Stream<int> _doubleCounterStream;
  Stream<int> _evenCounterStream;
  Stream<int> _duplicateCounterStream;

  @override
  void initState() {
    super.initState();

    Stream<int> counterStream = Stream<int>.periodic(Duration(seconds: 1), (x) => x).take(15); // 0-14
    _doubleCounterStream = counterStream.map((int x) => x * 2);
    print('_doubleCounterStream.runtimeType: ${_doubleCounterStream.runtimeType}'); // Print: _doubleCounterStream.runtimeType: _MapStream<int, int>
//    _doubleCounterStream.forEach((x) {
//      print('_doubleCounterStream item value: ${x}');
//    });

    _evenCounterStream = counterStream.where((int x) => x.isEven);
    print('_evenCounterStream.runtimeType: ${_evenCounterStream.runtimeType}'); // Print: _evenCounterStream.runtimeType: _WhereStream<int>

    _duplicateCounterStream = counterStream.expand((var x) => [x, x * 2, x * 3]);
    print('_duplicateCounterStream.runtimeType: ${_duplicateCounterStream.runtimeType}'); // Print: _duplicateCounterStream.runtimeType: _ExpandStream<int, int>
    _duplicateCounterStream.forEach(print);
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
                StreamBuilder(
                  stream: _timedCounter(const Duration(seconds: 1), 15),
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//                    if (!snapshot.hasData) {
//                      return CircularProgressIndicator();
//                    }

                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    switch (snapshot.connectionState) {
                      case ConnectionState.none: {
                        return Text('Select lot');
                      }
                      case ConnectionState.waiting: {
                        return Text('Awaiting bids...');
                      }
                      case ConnectionState.active: {
                        return Text('\$${snapshot.data}');
                      }
                      case ConnectionState.done: {
                        return Text('\$${snapshot.data} (closed)');
                      }
                    }
                    return null;
                  },
                ),
              ],
            )
        ),
        onTap: () {
          setState(() {
            _selected = !_selected;
            print('_selected: $_selected');
          });
        },
      ),
    );
  }

  Stream<int> _timedCounter(Duration interval, [int maxCount = 10]) async* {
    int i = 0;
    do {
      await Future.delayed(interval);
      yield i++;
    } while (i < maxCount);
  }
}