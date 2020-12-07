import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ingenieria_flutter/services/news_service.dart';
import 'package:ingenieria_flutter/widgets/card_comentary.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<DetailPage> {
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
    final newsService = Provider.of<NewsService>(context);
    final data = newsService.news;
    // print('data 2: ${data}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(39, 174, 96, 1),
        title: Text(data["title"]),
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
          child: Column(children: <Widget>[
            NewsImage(),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[Description()],
              ),
            ),
          ]),
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: 50,
      //   padding: EdgeInsets.only(left: 10, right: 10),
      //   color: Color.fromRGBO(39, 174, 96, 1),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[
      //       IconButton(
      //         onPressed: () => {},
      //         icon: iconLike,
      //       ),
      //       IconButton(
      //         onPressed: () => Navigator.pushNamed(context, '/comentary'),
      //         icon: iconComentary,
      //       )
      //     ],
      //   ),
      // )
    );
  }
}

class NewsImage extends StatelessWidget {
  const NewsImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    final data = newsService.news;
    return Container(
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(data["image"]))),
    );
  }
}

class Description extends StatelessWidget {
  const Description({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    final data = newsService.news;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Center(
        child: Text(
          data["description"],
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
