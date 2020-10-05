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

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
          child: SingleChildScrollView(
              child: Container(
        color: Color.fromRGBO(236, 240, 241, 1),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Center(
            child: Column(
          children: <Widget>[_TabsMenu(), _Banner(), _News(), _News()],
        )),
      ))),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(39, 174, 96, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: Colors.white,
              title: Text('Inicio')),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              backgroundColor: Colors.white,
              title: Text('Calendario')),
          BottomNavigationBarItem(
              icon: Icon(Icons.feedback),
              backgroundColor: Colors.white,
              title: Text('Noticias')),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
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
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                Text('Titulo de noticia',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Text('Descripcion de noticia',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
