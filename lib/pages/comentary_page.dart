import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ingenieria_flutter/widgets/card_comentary.dart';

class ComentaryPage extends StatefulWidget {
  ComentaryPage({Key key}) : super(key: key);

  @override
  _ComentaryState createState() => _ComentaryState();
}

class _ComentaryState extends State<ComentaryPage> {
  final Widget svg = SvgPicture.asset(
    'assets/icons/back.svg',
    height: 40,
    width: 40,
    color: Colors.white,
  );
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
        body: SafeArea(
          child: Container(
            color: Color.fromRGBO(236, 240, 241, 1),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: <Widget>[
                Container(
                  height: 450,
                  child: Column(
                    children: <Widget>[
                      CardComentary(),
                      CardComentary(),
                      CardComentary(),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  child: InputSend(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputSend extends StatelessWidget {
  @override
  final TextEditingController textController = TextEditingController();
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(color: Color.fromRGBO(52, 73, 94, 1))),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Container(
                width: 200,
                padding: EdgeInsets.only(left: 10),
                child: TextField(
                  controller: this.textController,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintText: 'Comentar'),
                ),
              )),
          Expanded(
            child: RaisedButton(
              onPressed: () => {},
              color: Color.fromRGBO(52, 152, 219, 1),
              highlightElevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15))),
              padding: EdgeInsets.all(0),
              child: Container(
                height: 50,
                child: Center(
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
