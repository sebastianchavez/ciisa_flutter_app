import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  String day = "26";
  String title = "Titulo generico";
  String date = "23-09-2020";
  String hour = "18:40";

  Events(this.day, this.title, this.date, this.hour);

  @override
  Widget build(BuildContext context) {
    final dayBox = Container(
      margin: EdgeInsets.only(top: 20.0, left: 25.0),
      child: Text(
        day,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.w400,
            color: Color(0xFFFFFFFF)),
      ),
    );

    final titleBox = Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 20.0, color: Color(0xFFFFFFFF)),
      ),
    );

    final dateBox = Container(
      margin: EdgeInsets.only(left: 20.0, bottom: 20.0),
      child: Text(
        date,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 16.0, color: Color(0xFFFFFFFF)),
      ),
    );

    final hourBox = Container(
      margin: EdgeInsets.only(left: 20.0, bottom: 20.0),
      child: Text(
        hour,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 16.0, color: Color(0xFFFFFFFF)),
      ),
    );

    final finalCard = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        dayBox,
        Column(children: [
          titleBox,
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [dateBox, hourBox],
          )
        ])
      ],
    );

    final rialCard = Container(
      margin: EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        color: Color(0xFF16a085),
        borderRadius: BorderRadius.circular(10),
      ),
      child: finalCard,
    );

    return rialCard;
  }
}
