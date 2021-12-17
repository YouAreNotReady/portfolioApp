import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'list.dart';
import 'package:unreal_porfolio_app/classes/note.dart';

class NoteModal extends StatefulWidget {
  const NoteModal({Key? key, required this.note}) : super(key: key);

  final Note note;
  

  @override
  State<NoteModal> createState() => _NoteModalState();
}

class _NoteModalState extends State<NoteModal> {

  bool isPressed = false;//это для иконки
 //реализовать
  // void load() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String> notes = prefs.getStringList('favourites') ?? [];
  //   if (notes.contains(widget.note.id.toString())) {
  //     setState(() {
  //       isPressed = !isPressed;
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffe1f2ff),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: AspectRatio(
              aspectRatio: 2/1,
              child: Image.network(
                  widget.note.imagePath != null ? 'https://gutovskiy.ru/'+widget.note.imagePath! : 'https://yt3.ggpht.com/oOuggkIDNLwK60lN_W-ZR5p8psudkgU3V7YmcFJj92MX77GzqvonsqwW2qvXfZaR_WlwQTup=s900-c-k-c0x00ffffff-no-rj',
                  fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                widget.note.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                widget.note.desc,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
                child: IconButton(
                  iconSize: 30,
                  icon: (isPressed) ? const Icon(Icons.star) : const Icon(Icons.star_border_outlined),
                  color:(isPressed) ? Colors.amber : const Color(0xff907397),
                  onPressed: () => null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
