import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final String routeNameOfThreadingAsynchronicityDemoPage = '/ThreadingAsynchronicityDemoPage';

class ThreadingAsynchronicityDemo extends StatelessWidget {
  ThreadingAsynchronicityDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThreadingAsynchronicityDemoPage(title: 'Threading Asynchronicity Demo Page');
  }
}

class ThreadingAsynchronicityDemoPage extends StatefulWidget {
  ThreadingAsynchronicityDemoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ThreadingAsynchronicityDemoPageState createState() {
    return _ThreadingAsynchronicityDemoPageState();
  }
}

class _ThreadingAsynchronicityDemoPageState extends State<ThreadingAsynchronicityDemoPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();

    loadData();
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
      body: getBody(),
    );
  }

  Widget getBody() => isShowLoadingDialog() ? getLoadingDialog() : getListView();

  bool isShowLoadingDialog() => widgets.isEmpty;

  Widget getLoadingDialog() =>
      Center(
        child: CircularProgressIndicator(),
      );

  ListView getListView() =>
      ListView.builder(
          itemCount: widgets.length * 2,
          itemBuilder: (BuildContext context, int i) {
            if (i.isOdd) {
              // Split Line
              return Divider();
            }

            // 0, 1, 2, 3, 4, 5 => index = 0, 0, 1, 1, 2, 2
            final int index = i ~/ 2;
            return getRow(index);
          });

  Widget getRow(int row) =>
      Padding(
        padding: EdgeInsets.all(15.0),
        child: Text('Row ${widgets[row]['title']}'),
      );

  void loadData() async {
    String dataUrl = 'https://jsonplaceholder.typicode.com/posts';
    http.Response response = await http.get(dataUrl);
    setState(() {
      widgets = json.decode(response.body);
    });
    print('response.statusCode: ${response.statusCode}');
  }
}
