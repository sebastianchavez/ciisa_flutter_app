import 'package:flutter/material.dart';

class ButtonDefault extends StatefulWidget {

  final String textButton;
  final VoidCallback voidCallback;
  double height = 0.0;
  double width = 0.0;

  ButtonDefault({Key key, @required this.textButton, @required this.voidCallback, this.height, this.width});

  @override
  State<StatefulWidget> createState() {
    return _ButtonDefault();
  }
}

class _ButtonDefault extends State<ButtonDefault> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.voidCallback,
      child: Container(
        margin: EdgeInsets.only(
          top: 10.0
        ),
        padding: EdgeInsets.only(
            top: 10.0,
            bottom: 10.0,
            left: 20.0,
            right: 20.0
        ),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
            color: Color.fromRGBO(48, 51, 107, 1)
        ),

        child: Center(
          child: Text(
            widget.textButton,
            style: TextStyle(
                fontSize: 18.0,
                fontFamily: "Lato",
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }



}