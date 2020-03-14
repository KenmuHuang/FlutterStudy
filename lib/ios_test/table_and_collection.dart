import 'package:flutter/material.dart';

final String routeNameOfTableAndCollectionPage = '/TableAndCollectionPage';

class TableAndCollection extends StatelessWidget {
  TableAndCollection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableAndCollectionPage(
      title: 'Table And Collection Page',
    );
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
      Text('Row Four'),
    ];
  }
}
