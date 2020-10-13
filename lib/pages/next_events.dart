import 'package:flutter/material.dart';
import 'package:ingenieria_flutter/widgets/events_list.dart';

class NextEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          EventsList(),
        ],
      ),
    );
  }
}
