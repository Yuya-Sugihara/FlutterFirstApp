import 'package:flutter/material.dart';

class PopularArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('人気の投稿'),
        ),
      ),
    );
  }
}
