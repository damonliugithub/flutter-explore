import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class Saved extends StatefulWidget {
  final Set<WordPair> saved;

  Saved(this.saved);

  @override
  _SavedState createState() => _SavedState(saved);
}

class _SavedState extends State<Saved> {
  final Set saved;
  final _biggerFont = TextStyle(fontSize: 18.0);

  _SavedState(this.saved);

  @override
  Widget build(BuildContext context) {
    return _buildSaved();
  }

  Widget _buildSaved() {
    final tiles = saved.map((e) {
      return ListTile(
        title: Text(
          e.asPascalCase,
          style: _biggerFont,
        ),
        onTap: () {
          setState(() {
            saved.remove(e);
          });
        },
      );
    });

    final divideTiles =
        ListTile.divideTiles(context: context, tiles: tiles).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text("Saved"),
        ),
        body: ListView(
          children: divideTiles,
        ));
  }
}
