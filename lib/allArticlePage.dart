import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart';

class AllArticlePage extends StatefulWidget {
  @override
  AllArticlePageState createState() => AllArticlePageState();
}

class AllArticlePageState extends State<AllArticlePage> {
  final String _rssUrl = "https://qiita.com/tags/flutter/feed";

  List<Widget> _articles = [];

  AllArticlePageState() {
    _addArticle();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        //  if (index >= _articles.length) _addArticle();

        //  return _createListItem(_articles[index]);
        //}
        body: Center(
          child: ListView(
            children: _articles,
          ),
        ),
      ),
    );
  }

  void _addArticle() async {
    List<Widget> list = [];

    //  URLからリクエスト結果を取得する
    Response res = await get(_rssUrl);

    //  RSSフィード抽出
    var feed = AtomFeed.parse(res.body);

    print("フィードの要素数: ${feed.items.length}");
    //  RSSフィードの情報から各記事に関するWidgetを作成
    for (var item in feed.items) {
      list.add(
        ListTile(
            title: Text(item.title),
            subtitle: Text(item.published),
            onTap: () {
              //Navigator.push(context, MaterialPageRoute(
              //    builder: (_) =>
              //    ItemDetailPage(
              //        item: item,
              //    ),
              //),)
            }),
      );
    }

    setState(() {
      _articles = list;
    });
  }

  Widget _createListItem(String title) {
    return Container(
      decoration: BoxDecoration(
        border: new Border(
          bottom: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 18.0),
        ),
        onTap: () => print("onTap called."),
        onLongPress: () => print("onLongPress called."),
      ),
    );
  }
}
