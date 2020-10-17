import 'package:flutter/material.dart';
import 'package:ingenieria_flutter/helpers/show_alert.dart';
import 'package:ingenieria_flutter/services/auth_service.dart';
import 'package:ingenieria_flutter/widgets/button_default.dart';
import 'package:ingenieria_flutter/widgets/custom_input.dart';
import 'package:ingenieria_flutter/widgets/labels.dart';
import 'package:ingenieria_flutter/widgets/logo.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      color: Color.fromRGBO(236, 240, 241, 1),
      padding: EdgeInsets.only(right: 30, left: 30, bottom: 50),
      child: ListView(children: <Widget>[
        SizedBox(height: 40),
        Logo(),
        _Form(),
      ]),
    )));
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
    final authService = Provider.of<AuthService>(context);

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
            onPressed: authService.auth
                ? null
                : () async {
                    FocusScope.of(context).unfocus();

                    print({'rut': rutCtrl.text, 'password': passwordCtrl.text});

                    try {
                      final response = await authService.login(
                          rutCtrl.text, passwordCtrl.text);
                      print('response: ${response}');
                      if (response.ok) {
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        String message = response.message.length > 0
                            ? response.message
                            : 'Existen problemas, intentar más tarde';

                        showAlert(context, 'Problemas al autenticar', message);
                      }
                    } catch (e) {
                      print('catch error: ${e}');
                      // String message = e.message
                      //     ? e.message
                      //     : 'Existen problemas, intentar más tarde';
                      // print('Error: ${e}');
                      // showAlert(context, 'Error en autenticación', message);
                    }
                  },
          ),
          SizedBox(height: 15),
          Labels(
              onPressed: () => Navigator.pushNamed(context, '/recovery-pass'),
              text: 'Recuperar contraseña')
        ],
      ),
    );
  }
}
