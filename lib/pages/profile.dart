import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  String first_name = "Nombre";
  String second_name = "apellido";
  String email = "Correo electronico";
  String pathImage = "assets/imgs/logo.jpg";

  Profile(this.first_name, this.second_name, this.email);

  @override
  Widget build(BuildContext context) {
    final photo = Container(
      margin: EdgeInsets.only(top: 200.0, left: 20.0),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(pathImage))),
    );

    final boxFirstName = Container(
      margin: EdgeInsets.only(top: 20, left: 20.0),
      child: Text(
        first_name,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 17.0, color: Colors.black, backgroundColor: Colors.white),
      ),
    );

    final boxSecondName = Container(
      margin: EdgeInsets.only(top: 20, left: 20.0),
      child: Text(
        second_name,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 17.0, color: Colors.black, backgroundColor: Colors.white),
      ),
    );

    final boxEmail = Container(
      margin: EdgeInsets.only(top: 20, left: 20.0),
      child: Text(
        email,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 17.0, color: Colors.black, backgroundColor: Colors.white),
      ),
    );

    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        Column(
          children: [photo, boxFirstName, boxSecondName, boxEmail],
        )
      ],
    );
  }
}
