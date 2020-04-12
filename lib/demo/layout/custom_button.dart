import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key key, this.labelText}) : super(key: key);

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image(
          image: AssetImage('assets/images/home_top_card.png'),
          width: 44.0,
          height: 44.0,
        ),
        Image.asset(
          'assets/images/home_top_card.png',
          width: 44.0,
          height: 44.0,
        ),
        Padding(
          padding: EdgeInsets.only(top: 22.0, left: 5.0, bottom: 22.0, right: 5.0),
        ),
        RaisedButton(
          onPressed: () {

          },
          child: Text(labelText),
        )
      ],
    );
  }
}
