import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Widget svg = SvgPicture.asset(
    'assets/icons/config.svg',
    height: 40,
    width: 40,
    color: Colors.white,
  );

  final Widget homeIcon = SvgPicture.asset(
    'assets/icons/home.svg',
    height: 40,
    width: 40,
    color: Colors.white,
  );

  final Widget calendarIcon = SvgPicture.asset(
    'assets/icons/calendar.svg',
    height: 40,
    width: 40,
    color: Colors.white,
  );

  final Widget newsIcon = SvgPicture.asset(
    'assets/icons/bell.svg',
    height: 40,
    width: 40,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(39, 174, 96, 1),
          title: Text('Ciisa'),
          leading: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/imgs/no_profile.jpg'))),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: svg,
              onPressed: () {
                Navigator.pushNamed(context, '/config');
              },
            )
          ],
        ),
        body: SafeArea(
            child: Container(
          color: Color.fromRGBO(236, 240, 241, 1),
          padding: EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Center(
              child: Column(
            children: <Widget>[_Banner(), _News(), _News()],
          )),
        )),
        bottomSheet: Container(
            height: 55,
            color: Color.fromRGBO(39, 174, 96, 1),
            child: Row(children: <Widget>[
              Expanded(
                  child: IconButton(
                onPressed: () => {},
                icon: homeIcon,
              )),
              Expanded(
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/calendar');
                    },
                    icon: calendarIcon),
              ),
              Expanded(child: IconButton(onPressed: () => {}, icon: newsIcon))
            ])));
  }
}

class _TabsMenu extends StatelessWidget {
  const _TabsMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10))),
          onPressed: () {},
          child: Container(
            width: 130,
            margin: EdgeInsets.only(right: 0),
            child: Center(
              child: Text('Noticias'),
            ),
          ),
        ),
        RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10))),
          onPressed: () {},
          child: Container(
            width: 130,
            margin: EdgeInsets.only(left: 0),
            child: Center(
              child: Text('Eventos'),
            ),
          ),
        )
      ],
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/detail');
      },
      padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topLeft: Radius.circular(10))),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/imgs/banner.jpg')),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            'Noticias destacadas',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class _News extends StatelessWidget {
  const _News({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: Color.fromRGBO(22, 160, 133, 1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0, 5),
                blurRadius: 5)
          ]),
      child: Row(children: <Widget>[
        Expanded(
            child: Container(
          height: 80,
          width: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/imgs/banner.jpg'))),
          child: Center(),
        )),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                Text('Titulo de noticia',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text('Descripcion de noticia',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
          ),
        )
      ]),
    );
  }
}