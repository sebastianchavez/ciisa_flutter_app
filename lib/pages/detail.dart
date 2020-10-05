import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ingenieria_flutter/widgets/card_comentary.dart';

class Detail extends StatefulWidget {
  Detail({Key key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final Widget svg = SvgPicture.asset(
    'assets/icons/back.svg',
    height: 40,
    width: 40,
    color: Colors.white,
  );

  final Widget iconLike = SvgPicture.asset('assets/icons/like.svg',
      height: 40, width: 40, color: Colors.white);

  final Widget iconComentary = SvgPicture.asset(
    'assets/icons/comentary.svg',
    height: 40,
    width: 40,
    color: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(39, 174, 96, 1),
          title: Text('Nombre de noticia'),
          leading: IconButton(
            padding: EdgeInsets.all(15),
            icon: svg,
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              color: Color.fromRGBO(236, 240, 241, 1),
              child: Column(children: <Widget>[
                NewsImage(),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[Description(), CardComentary()],
                  ),
                ),
              ]),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          padding: EdgeInsets.only(left: 10, right: 10),
          color: Color.fromRGBO(39, 174, 96, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () => {},
                icon: iconLike,
              ),
              IconButton(
                onPressed: () => Navigator.pushNamed(context, '/comentary'),
                icon: iconComentary,
              )
            ],
          ),
        ));
  }
}

class NewsImage extends StatelessWidget {
  const NewsImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(image: AssetImage('assets/imgs/banner.jpg')),
    );
  }
}

class Description extends StatelessWidget {
  const Description({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Center(
        child: Text(
          'Detalle',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
