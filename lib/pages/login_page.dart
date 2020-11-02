import 'package:dart_rut_validator/dart_rut_validator.dart';
import 'package:flutter/material.dart';
import 'package:dart_rut_validator/dart_rut_validator.dart';

/*****  Helpers *****/
import 'package:ingenieria_flutter/helpers/show_alert.dart';

/*****  Providers *****/
import 'package:ingenieria_flutter/providers/push_notification_provider.dart';
import 'package:ingenieria_flutter/widgets/label_error.dart';
import 'package:provider/provider.dart';

/*****  Services *****/
import 'package:ingenieria_flutter/services/auth_service.dart';

/*****  Widgets *****/
import 'package:ingenieria_flutter/widgets/button_default.dart';
import 'package:ingenieria_flutter/widgets/custom_input.dart';
import 'package:ingenieria_flutter/widgets/labels.dart';
import 'package:ingenieria_flutter/widgets/logo.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  TextEditingController _rutController = TextEditingController();

  @override
  void initState() {
    _rutController.clear();
    super.initState();
    final pushProvider = new PushNotificationsProvider();
    pushProvider.initNotifications();
  }

  void onChangedApplyFormat(String text) {
    RUTValidator.formatFromTextController(_rutController);
  }

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
  FocusNode rutFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool rutIsValid = false;
  bool passwordIsValid = false;
  bool formSubmitted = false;

  @override
  void initState() {
    super.initState();
  }

  reverseRut() {
    rutCtrl.text = rutCtrl.text.split(".").join("").split("-").join("");
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          CustomInput(
              // onFocusChange: () {
              //   // Validación de rut
              //   List rutDv = [];
              //   int rutNumbers = 1;
              //   String dv = "1";
              //   print('onFocus');

              //   // Evento focus en input
              //   if (rutFocus.hasFocus) {
              //     if (rutCtrl.text.trim() != "") {
              //       rutCtrl.text = RUTValidator.formatFromText(rutCtrl.text);
              //       rutDv = rutCtrl.text.split(".").join("").split("-");
              //       rutNumbers = int.parse(rutDv[0]);
              //       rutCtrl.text =
              //           rutCtrl.text.split(".").join("").split("-").join("");
              //     }
              //   } else {
              //     rutCtrl.text = RUTValidator.formatFromText(rutCtrl.text);
              //     rutDv = rutCtrl.text.split(".").join("").split("-");
              //     rutNumbers = int.parse(rutDv[0]);
              //     dv = rutDv[1];
              //   }
              //   final result = RUTValidator(numbers: rutNumbers, dv: dv);
              //   rutIsValid = result.isValid;
              //   print(
              //       "Focus rut ${rutFocus.hasFocus}, Result: ${result.isValid} , ${rutIsValid}, ${formSubmitted}");
              // },
              icon: Icons.person_outline,
              placeholder: 'Rut',
              textController: rutCtrl),
          (!rutIsValid && formSubmitted)
              ? LabelError(text: "Rut inválido", onPressed: () => {})
              : SizedBox(height: 10),
          SizedBox(height: 10),
          CustomInput(
              // onFocusChange: () {
              //   if (passwordCtrl.text.length > 5) {
              //     passwordIsValid = true;
              //   } else {
              //     passwordIsValid = false;
              //   }
              //   print("Focus password ${passwordFocus.hasFocus}");
              // },
              icon: Icons.lock_outline,
              placeholder: 'Contraseña',
              textController: passwordCtrl,
              isPassword: true),
          (!passwordIsValid && formSubmitted)
              ? LabelError(text: "Mínimo 6 caracteres", onPressed: () => {})
              : SizedBox(height: 10),
          SizedBox(height: 10),
          ButtonDefault(
            text: 'Ingresar',
            onPressed: authService.auth
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    try {
                      formSubmitted = true;
                      if (rutIsValid && passwordIsValid) {
                        final String rut = rutCtrl.text
                            .split(".")
                            .join("")
                            .split("-")
                            .join("");
                        final response =
                            await authService.login(rut, passwordCtrl.text);
                        print('response: ${response}');
                        if (response.ok) {
                          showAlert(context, 'Autenticado', response.message);
                          Navigator.pushReplacementNamed(context, '/home');
                        } else {
                          String message = response.message.length > 0
                              ? response.message
                              : 'Existen problemas, intentar más tarde';

                          showAlert(
                              context, 'Problemas al autenticar', message);
                        }
                      }
                    } catch (e) {
                      print('catch error: ${e}');
                      String message = e.message
                          ? e.message
                          : 'Existen problemas, intentar más tarde';
                      showAlert(context, 'Error en autenticación', message);
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
