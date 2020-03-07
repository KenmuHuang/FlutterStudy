import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key key, this.labelText}) : super(key: key);

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {

      },
      child: Text(labelText),
    );
  }
}
