import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final String routeNameOfThreadingAsynchronicityPage = '/ThreadingAsynchronicityPage';

class ThreadingAsynchronicity extends StatelessWidget {
  ThreadingAsynchronicity({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThreadingAsynchronicityPage(title: 'Threading Asynchronicity Page');
  }
}

class ThreadingAsynchronicityPage extends StatefulWidget {
  ThreadingAsynchronicityPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ThreadingAsynchronicityPageState createState() {
    return _ThreadingAsynchronicityPageState();
  }
}

class _ThreadingAsynchronicityPageState extends State<ThreadingAsynchronicityPage> {
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
      body: ListView.builder(
          itemCount: widgets.length * 2,
          itemBuilder: (BuildContext context, int i) {
            if (i.isOdd) {
              // Split Line
              return Divider();
            }

            // 0, 1, 2, 3, 4, 5 => index = 0, 0, 1, 1, 2, 2
            final int index = i ~/ 2;
            return getRow(index);
          }),
    );
  }

  Widget getRow(int row) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Text('Row ${widgets[row]['title']}'),
    );
  }

  void loadData() async {
    String dataUrl = 'https://jsonplaceholder.typicode.com/posts';
    // https://blog.csdn.net/Dreamfine/article/details/83859915
    // https://www.cnblogs.com/ajanuw/p/10999826.html
    http.Response response = await http.get(dataUrl);
    setState(() {
      widgets = json.decode(response.body);
    });
    print('response.statusCode: ${response.statusCode}');
  }
}
