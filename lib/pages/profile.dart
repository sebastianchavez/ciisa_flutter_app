import 'package:flutter/material.dart';
import 'package:ingenieria_flutter/widgets/button_default.dart';
import 'package:ingenieria_flutter/widgets/text_input.dart';

class Profile extends StatelessWidget {
  String first_name = "Nombre";
  String second_name = "apellido";
  String email = "Correo electronico";
  String pathImage = "assets/imgs/logo.jpg";
  final _textController = TextEditingController();

  Profile(this.first_name, this.second_name, this.email);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //
    final _controllerFirstName = TextEditingController();
    final _controllerSecondName = TextEditingController();
    final _controllerEmail = TextEditingController();
    //
    final photo = Container(
      //alignment: FractionalOffset.center,
      margin: EdgeInsets.only(top: 60.0, left: 92.0, right: 90.0),
      width: 180.0,
      height: 180.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(pathImage))),
    );

    final emailBox = Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.only(top: 220.0),
      child: ListView(
        children: <Widget>[
          //Container(),//foto
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: TextInput(
              hintText: "Nombre",
              inputType: null,
              maxLines: 1,
              controller: _controllerFirstName,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: TextInput(
              hintText: "Apellido",
              inputType: null,
              maxLines: 1,
              controller: _controllerSecondName,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: TextInput(
              hintText: "Email",
              inputType: TextInputType.emailAddress,
              maxLines: 1,
              controller: _controllerEmail,
            ),
          ),
          ButtonDefault(
            text: 'Guardar',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          )
        ],
      ),
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          photo,
          emailBox,
        ],
      ),
    );
  }
}
