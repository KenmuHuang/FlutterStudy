import 'package:flutter/material.dart';

class HeroPage extends StatefulWidget {
  HeroPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HeroPageState createState() {
    return _HeroPageState();
  }
}

class _HeroPageState extends State<HeroPage> {
  final String _heroTag = 'hero';

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
      body: Container(
        child: InkWell(
          child: Hero(
            tag: _heroTag,
            child: ClipOval(
              child: Container(
                child: Image.asset(
                  'assets/images/home_top_card.png',
                  width: 44.0,
                  height: 44.0,
                ),
                color: Colors.lightBlueAccent,
                padding: EdgeInsets.all(20.0),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context, PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation firstAnimation, Animation secondAnimation) {
                return FadeTransition(
                  opacity: firstAnimation,
                  child: HeroTargetPage(
                    heroTag: _heroTag,
                  ),
                );
              }
            ));
          },
        ),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 20.0),
      ),
    );
  }
}

class HeroTargetPage extends StatelessWidget {
  HeroTargetPage({Key key, @required this.heroTag}) : super(key: key);

  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Target Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Hero(
            tag: heroTag,
            child: Image.asset(
              'assets/images/home_top_card.png',
              width: 88.0,
              height: 44.0,
            ),
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ),
    );
  }
}
