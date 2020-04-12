import 'package:flutter/material.dart';

import 'dart:math' as math;

class RawImagePage extends StatefulWidget {
  RawImagePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RawImagePageState createState() {
    return _RawImagePageState();
  }
}

class _RawImagePageState extends State<RawImagePage> {
  bool _selected = false;
  ImageInfo _imageInfo;
  final List<BlendMode> _blendModeList = BlendMode.values;
  final List<BoxFit> _boxFitList = BoxFit.values;
  BoxFit _boxFit = BoxFit.cover;

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
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: _getItemBuilder,
          itemCount: _blendModeList.length,
          padding: EdgeInsets.only(top: 10.0),
        ),
        onTap: () {
          setState(() {
            _selected = !_selected;

            _boxFit = _boxFitList[math.Random().nextInt(_boxFitList.length)];
            print('_boxFit: $_boxFit');
          });
        },
      ),
    );
  }

  Widget _getItemBuilder(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        RawImage(
          image: _imageInfo?.image,
          color: Colors.red,
          width: 50.0,
          height: 50.0,
          colorBlendMode: _blendModeList[index],
          fit: _boxFit,
        ),
        Container(
          child: Text(
            _blendModeList[index].toString().split('\.')[1],
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Image
        .asset('assets/images/lake.jpg')
        .image
        .resolve(createLocalImageConfiguration(context))
        .addListener(
        ImageStreamListener(
            (ImageInfo imageInfo, bool synchronous) {
              setState(() {
                _imageInfo = imageInfo;
              });
            },
            onError: (dynamic exception, StackTrace stackTrace) {
              print('exception: ${exception.toString()}, stackTrace: ${stackTrace.toString()}');
            }
        )
    );
  }
}