import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffe1f2ff),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: CircleAvatar(
            backgroundImage: NetworkImage('https://gutovskiy.ru/images/avatar_compressed.jpg'),
            radius: 100,
        ),
          ),
          Text(
            'Гутовский Сережа',
            style: TextStyle(
              fontFamily: 'Raleway',
              letterSpacing: 1.5,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

