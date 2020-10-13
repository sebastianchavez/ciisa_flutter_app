import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ingenieria_flutter/widgets/button_default.dart';

showAlert(BuildContext context, String title, String subtitle) {
  if (Platform.isAndroid) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(subtitle),
              actions: <Widget>[
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Ok'),
                  elevation: 5,
                  textColor: Colors.blue,
                )
              ],
            ));
  } else {
    showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
                title: Text(title),
                content: Text(subtitle),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('Ok'),
                    isDefaultAction: true,
                    onPressed: () => Navigator.pop(context),
                  )
                ]));
  }
}
