import 'package:flutter/material.dart';

class FocusedArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Stack'),
            ),
            body: Stack(
              children: <Widget>[
                Container(width: 100, height: 100, color: Colors.green),
                Container(
                  width: 50,
                  height: 80,
                  color: Colors.orange,
                )
              ],
            )));
  }
}
