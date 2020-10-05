import 'package:flutter/material.dart';

class CardComentary extends StatelessWidget {
  const CardComentary({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10),
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0, 5),
                blurRadius: 5)
          ]),
      child: Row(children: <Widget>[
        Container(
          margin: EdgeInsets.all(15),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/imgs/no_profile.jpg'))),
        ),
        Container(
          padding: EdgeInsets.only(top: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Nombre usuario',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text('Comentario', style: TextStyle(fontSize: 14))
            ],
          ),
        )
      ]),
    );
  }
}
