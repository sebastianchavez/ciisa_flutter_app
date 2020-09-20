import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:ingenieria_flutter/User/repository/user_api.dart';

class UserBloc implements Bloc {

  signIn(email, password) => UserApi().signIn(email, password);

  @override
  void dispose() {
    // TODO: implement dispose
  }

}