import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ingenieria_flutter/widgets/button_default.dart';
import 'package:ingenieria_flutter/widgets/labels.dart';
import 'package:ingenieria_flutter/widgets/text_input.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Widget svg = SvgPicture.asset(
    'assets/icons/back.svg',
    height: 40,
    width: 40,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(39, 174, 96, 1),
          title: Text('Perfil'),
          leading: IconButton(
            padding: EdgeInsets.all(15),
            icon: svg,
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.all(30),
                color: Color.fromRGBO(236, 240, 241, 1),
                child: Center(
                  child: ListView(
                    children: <Widget>[_Photo(), _FormProfile()],
                  ),
                ))));
  }
}

class _Photo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String pathImage = "assets/imgs/no_profile.jpg";
    return Center(
      child: Container(
        width: 180,
        height: 180,
        margin: EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(image: AssetImage(pathImage))),
      ),
    );
  }
}

class _FormProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controllerFirstName = TextEditingController();
    final _controllerSecondName = TextEditingController();
    final _controllerEmail = TextEditingController();
    return Container(
      child: Column(
        children: <Widget>[
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
            onPressed: () => {
              //TODO: Agregar funcionalidad de actualizar perfil de usuario
            },
          ),
          SizedBox(height: 30),
          Labels(
              onPressed: () => Navigator.pushNamed(context, '/change-password'),
              text: 'Cambiar contraseña')
        ],
      ),
    );
  }
}
