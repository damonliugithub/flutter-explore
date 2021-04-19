import 'dart:ffi';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:flutter_explore/dart_playground/words/saved.dart';

class EnglishWordsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EnglishWordsWidget();
  }
}

class EnglishWordsWidget extends StatefulWidget {
  @override
  _EnglishWordsWidget createState() => _EnglishWordsWidget();
}

class _EnglishWordsWidget extends State<EnglishWordsWidget> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suggestions"),
        actions: [IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute<Saved>(builder: (BuildContext context) {
      return Saved(_saved);
    })).then((value) {
      setState(() {});
    });
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        itemCount: 2 * 50,
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return Divider();
          }
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          developer.log('${i}', name: "english_words.dart - itemBuilder");
          return _buildItem(_suggestions[index], index);
        });
  }

  Widget _buildItem(WordPair wordPair, int index) {
    var alreadySaved = _saved.contains(wordPair);
    return ListTile(
      title: Text(
        '${wordPair.asPascalCase} ${index}',
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }
}
