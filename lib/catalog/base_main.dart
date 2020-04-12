import 'package:flutter/material.dart';

import 'package:flutter_app/catalog/page_info_model.dart';

class BaseMain extends StatelessWidget {
  BaseMain({Key key, this.title, this.pageInfoModelList}) : super(key: key);

  final String title;
  final List<PageInfoModel> pageInfoModelList;

  @override
  Widget build(BuildContext context) {
    return BaseMainPage(
      title: title,
      pageInfoModelList: pageInfoModelList,
    );
  }
}

class BaseMainPage extends StatefulWidget {
  BaseMainPage({Key key, this.title, this.pageInfoModelList}) : super(key: key);

  final String title;
  final List<PageInfoModel> pageInfoModelList;

  @override
  _BaseMainPageState createState() {
    return _BaseMainPageState(
      pageInfoModelList: pageInfoModelList
    );
  }
}

class _BaseMainPageState extends State<BaseMainPage> {
  List<PageInfoModel> _pageInfoModelList;

  _BaseMainPageState({List<PageInfoModel> pageInfoModelList}) {
    _pageInfoModelList = pageInfoModelList;
  }

  Future<void> _pushPage(dynamic page) async {
    if (page != null) {
      Future result = Navigator.push(context, PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => page,
        transitionsBuilder: (BuildContext context, Animation<double> anmiation, Animation<double> secondaryAnimation, Widget child) {
          var tween = Tween(
              begin: Offset(0.0, 1.0),
              end: Offset.zero
          ).chain(CurveTween(
            curve: Curves.easeInOut,
          ));
          return SlideTransition(
            child: child,
            position: anmiation.drive(tween),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ));
      result.then((value) {
        if (value != null) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('The result of pop: $value'),
              )
          );
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();

    if (_pageInfoModelList == null) {
      _pageInfoModelList = [
        PageInfoModel(
          title: 'Please add title',
          subtitle: 'Please add subtitle',
          pageClass: null
        )
      ];
    }
    _pageInfoModelList = _pageInfoModelList.reversed.toList();
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
      body: _buildItems(),
    );
  }

  Widget _buildItems() {
    return ListView.builder(
        itemCount: (_pageInfoModelList.length * 2),
        itemBuilder: (context, i) {
          if (i.isOdd) {
            // Split Line
            return Divider();
          }

          // 0, 1, 2, 3, 4, 5 => index = 0, 0, 1, 1, 2, 2
          final int index = i ~/ 2;
          return _buildRow(_pageInfoModelList[index], index);
        });
  }

  Widget _buildRow(PageInfoModel pageInfoModel, int row) {
    return ListTile(
      title: Text(
        pageInfoModel.title,
        style: const TextStyle(fontSize: 18.0, color: Colors.black),
      ),
      subtitle: Text(
        pageInfoModel.subtitle,
        style: const TextStyle(fontSize: 14.0),
      ),
      onTap: () {
        _pushPage(pageInfoModel.pageClass);
      },
    );
  }
}
