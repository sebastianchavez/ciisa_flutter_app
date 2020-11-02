// import 'package:flutter/material.dart';
// import 'package:dart_rut_validator/dart_rut_validator.dart';

// class RutInput extends StatefulWidget {
//   RutInput({Key key}) : super(key: key);

//   @override
//   _RutInputState createState() => _RutInputState();
// }

// class _RutInputState extends State<RutInput> {
//   TextEditingController _rutController = TextEditingController();

// @override
// void initState() {
//   _rutController.clear();
//   super.initState();
// }

// //Método para aplicar formato de manera
// //automática:
// void onChangedApplyFormat(String text) {
//   RUTValidator.formatFromTextController(_rutController);
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       //... Código de tu app

//       //Es importante especificar:
//       //   *El controlador del texto que
//       //    en este caso es _rutController.
//       //    De esta manera se aplicará el
//       //    formato cada vez que el usuario
//       //   ingrese un nuevo número o letra.
//       //
//       //   *El método onChanged con la
//       //    función `formatFromTextController`
//       //    de rut_validator en su interior.
//       TexFormField(
//           controller: _rutController, onChanged: onChangedApplyFormat));
// }

// }
