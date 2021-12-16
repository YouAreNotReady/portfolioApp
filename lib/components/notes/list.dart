import 'package:flutter/material.dart';
import 'package:unreal_porfolio_app/classes/note.dart';
import 'package:unreal_porfolio_app/components/notes/card.dart';

class NoteList extends StatelessWidget {
  const NoteList({Key? key, required this.notes}) : super(key: key);

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Wrap(
        spacing: 15,
        runSpacing: 15,
        children: notes.map((note) => NoteCard(note: note)).toList()
      ),
    );
  }
}
