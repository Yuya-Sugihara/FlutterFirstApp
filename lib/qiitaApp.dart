import 'package:flutter/material.dart';
import 'focusedArticlePage.dart';
import 'popularArticlePage.dart';
import 'allArticlePage.dart';

class TabInfo {
  String label;
  Widget widget;

  TabInfo(this.label, this.widget);
}

class QiitaApp extends StatelessWidget {
  final List<TabInfo> _tabs = [
    TabInfo("注目の投稿", FocusedArticlePage()),
    TabInfo("人気の投稿", PopularArticlePage()),
    TabInfo("全ての投稿", AllArticlePage())
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ホーム"),
          centerTitle: true,
          backgroundColor: Colors.green,
          bottom: PreferredSize(
            child: TabBar(
              isScrollable: true,
              tabs: _tabs.map((TabInfo info) {
                return Tab(text: info.label);
              }).toList(),
            ),
            preferredSize: Size.fromHeight(30.0),
          ),
        ),
        body: TabBarView(children: _tabs.map((info) => info.widget).toList()),
      ),
    );
  }
}
