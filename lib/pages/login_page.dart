import 'package:dart_rut_validator/dart_rut_validator.dart';
import 'package:flutter/material.dart';
import 'package:dart_rut_validator/dart_rut_validator.dart';

/*****  Helpers *****/
import 'package:ingenieria_flutter/helpers/show_alert.dart';

/*****  Providers *****/
import 'package:ingenieria_flutter/providers/push_notification_provider.dart';
import 'package:ingenieria_flutter/services/news_service.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final newsService = Provider.of<NewsService>(context);

    validateRut(String value) {
      int rutNumbers = int.parse(value.substring(0, value.length - 1));
      String dv = value.substring(value.length - 1);
      final result = RUTValidator(numbers: rutNumbers, dv: dv);
      authService.rutIsValid = result.isValid;
    }

    validatePassword(String value) {
      if (value.length > 5) {
        authService.passwordIsValid = true;
      } else {
        authService.passwordIsValid = false;
      }
    }

    formatterRut(value) {
      if (rutFocus.hasFocus) {
        if (rutCtrl.text.trim() != "") {
          rutCtrl.text = rutCtrl.text.split(".").join("").split("-").join("");
        }
      } else {
        rutCtrl.text = RUTValidator.formatFromText(rutCtrl.text);
      }
    }

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          CustomInput(
              onChange: (_) => validateRut(_),
              focusNode: rutFocus,
              onFocusChange: (_) => formatterRut(_),
              icon: Icons.person_outline,
              placeholder: 'Rut',
              textController: rutCtrl),
          (!authService.rutIsValid && authService.loginSubmit)
              ? LabelError(text: "Rut inválido", onPressed: () => {})
              : SizedBox(height: 10),
          SizedBox(height: 10),
          CustomInput(
              onChange: (_) => validatePassword(_),
              focusNode: passwordFocus,
              onFocusChange: (_) => {},
              icon: Icons.lock_outline,
              placeholder: 'Contraseña',
              textController: passwordCtrl,
              isPassword: true),
          (!authService.passwordIsValid && authService.loginSubmit)
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
                      authService.loginSubmit = true;
                      if (authService.rutIsValid &&
                          authService.passwordIsValid) {
                        final String rut = rutCtrl.text
                            .split(".")
                            .join("")
                            .split("-")
                            .join("");
                        final response =
                            await authService.login(rut, passwordCtrl.text);
                        print('response: ${response}');
                        if (response.ok) {
                          final resp = await newsService.getFirstNews();
                          newsService.listNews = resp.data;
                          // showAlert(context, 'Autenticado', response.message);

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
                      String message = 'Existen problemas, intentar más tarde';
                      // ? e.message
                      // : 'Existen problemas, intentar más tarde';
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
