import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const Labels({Key key, @required this.onPressed, @required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
      onTap: onPressed,
      child: Text(text,
          style: TextStyle(
              color: Color.fromRGBO(52, 152, 219, 1),
              fontSize: 18,
              fontWeight: FontWeight.bold)),
    ));
  }
}
