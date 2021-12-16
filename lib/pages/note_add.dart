import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'notes.dart';

class NoteAddScreen extends StatefulWidget {
  const NoteAddScreen({Key? key, required this.callback }) : super(key: key);

  final Function callback;

  @override
  _NoteAddScreenState createState() => _NoteAddScreenState();
}

class _NoteAddScreenState extends State<NoteAddScreen> {

  String name = '';
  String desc = '';


  void storeNote(String name, String desc) async {
    await http.post(
      Uri.parse('https://gutovskiy.ru/api/notes'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'description': desc
      }),
    );

    widget.callback();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe1f2ff),
      appBar: AppBar(
        title: const Text('Добавить заметку'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              onChanged: (text) => setState(() {
                name = text;
              }),
              decoration: const InputDecoration(
                  hintText: 'Название заметки'
              ),
            ),
            TextField(
              onChanged: (text) => setState(() {
                desc = text;
              }),
              decoration: const InputDecoration(
                  hintText: 'Описание заметки'
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CupertinoButton(
                  color: Colors.white,
                  child: const Text(
                    'Добавить',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  onPressed: () => storeNote(name, desc),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
