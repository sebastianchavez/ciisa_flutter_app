import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: EdgeInsets.only(bottom: 50),
        child: Column(
          children: <Widget>[
            Image(
                alignment: Alignment.center,
                height: 150.0,
                image: AssetImage("assets/imgs/logo.jpg"))
          ],
        ),
      ),
    );
  }
}
