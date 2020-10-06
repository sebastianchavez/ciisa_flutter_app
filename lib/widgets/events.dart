import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  String day = "26";
  String title = "Titulo generico";
  String date = "23-09-2020";
  String hour = "18:40";

  Events(this.day, this.title, this.date, this.hour);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final dayBox = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        day,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 13.0, fontWeight: FontWeight.w900),
      ),
    );

    final titleBox = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 13.0, color: Color(0xFFa3a5a7)),
      ),
    );

    final dateBox = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        date,
        textAlign: TextAlign.left,
        style: TextStyle(fontFamily: "Lato", fontSize: 17.0),
      ),
    );

    final hourBox = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        hour,
        textAlign: TextAlign.left,
        style: TextStyle(fontFamily: "Lato", fontSize: 17.0),
      ),
    );

    final finalCard = Row(
      //crossAxisAlignment: CrossAxisAlignment.start,
      //children: <Widget>[userName, userInfo, userComment],
      children: <Widget>[
        dayBox,
        Column(
            //
            children: <Widget>[
              titleBox,
              Row(
                children: [dateBox, hourBox],
              )
            ])
      ],
    );

    return Row(
      children: <Widget>[finalCard],
    );
  }
}
