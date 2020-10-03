import 'package:flutter/material.dart';
import 'package:ingenieria_flutter/widgets/button_default.dart';
import 'package:ingenieria_flutter/widgets/custom_input.dart';
import 'package:ingenieria_flutter/widgets/labels.dart';
import 'package:ingenieria_flutter/widgets/logo.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromRGBO(236, 240, 241, 1),
      padding: EdgeInsets.only(top: 50, right: 30, left: 30, bottom: 50),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Logo(), _Form(), Labels()]),
    ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final rutCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          CustomInput(
              icon: Icons.person_outline,
              placeholder: 'Rut',
              textController: rutCtrl),
          CustomInput(
              icon: Icons.lock_outline,
              placeholder: 'Contraseña',
              textController: passwordCtrl,
              isPassword: true),
          ButtonDefault(
            text: 'Ingresar',
            onPressed: () => {},
          )
        ],
      ),
    );
  }
}
