import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final String routeNameOfThreadingIsolateDemoPage = '/ThreadingIsolateDemoPage';

class ThreadingIsolateDemo extends StatelessWidget {
  ThreadingIsolateDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThreadingIsolateDemoPage(title: 'Threading Isolate Demo Page');
  }
}

class ThreadingIsolateDemoPage extends StatefulWidget {
  ThreadingIsolateDemoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ThreadingIsolateDemoPageState createState() {
    return _ThreadingIsolateDemoPageState();
  }
}

class _ThreadingIsolateDemoPageState extends State<ThreadingIsolateDemoPage> {
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
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);

    // The 'echo' isolate sends its SendPort as the first message
    SendPort sendPort = await receivePort.first;

    List msg = await sendReceive(sendPort, "https://jsonplaceholder.typicode.com/posts");
    setState(() {
      widgets = msg;
    });
  }

  static dataLoader(SendPort sendPort) async {
    // Open the ReceivePort for incoming messages.
    ReceivePort receivePort = ReceivePort();

    // Notify any other isolates what port this isolate listens to.
    sendPort.send(receivePort.sendPort);

    await for (var msg in receivePort) {
      String data = msg[0];
      SendPort replyTo = msg[1];

      String dataUrl = data;
      http.Response response = await http.get(dataUrl);

      // Lots of JSON to parse
      replyTo.send(json.decode(response.body));

      print('response.statusCode: ${response.statusCode}');
    }
  }

  Future sendReceive(SendPort sendPort, String dataUrl) {
    ReceivePort receivePort = ReceivePort();
    sendPort.send([dataUrl, receivePort.sendPort]);
    return receivePort.first;
  }
}
