import 'package:flutter/material.dart';

final String routeNameOfTableAndCollectionDemoPage = '/TableAndCollectionDemoPage';

class TableAndCollectionDemo extends StatelessWidget {
  TableAndCollectionDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableAndCollectionDemoPage(
      title: 'Table And Collection Demo Page',
    );
  }
}

class TableAndCollectionDemoPage extends StatefulWidget {
  TableAndCollectionDemoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TableAndCollectionDemoPageState createState() {
    return _TableAndCollectionDemoPageState();
  }
}

class _TableAndCollectionDemoPageState extends State<TableAndCollectionDemoPage> {
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();

    _initListData(10);
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
          itemCount: widgets.length,
          itemBuilder: (BuildContext context, int position) {
            return _getRow(position);
          },
      ),
//      body: ListView(
//        children: _getSimpleScrollView(),
//      ),
    );
  }

  void _initListData(int length) {
    for (int i = 0; i < length; ++i) {
      widgets.add(_getRow(i));
    }
  }

  Widget _getRow(int i) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('Row $i'),
      ),
      onTap: () {
        setState(() {
//          widgets = List.from(widgets);
          widgets.add(_getRow(widgets.length));

          print('Row $i tapped');
        });
      },
      onDoubleTap: () {
        print('Row $i double tapped');
      },
      onLongPress: () {
        print('Row $i long pressed');
      },
    );
  }

  List<Widget> _getSimpleScrollView() {
    return <Widget>[
      Text('Row One'),
      Text('Row Two'),
      Text('Row Three'),
      GestureDetector(
        child: FlutterLogo(
          size: 100.0,
        ),
        onTap: () {
          print('Click listener way of GestureDetector, FlutterLogo clicked');
        },
      ),
      RaisedButton(
        child: Text('Row Five, RaisedButton'),
        onPressed: () {
          print('Click listener way of the widget supports event detection, RaisedButton clicked');
        },
      ),
    ];
  }
}
