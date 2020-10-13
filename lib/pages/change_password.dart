import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ingenieria_flutter/widgets/button_default.dart';
import 'package:ingenieria_flutter/widgets/text_input.dart';

class ChangePassword extends StatelessWidget {
  final Widget svg = SvgPicture.asset(
    'assets/icons/back.svg',
    height: 40,
    width: 40,
    color: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    final _controllerPassword = TextEditingController();

    final passwordBox = Container(
      margin: EdgeInsets.all(30.0),
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 70),
            child: TextInput(
              hintText: "Nueva contraseña",
              inputType: null,
              maxLines: 1,
              controller: _controllerPassword,
            ),
          ),
          ButtonDefault(
            text: 'Cambiar contraseña',
            onPressed: () {
              // TODO: Agregar funcionalidad cambiar contraseña
            },
          )
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(39, 174, 96, 1),
        title: Text('Cambiar contraseña'),
        leading: IconButton(
          padding: EdgeInsets.all(15),
          icon: svg,
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(236, 240, 241, 1),
            child: passwordBox,
          )
        ],
      ),
    );
  }
}
