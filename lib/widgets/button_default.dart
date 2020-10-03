import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  final String text;
  final Function onPressed;

  const ButtonDefault({Key key, @required this.text, @required this.onPressed})
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
      color: Color.fromRGBO(52, 152, 219, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: this.onPressed,
    );
  }
}
