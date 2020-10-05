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

    final boxFirstName = Container(
      margin: EdgeInsets.only(top: 20, left: 20.0),
      child: Text(
        first_name,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 17.0, color: Colors.black, backgroundColor: Colors.white),
      ),
    );

    final boxSecondName = Container(
      margin: EdgeInsets.only(top: 20, left: 20.0),
      child: Text(
        second_name,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 17.0, color: Colors.black, backgroundColor: Colors.white),
      ),
    );

    final boxEmail = Container(
      margin: EdgeInsets.only(top: 20, left: 20.0),
      child: Text(
        email,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 17.0, color: Colors.black, backgroundColor: Colors.white),
      ),
    );

    final boxEmail2 = ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            TextField(
              maxLengthEnforced: false,
              maxLines: null,
              controller: _textController,
              decoration: new InputDecoration(hintText: "Add info 1"),
            ),
            TextField(
              maxLengthEnforced: false,
              maxLines: null,
              controller: _textController,
              decoration: new InputDecoration(hintText: "Add info 1"),
            ),
          ],
        ),
      ],
    );

    final forum = Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Email",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return "Porfavor entra un email";
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  //process data
                }
              },
              child: Text("Submit"),
            ),
          )
        ],
      ),
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
          /*
          Row(
            children: <Widget>[
              Flexible(
                  child: Container(
                padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
              ))
              //
            ],
            //
          ),*/
          photo,
          emailBox,

          /*
        Column(
          children: [emailBox],
        ),*/
          /*
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [photo, emailBox],
        ),*/
          /*
        SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .35,
                right: 20.0,
                left: 20.0),
            child: Column(
              children: <Widget>[emailBox],
            ),
          ),
        )
        */
        ],
      ),
    );
  }
}
