import 'package:flutter/material.dart';

final String routeNameOfTableAndCollectionPage = '/TableAndCollectionPage';

class TableAndCollection extends StatelessWidget {
  TableAndCollection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableAndCollectionPage(title: 'Table And Collection Page',);
  }
}

class TableAndCollectionPage extends StatefulWidget {
  TableAndCollectionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TableAndCollectionPageState createState() {
    return _TableAndCollectionPageState();
  }
}

class _TableAndCollectionPageState extends State<TableAndCollectionPage> {
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
      body: ListView(
        children: _getListData(),
      ),
    );
  }

  List<Widget> _getListData() {
    List<Widget> widgets = [];

    for (int i = 0; i < 100; ++i) {
      widgets.add(
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Row $i'),
          )
      );
    }

    return widgets;
  }
}