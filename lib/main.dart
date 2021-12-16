import 'package:flutter/material.dart';
import 'package:unreal_porfolio_app/pages/favourites.dart';
import 'package:unreal_porfolio_app/pages/home.dart';
import 'package:unreal_porfolio_app/pages/notes.dart';
import 'package:unreal_porfolio_app/pages/portfolio.dart';

void main() {
  runApp(const Main());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text(
              'gutovskiy.ru',
            ),
            bottom: const TabBar(
                tabs: [
                  Tab( icon: Icon(Icons.home_outlined) ),
                  Tab( icon: Icon(Icons.note_add_outlined) ),
                  Tab( icon: Icon(Icons.work_outline) ),
                  Tab( icon: Icon(Icons.favorite_border_outlined),)
                ]
            ),
          ),
          body: const TabBarView(
              children: [
                HomeScreen(),
                NotesScreen(),
                PortfolioScreen(),
                FavouritesScreen(),
              ]
          ),
        )
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App()
    );
  }
}

