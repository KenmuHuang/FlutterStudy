import 'package:flutter/material.dart';

class AnimatedModalBarrierPage extends StatefulWidget {
  AnimatedModalBarrierPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimatedModalBarrierPageState createState() {
    return _AnimatedModalBarrierPageState();
  }
}

class _AnimatedModalBarrierPageState extends State<AnimatedModalBarrierPage> {
  bool _dismissible = false;

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: const Text('Open Modal View'),
              onPressed: () {
                Navigator.of(context).push(
                    MyPageRoute(
                        page: _ModalPage(),
                        dismissible: _dismissible
                    ));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('dismissible'),
                Switch(
                  value: _dismissible,
                  onChanged: (value) {
                    setState(() {
                      _dismissible = value;
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// https://github.com/mono0926/flutter-animations/blob/master/lib/pages/implicitly_animated/animated_modal_barrier.dart
class MyPageRoute extends TransitionRoute {
  MyPageRoute({
    @required this.page,
    @required this.dismissible,
  });

  final Widget page;
  final bool dismissible;

  @override
  Iterable<OverlayEntry> createOverlayEntries() {
    return [
      OverlayEntry(builder: _buildModalBarrier),
      OverlayEntry(builder: (context) => Center(child: page))
    ];
  }

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  Widget _buildModalBarrier(BuildContext context) {
    return IgnorePointer(
      ignoring: animation.status == AnimationStatus.reverse || // changedInternalState is called when this updates
          animation.status == AnimationStatus.dismissed, // dismissed is possible when doing a manual pop gesture
      child: AnimatedModalBarrier(
        color: animation.drive(
          ColorTween(
            begin: Colors.transparent,
            end: Colors.black.withAlpha(80),
          ),
        ),
        dismissible: dismissible,
      ),
    );
  }
}

class _ModalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('(　´･‿･｀)'),
            const SizedBox(height: 8.0),
            RaisedButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}