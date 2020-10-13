import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ingenieria_flutter/widgets/button_default.dart';
import 'package:ingenieria_flutter/widgets/text_input.dart';

class RecoveryPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset(
      'assets/icons/back.svg',
      height: 40,
      width: 40,
      color: Colors.white,
    );

    final _controllerEmail = TextEditingController();

    final emailBox = Container(
      color: Color.fromRGBO(236, 240, 241, 1),
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          TextInput(
            hintText: "Email",
            inputType: null,
            maxLines: 1,
            controller: _controllerEmail,
          ),
          SizedBox(
            height: 60,
          ),
          ButtonDefault(
            text: 'Recuperar contraseña',
            onPressed: () {
              //TODO: Agregar funcionalidad
            },
          )
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(39, 174, 96, 1),
        title: Text('Comentarios'),
        leading: IconButton(
          padding: EdgeInsets.all(15),
          icon: svg,
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          emailBox,
        ],
      ),
    );
  }
}
