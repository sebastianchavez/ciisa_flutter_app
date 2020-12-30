import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ingenieria_flutter/helpers/show_alert.dart';

/*****  Providers *****/
import 'package:ingenieria_flutter/providers/push_notification_provider.dart';
import 'package:ingenieria_flutter/services/news_service.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final _storage = new FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    final pushProvider = new PushNotificationsProvider();
    pushProvider.initNotifications();
    pushProvider.messages.listen((event) {
      print('EVENT ${event}');
      Toast.show('Nueva noticia', context, duration: 3, gravity: Toast.BOTTOM);
      // final dynamic obj = data;
      // if (obj['type'] == 'NEWS') {
      // }
      // final newsService = Provider.of<NewsService>(context, listen: true);
      // newsService.getFirstNews().then((value) {
      //   print('GET NOTICIAS OK');
      //   newsService.listNews = value.data;
      // });
    });
  }

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
    final newsService = Provider.of<NewsService>(context, listen: false);

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
        body: FutureBuilder(
          builder: (context, snapshot) {
            return Container(
                color: Color.fromRGBO(236, 240, 241, 1),
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Center(
                  child: newsService.listNews.length > 0
                      ? RefreshIndicator(
                          child: ListView.builder(
                              itemCount: newsService.listNews.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(children: [
                                  _News(
                                      title: newsService.listNews[index]
                                          ["title"],
                                      description: newsService.listNews[index]
                                          ["description"],
                                      image: newsService.listNews[index]
                                          ["image"],
                                      data: newsService.listNews[index]),
                                  SizedBox(height: 20)
                                ]);
                              }),
                          onRefresh: () async {
                            final resp = await newsService.getFirstNews();
                            setState(() {
                              newsService.listNews = resp.data;
                            });
                          },
                        )
                      : Text('No existen noticias'),
                ));
          },
        ),
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

class _NewsList extends StatelessWidget {
  const _NewsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final newsService = Provider.of<NewsService>(context, listen: false);

    // return newsService.listNews.length > 0
    //     ? RefreshIndicator(
    //         child: ListView.builder(
    //             itemCount: newsService.listNews.length,
    //             itemBuilder: (BuildContext context, int index) {
    //               return Column(children: [
    //                 _News(
    //                     title: newsService.listNews[index]["title"],
    //                     description: newsService.listNews[index]["description"],
    //                     image: newsService.listNews[index]["image"],
    //                     data: newsService.listNews[index]),
    //                 SizedBox(height: 20)
    //               ]);
    //             }),
    //         onRefresh: () async {
    //           final resp = await newsService.getFirstNews();
    //           newsService.listNews = resp.data;
    //         },
    //       )
    //     : Text('No existen noticias');
  }
}

class _News extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final data;

  const _News(
      {Key key,
      @required this.title,
      @required this.description,
      @required this.image,
      @required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return RaisedButton(
        onPressed: () {
          newsService.news = this.data;
          Navigator.pushNamed(context, '/detail');
        },
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 100,
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
                      fit: BoxFit.cover, image: NetworkImage(this.image))),
              child: Center(),
            )),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Column(
                  children: <Widget>[
                    Text(this.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Text(
                        this.description.length >= 40
                            ? this.description.substring(0, 40)
                            : this.description,
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}
