import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text("Home Page",
              style: TextStyle(
                  fontSize: 37.0,
                  fontFamily: "Lato",
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              )
              )
              ]
            ),
          )
        ],
      ),
    );
  }

  checkLoginStatus() async {

  }

}