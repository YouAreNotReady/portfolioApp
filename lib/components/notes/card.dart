import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unreal_porfolio_app/classes/note.dart';

import 'modal.dart';

class NoteCard extends StatefulWidget {
  const NoteCard({Key? key, required this.note}) : super(key: key);
  final Note note;

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {

  bool isFavourite = false;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.7),
          isScrollControlled: true,
          context: context,
          builder: (context) => NoteModal(note: widget.note)
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blue[500]!,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        padding: const EdgeInsets.all(15),

        child: Text(
          widget.note.name,
        ),
      ),
    );
  }
}
