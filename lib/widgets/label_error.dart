import 'package:flutter/material.dart';

class LabelError extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const LabelError({Key key, @required this.onPressed, @required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(0),
        child: InkWell(
          onTap: onPressed,
          child: Text(text,
              style: TextStyle(
                  color: Color.fromRGBO(231, 76, 60, 1), fontSize: 17)),
        ));
  }
}
