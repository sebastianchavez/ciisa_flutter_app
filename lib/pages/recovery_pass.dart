import 'package:flutter/material.dart';
import 'package:ingenieria_flutter/widgets/button_default.dart';
import 'package:ingenieria_flutter/widgets/text_input.dart';

class RecoveryPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    final _controllerEmail = TextEditingController();

    final emailBox = Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.only(top: 93.0),
      child: ListView(
        children: <Widget>[
          //Container(),//foto
          Container(
            margin: EdgeInsets.only(bottom: 70.0),
            child: TextInput(
              hintText: "Email",
              inputType: null,
              maxLines: 1,
              controller: _controllerEmail,
            ),
          ),

          ButtonDefault(
            text: 'Recuperar contraseña',
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
          emailBox,
        ],
      ),
    );
  }
}
