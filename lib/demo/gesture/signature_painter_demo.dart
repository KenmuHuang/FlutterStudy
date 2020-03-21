import 'package:flutter/material.dart';

final String routeNameOfSignaturePainterDemoPage1 = '/SignaturePainterDemoPage1';
final String routeNameOfSignaturePainterDemoPage2 = '/SignaturePainterDemoPage2';

class SignaturePainterDemo extends CustomPainter {
  SignaturePainterDemo(this.points);

  final List<Offset> points;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i+1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainterDemo oldDelegate) {
    return oldDelegate.points != points;
  }
}

class SignaturePainterDemoPage extends StatefulWidget {
  SignaturePainterDemoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignaturePainterDemoPageState createState() {
    return _SignaturePainterDemoPageState();
  }
}

class _SignaturePainterDemoPageState extends State<SignaturePainterDemoPage> {
  List<Offset> _points = <Offset>[];

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // https://stackoverflow.com/questions/44978216/flutter-remove-back-button-on-appbar
            Navigator.of(context).pop(widget.title);
          },
        ),
      ),
      body: new Stack(
        children: <Widget>[
          GestureDetector(
            onPanUpdate: (DragUpdateDetails details) {
              RenderBox referenceBox = context.findRenderObject();
              Offset localPosition = referenceBox.globalToLocal(details.globalPosition);

              // 解决「绘画转换的本地位置由于存在 AppBar 而偏移」问题：https://gist.github.com/kitttn/408aa1264b82ae8ce1c0098a270e4f52
              localPosition = Offset(localPosition.dx, localPosition.dy - kToolbarHeight);

              setState(() {
                _points = List.from(_points)..add(localPosition);
              });
            },
            onPanEnd: (DragEndDetails detail) => _points.add(null),
            child: CustomPaint(
              painter: SignaturePainterDemo(_points),
              size: Size.infinite,
            ),
          ),
        ],
      ),
      backgroundColor: (routeNameOfSignaturePainterDemoPage1.endsWith(widget.title) ? Colors.lightBlue[50] : Colors.grey[300]),
    );
  }
}