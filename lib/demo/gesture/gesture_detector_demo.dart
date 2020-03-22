import 'package:flutter/material.dart';

final String routeNameOfGestureDetectorDemoPage = '/GestureDetectorDemoPage';

class GestureDetectorDemo extends StatelessWidget {
  GestureDetectorDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetectorDemoPage(
      title: 'Gesture Detector Demo Page',
    );
  }
}

class GestureDetectorDemoPage extends StatefulWidget {
  GestureDetectorDemoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GestureDetectorDemoPageState createState() {
    return _GestureDetectorDemoPageState();
  }
}

class _GestureDetectorDemoPageState extends State<GestureDetectorDemoPage> with TickerProviderStateMixin {
  static const double logoDefaultWidth = 100.0;
  GlobalKey _stackGlobalKey = GlobalKey();
  double _areaWidth = 0.0;
  double _areaHeight = 0.0;
  double _logoWidth = logoDefaultWidth;
  double _logoLeft = 0.0;
  double _logoTop = 0.0;
  bool alreadyBuildPosition = false;
  AnimationController controller;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      _resetAreaSize();
    });

    // Animation
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this
    );
    curvedAnimation = CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!alreadyBuildPosition) {
      final screenSize = MediaQuery.of(context).size;
      _logoTop = 200.0;
      _logoLeft = (screenSize.width - _logoWidth) / 2;
      alreadyBuildPosition = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _getStackWidget(),
    );
  }

  Widget _getStackWidget() {
    return Stack(
      key: _stackGlobalKey,
      children: <Widget>[
        Positioned(
            top: _logoTop,
            left: _logoLeft,
            child: GestureDetector(
              child: RotationTransition(
                  turns: curvedAnimation,
                  child: FlutterLogo(
                    size: _logoWidth,
                  )),
              onTapDown: (TapDownDetails details) {
                // 单击事件执行顺序：onTapDown -> onTapUp -> onTap
                // flutter: FlutterLogo tap down = 2020-03-14 18:41:45.728748
                // flutter: FlutterLogo tap up = 2020-03-14 18:41:45.732189
                // flutter: FlutterLogo tap = 2020-03-14 18:41:45.732499
                print('FlutterLogo tap down = ${DateTime.now()}');
              },
              onTapUp: (TapUpDetails details) {
                print('FlutterLogo tap up = ${DateTime.now()}');
              },
              onTap: () {
                print('FlutterLogo tap = ${DateTime.now()}');
              },
              onTapCancel: () {
                print('FlutterLogo tap cancel = ${DateTime.now()}');
              },
              onDoubleTap: () {
                // 双击事件
                print(
                    'Click listener way of GestureDetector, FlutterLogo double clicked');

                // 旋转动画
                if (controller.isCompleted) {
                  controller.reverse();
                } else {
                  controller.forward();
                }
              },
              onLongPressStart: (LongPressStartDetails details) {
                // 长按事件执行顺序：onTapDown -> onLongPressStart -> onLongPress -> onLongPressMoveUpdate(none or more) -> onLongPressEnd -> onLongPressUp
                // flutter: FlutterLogo tap down = 2020-03-14 18:56:07.487378
                // flutter: FlutterLogo tap cancel = 2020-03-14 18:56:07.587378
                // flutter: FlutterLogo long press start = 2020-03-14 18:56:07.886408
                // flutter: FlutterLogo long press = 2020-03-14 18:56:07.886785
                // flutter: FlutterLogo long press move update = 2020-03-14 18:56:07.924898
                // flutter: FlutterLogo long press move update = 2020-03-14 18:56:07.947631
                // flutter: FlutterLogo long press move update = 2020-03-14 18:56:07.984752
                // flutter: FlutterLogo long press move update = 2020-03-14 18:56:08.125637
                // flutter: FlutterLogo long press end = 2020-03-14 18:56:08.126128
                // flutter: FlutterLogo long press up = 2020-03-14 18:56:08.126341
                print('FlutterLogo long press start = ${DateTime.now()}');
              },
              onLongPress: () {
                print('FlutterLogo long press = ${DateTime.now()}');
              },
              onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) {
                print('FlutterLogo long press move update = ${DateTime.now()}');
              },
              onLongPressEnd: (LongPressEndDetails details) {
                print('FlutterLogo long press end = ${DateTime.now()}');

                setState(() {
                  _logoWidth = _logoWidth == logoDefaultWidth ? 200.0 : logoDefaultWidth;
                  _resetAreaSize();

                  // 屏幕边界限制
                  if (_logoLeft > _areaWidth) {
                    _logoLeft = _areaWidth;
                  }

                  if (_logoTop > _areaHeight) {
                    _logoTop = _areaHeight;
                  }
                });
              },
              onLongPressUp: () {
                print('FlutterLogo long press up = ${DateTime.now()}');
              },
              onPanDown: (DragDownDetails details) {
                print('FlutterLogo pan down = ${DateTime.now()}');
              },
              onPanStart: (DragStartDetails details) {
                // 拖拽事件执行顺序：onPanDown -> onPanStart -> onPanUpdate(none or more) -> onPanEnd
                // flutter: FlutterLogo pan down = 2020-03-14 19:56:19.052505
                // flutter: FlutterLogo tap down = 2020-03-14 19:56:19.154075
                // flutter: FlutterLogo pan start = 2020-03-14 19:56:19.176830
                // flutter: FlutterLogo pan update = 2020-03-14 19:56:31.841730
                // flutter: FlutterLogo pan update = 2020-03-14 19:56:32.872869
                // flutter: FlutterLogo pan end = 2020-03-14 19:56:40.130360
                // or
                // flutter: FlutterLogo pan down = 2020-03-14 19:57:11.258191
                // flutter: FlutterLogo tap down = 2020-03-14 19:57:11.362197
                // flutter: FlutterLogo pan cancel = 2020-03-14 19:57:11.591220
                // flutter: FlutterLogo tap up = 2020-03-14 19:57:11.898084
                // flutter: FlutterLogo tap = 2020-03-14 19:57:11.898474
                print('FlutterLogo pan start = ${DateTime.now()}');
              },
              onPanUpdate: (DragUpdateDetails details) {
                print('FlutterLogo pan update = ${DateTime.now()}');

                // 拖拽到新位置
                setState(() {
                  _logoLeft += details.delta.dx;
                  _logoTop += details.delta.dy;
                  // 屏幕边界限制
                  if (_logoLeft < 0) {
                    _logoLeft = 0;
                  } else if (_logoLeft > _areaWidth) {
                    _logoLeft = _areaWidth;
                  }

                  if (_logoTop < 0) {
                    _logoTop = 0;
                  } else if (_logoTop > _areaHeight) {
                    _logoTop = _areaHeight;
                  }
                });
              },
              onPanEnd: (DragEndDetails details) {
                print('FlutterLogo pan end = ${DateTime.now()}');
              },
              onPanCancel: () {
                print('FlutterLogo pan cancel = ${DateTime.now()}');
              },
//              onVerticalDragDown: (DragDownDetails details) {
//                // 垂直拖拽事件执行顺序（优先于 pan 拖拽事件）：onVerticalDragDown -> onVerticalDragStart -> onVerticalDragUpdate(none or more) -> onVerticalDragEnd
//                // 同理存在 onHorizontalDragDown 水平拖拽事件执行顺序（优先于 pan 拖拽事件）
//                // flutter: FlutterLogo vertical drag down = 2020-03-14 20:09:13.697302
//                // flutter: FlutterLogo pan down = 2020-03-14 20:09:13.697815
//                // flutter: FlutterLogo pan cancel = 2020-03-14 20:09:13.802091
//                // flutter: FlutterLogo vertical drag start = 2020-03-14 20:09:13.802352
//                // flutter: FlutterLogo vertical drag update = 2020-03-14 20:09:13.823960
//                // flutter: FlutterLogo vertical drag update = 2020-03-14 20:09:13.840435
//                // flutter: FlutterLogo vertical drag end = 2020-03-14 20:09:13.977218
//                // or
//                // flutter: FlutterLogo vertical drag down = 2020-03-14 20:10:19.538499
//                // flutter: FlutterLogo pan down = 2020-03-14 20:10:19.538971
//                // flutter: FlutterLogo tap down = 2020-03-14 20:10:19.642795
//                // flutter: FlutterLogo vertical drag cancel = 2020-03-14 20:10:19.699577
//                // flutter: FlutterLogo pan cancel = 2020-03-14 20:10:19.699971
//                // flutter: FlutterLogo tap up = 2020-03-14 20:10:20.000595
//                // flutter: FlutterLogo tap = 2020-03-14 20:10:20.000963
//                print('FlutterLogo vertical drag down = ${DateTime.now()}');
//              },
//              onVerticalDragStart: (DragStartDetails details) {
//                print('FlutterLogo vertical drag start = ${DateTime.now()}');
//              },
//              onVerticalDragUpdate: (DragUpdateDetails details) {
//                print('FlutterLogo vertical drag update = ${DateTime.now()}');
//              },
//              onVerticalDragEnd: (DragEndDetails details) {
//                print('FlutterLogo vertical drag end = ${DateTime.now()}');
//              },
//              onVerticalDragCancel: () {
//                print('FlutterLogo vertical drag cancel = ${DateTime.now()}');
//              },
              onForcePressStart: (ForcePressDetails details) {
                // 有压感设备长按事件执行顺序：onForcePressStart -> onForcePressUpdate(none or more) -> onForcePressPeak -> onForcePressUpdate(none or more) -> onForcePressEnd
                // flutter: FlutterLogo vertical drag down = 2020-03-14 20:41:47.617126
                // flutter: FlutterLogo pan down = 2020-03-14 20:41:47.617613
                // flutter: FlutterLogo tap down = 2020-03-14 20:41:47.719915
                // flutter: FlutterLogo tap cancel = 2020-03-14 20:41:47.968785
                // flutter: FlutterLogo vertical drag cancel = 2020-03-14 20:41:47.970143
                // flutter: FlutterLogo pan cancel = 2020-03-14 20:41:47.971905
                // flutter: FlutterLogo force press start = 2020-03-14 20:41:47.973006
                // flutter: FlutterLogo force press peak = 2020-03-14 20:41:47.975256
                // flutter: FlutterLogo force press update = 2020-03-14 20:41:47.975995
                // flutter: FlutterLogo force press update = 2020-03-14 20:41:47.999649
                // flutter: FlutterLogo force press end = 2020-03-14 20:41:48.583850
                // or
                // flutter: FlutterLogo vertical drag down = 2020-03-14 20:47:17.793453
                // flutter: FlutterLogo pan down = 2020-03-14 20:47:17.794690
                // flutter: FlutterLogo tap down = 2020-03-14 20:47:17.895643
                // flutter: FlutterLogo tap cancel = 2020-03-14 20:47:18.087656
                // flutter: FlutterLogo vertical drag cancel = 2020-03-14 20:47:18.090282
                // flutter: FlutterLogo pan cancel = 2020-03-14 20:47:18.091571
                // flutter: FlutterLogo force press start = 2020-03-14 20:47:18.092381
                // flutter: FlutterLogo force press update = 2020-03-14 20:47:18.093274
                // flutter: FlutterLogo force press update = 2020-03-14 20:47:18.100812
                // flutter: FlutterLogo force press update = 2020-03-14 20:47:18.118325
                // flutter: FlutterLogo force press peak = 2020-03-14 20:47:18.458787
                // flutter: FlutterLogo force press update = 2020-03-14 20:47:18.459447
                // flutter: FlutterLogo force press update = 2020-03-14 20:47:18.576460
                // flutter: FlutterLogo force press end = 2020-03-14 20:47:18.577950
                print('FlutterLogo force press start = ${DateTime.now()}');
              },
              onForcePressPeak: (ForcePressDetails details) {
                print('FlutterLogo force press peak = ${DateTime.now()}');
              },
              onForcePressUpdate: (ForcePressDetails details) {
                print('FlutterLogo force press update = ${DateTime.now()}');
              },
              onForcePressEnd: (ForcePressDetails details) {
                print('FlutterLogo force press end = ${DateTime.now()}');
              },
//        onScaleStart: (ScaleStartDetails details) {
//          // 缩放事件执行顺序（不能跟 pan 拖拽事件同时存在）：onScaleStart -> onScaleUpdate(none or more) -> onScaleEnd
//          // flutter: FlutterLogo vertical drag down = 2020-03-14 20:27:06.933429
//          // flutter: FlutterLogo tap down = 2020-03-14 20:27:07.038145
//          // flutter: FlutterLogo tap cancel = 2020-03-14 20:27:07.281173
//          // flutter: FlutterLogo vertical drag cancel = 2020-03-14 20:27:07.362693
//          // flutter: FlutterLogo scale start = 2020-03-14 20:27:07.362993
//          // flutter: FlutterLogo scale update = 2020-03-14 20:27:07.363239
//          // flutter: FlutterLogo scale update = 2020-03-14 20:27:07.392433
//          // flutter: FlutterLogo scale end = 2020-03-14 20:27:07.928300
//          print('FlutterLogo scale start = ${DateTime.now()}');
//        },
//        onScaleUpdate: (ScaleUpdateDetails details) {
//          print('FlutterLogo scale update = ${DateTime.now()}');
//
//          setState(() {
//            // 限制缩放比例
//            double logoMaxWidth = stackGlobalKey.currentContext.size.width;
//            _logoWidth = _logoWidth * details.scale;
//            if (_logoWidth < 100.0) {
//              _logoWidth = 100.0;
//            } else if (_logoWidth > logoMaxWidth) {
//              _logoWidth = logoMaxWidth;
//            }
//            print('_size = $_logoWidth');
//          });
//        },
//        onScaleEnd: (ScaleEndDetails details) {
//          print('FlutterLogo scale end = ${DateTime.now()}');
//        },
            ))
      ],
    );
  }

  void _resetAreaSize() {
    // stackGlobalKey 是为了获取 widget 的尺寸
    _areaWidth = _stackGlobalKey.currentContext.size.width - _logoWidth;
    _areaHeight = _stackGlobalKey.currentContext.size.height - _logoWidth;
  }
}
