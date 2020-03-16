import 'package:flutter/material.dart';

final String routeNameOfTextFieldDemoPage = '/TextFieldDemoPage';

class TextFieldDemo extends StatelessWidget {
  TextFieldDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldDemoPage(
      title: 'Text Field Demo Page',
    );
  }
}

class TextFieldDemoPage extends StatefulWidget {
  TextFieldDemoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TextFieldDemoPageState createState() {
    return _TextFieldDemoPageState();
  }
}

class _TextFieldDemoPageState extends State<TextFieldDemoPage> {
  final TextEditingController _controller = TextEditingController();
  VoidCallback _listener;
  String _errorText;

  @override
  void initState() {
    _listener = () {
      // Convert to lower case
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        // It cause to can not cancel type
//        selection: TextSelection(
//          baseOffset: text.length,
//          extentOffset: text.length,
//        ),
        composing: TextRange.empty,
      );
    };
    _controller.addListener(_listener);

    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Type something',
              errorText: _errorText,
              border: OutlineInputBorder(),
              icon: Icon(Icons.add),
              prefixIcon: Icon(Icons.title),
              suffixIcon: Icon(Icons.cached),
            ),
            onChanged: (String text) {
              print('typed: $text');
            },
            onSubmitted: (String text) {
              setState(() {
                if (isEmail(text)) {
                  _errorText = null;
                } else {
                  _errorText = 'Error: This is not an email';
                }
              });
            },
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10.0),
          ),
          RaisedButton(
            child: Text('done'),
            onPressed: () {
              String text = _controller.text;
              if (text.length > 0) {
                if (_errorText == null) {
                  showDialog(
                    context: context,
                    child: AlertDialog(
                      title: Text('What you typed'),
                      content: Text(text),
                    ),
                  );
                }
              } else {
                showDialog(
                  context: context,
                  child: AlertDialog(
                    content: Text('Please type something'),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }

  bool isEmail(String input) {
    String emailRegexp = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(emailRegexp);
    return regExp.hasMatch(input);
  }
}
