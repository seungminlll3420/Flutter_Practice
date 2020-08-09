import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedList extends StatefulWidget {
  final Set<WordPair> saved;
  SavedList(this.saved);
  @override
  _SavedListState createState() => _SavedListState();
}

class _SavedListState extends State<SavedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Saved'),
        ),
        body: _buildLsit());
  }

  Widget _buildLsit() {
    return ListView.builder(
        itemCount: widget.saved.length * 2,
        itemBuilder: (context, index) {
          if (index.isOdd) {
            return Divider();
          } else {
            var realIndex = index ~/ 2;
            return _buildRow(widget.saved.toList()[realIndex]);
          }
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
        onTap: () {
          setState(() {
            widget.saved.remove(pair);
          });
        },
        title: Text(
          pair.asPascalCase,
          textScaleFactor: 1.5,
        ));
  }
}
