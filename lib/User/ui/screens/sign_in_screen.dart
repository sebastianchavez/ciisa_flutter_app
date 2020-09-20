import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ingenieria_flutter/User/bloc/user_bloc.dart';
import 'package:ingenieria_flutter/main.dart';
import 'package:ingenieria_flutter/widgets/button_default.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {

  UserBloc userBloc = new UserBloc();
  var email, password, token;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return handleCurrentSession();
  }

  Widget handleCurrentSession(){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(149, 175, 192, 0.4)
            ),
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0
            ),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      labelText: "Email"
                  ),
                  onChanged: (val) {
                    email = val;
                  },
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password"
                  ),
                  onChanged: (val) {
                    password = val;
                  },
                ),
                SizedBox(height: 20.0),
                ButtonDefault(textButton: "Ingresar", voidCallback: () {
                  userBloc.signIn(email, password).then((val) async {
                    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                    print("RESPONSE!: ${val.data['accessToken']}");
                    sharedPreferences.setString("accessToken", val.data['accessToken']);
                      sharedPreferences.setBool("isLogin", true);
                      token = val.data['accessToken'];
                      Fluttertoast.showToast(
                          msg: "Autenticado",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Color.fromRGBO(104, 109, 224, 1),
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MainPage()), (Route<dynamic> route) => false);
                  });
                })
              ],
            ),
          )
        ],
      )
    );
  }

}

