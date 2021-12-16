import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unreal_porfolio_app/classes/note.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:unreal_porfolio_app/components/notes/list.dart';
import 'package:unreal_porfolio_app/pages/note_add.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  // static _NotesScreenState of(BuildContext context) => context.findAncestorStateOfType<_NotesScreenState>()!;

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  List<Note> notes = [];
  @override
  void initState() {
    super.initState();
    getNotes();
  }

  void update() => getNotes();

  void getNotes() async {
    setState(() {
      this.notes = [];
    });
    var response = await http.get(Uri.parse('https://gutovskiy.ru/api/notes'));
    Map<String, dynamic> data = jsonDecode(response.body);
    List<Note> notes = [];

    var rawNotes = data['data']['notes'];
    for(var el in rawNotes) {
      notes.add(Note.fromJSON(el));
    }

    setState(() {
      this.notes = notes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffe1f2ff),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15,15,15,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Заметки',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                  ),
                ),
                OutlinedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                  ),
                    child: const Text(
                        'Добавить',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NoteAddScreen(
                      callback: update,
                    ))),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Здесь собран полезный материал, о котором я узнавал в процессе работы и обучения.'
              ' Что-то является очевидной базой, но есть и записи о таких вещах, о которых узнаешь'
              ' и о которых помнишь только пока решаешь конкретную проблему. Чтобы не рыскать в интернете'
              ' лишний раз и создана эта страница. К заметкам прилагается краткое описание и ссылки на сторонние'
              ' ресурсы с актуальной информацией, где уже можно подробно изучить тему.',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),

            ),
          ),
         NoteList(
             notes: notes
         ),
        ],
      ),
    );
  }
}


