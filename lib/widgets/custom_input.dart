import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;
  final Function onChange;
  final FocusNode focusNode;
  final Function onFocusChange;

  const CustomInput(
      {Key key,
      @required this.icon,
      @required this.placeholder,
      @required this.textController,
      @required this.onChange,
      this.keyboardType = TextInputType.text,
      this.isPassword = false,
      this.focusNode,
      this.onFocusChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(0, 5),
                  blurRadius: 5)
            ]),
        child: Focus(
            onFocusChange: this.onFocusChange,
            child: TextField(
              focusNode: this.focusNode,
              onChanged: this.onChange,
              controller: this.textController,
              autocorrect: false,
              keyboardType: this.keyboardType,
              obscureText: this.isPassword,
              decoration: InputDecoration(
                  prefixIcon: Icon(this.icon),
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintText: this.placeholder),
            )));
  }
}
