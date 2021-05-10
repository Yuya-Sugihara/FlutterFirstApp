import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

//  �G���g���|�C���g�̒�`
void main() => runApp(MyApp());

//  StatelessWidget...�ɂȂ��Ԃ������Ȃ��E�B�W�F�b�g

class MyApp extends StatelessWidget {
  //  build() ��widget��UI���쐬
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();

    return MaterialApp(
      title: "welcome to flutter",
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  //  _����n�܂�ϐ���private�ϐ�
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    //    Scaffold...�E�B�W�F�b�g�c���[��������
    return Scaffold(
      appBar: AppBar(
        title: Text("startup word generator"),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length)
          _suggestions.addAll(generateWordPairs().take(10));

        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(title: Text(pair.asPascalCase, style: _biggerFont));
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
