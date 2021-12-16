import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:unreal_porfolio_app/classes/note.dart';
import 'package:unreal_porfolio_app/components/notes/list.dart';


class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  Future<List<Note>> getNotes() async {

    List<Note> notes = [];
    List<Note> notesFav = [];

    var response = await http.get(Uri.parse('https://gutovskiy.ru/api/notes'));
    Map<String, dynamic> data = jsonDecode(response.body);


    var rawNotes = data['data']['notes'];
    for(var note in rawNotes) {
      notes.add(Note.fromJSON(note));
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> fav = prefs.getStringList('favourites') ?? [];

    for(var note in notes) {
      if (fav.contains(note.id.toString())) {notesFav.add(note);}
    }

    return notesFav;
  }

  get future => null;


  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
            children: [
              const Text(
                'Избранное'
              ),
              const Padding(padding: EdgeInsets.all(15)),
              FutureBuilder<List<Note>>(
                  future: getNotes(),
                  builder: (context, snaphot) => snaphot.hasData ? NoteList(notes: snaphot.requireData) : const Text(
                    'Загрузка'
                  )
              )
            ],
        ),
    );
  }
}

