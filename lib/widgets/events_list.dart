import 'package:flutter/material.dart';
import 'events.dart';

class EventsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Events("26", "Titulo", "23-09-2020", "18:40"),
        Events("30", "Titulo", "23-09-2020", "18:40"),
        Events("01", "Titulo", "23-09-2020", "18:40"),
      ],
    );
  }
}
