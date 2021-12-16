import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unreal_porfolio_app/classes/project.dart';
import 'package:http/http.dart' as http;
import 'package:unreal_porfolio_app/components/projects/list.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  Future<List<Project>> getProjects() async {
    var response = await http.get(Uri.parse('https://gutovskiy.ru/api/portfolio'));
    Map<String, dynamic> data = jsonDecode(response.body);
    List<Project> projects = [];
    // log(data.toString());

    var rawProjects = data['data']['projects'];
    for(var el in rawProjects) {
      projects.add(Project.fromJSON(el));
    }

    return projects;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffe1f2ff),
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
                'Портфолио',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
                  "Здесь собраны мои главные коммерческие проекты, которые я выполнил "
                  "за время работы в terexov.agency и на фрилансе. Среди них: лендинги,"
                  " корпоративные сайты, e-commerce, сайты на wordpress'е, а также вишенка"
                  " на торте - meriyan.ru - проект с рукописным backend'ом на laravel и панелью администрирования на vue.",
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FutureBuilder<List<Project>>(
            future: getProjects(),
            builder: (context, snapshot) => snapshot.hasData ? ProjectList(projects: snapshot.requireData) : Container(),
          )
        ],
      ),
    );
  }
}
