import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackernews_app/src/article.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Article> _articles = articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
          onRefresh: () async {
            return Future.delayed(const Duration(seconds: 2));
          },
          child: ListView(children: _articles.map(_buildItem).toList())),
    );
  }

  Widget _buildItem(Article article) {
    return Padding(
      key: Key(article.url),
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          article.title,
          style: TextStyle(fontSize: 20.0),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(article.url),
        ),
        onTap: () async {
          if (await canLaunch(article.url)) {
            await launch(article.url);
          }
        },
      ),
    );
  }
}
