import 'package:flutter/material.dart';

class ButtonDanger extends StatelessWidget {
  final String text;
  final Function onPressed;

  const ButtonDanger({Key key, @required this.text, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Container(
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(this.text,
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
      highlightElevation: 5,
      color: Color.fromRGBO(231, 76, 60, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: this.onPressed,
    );
  }
}
