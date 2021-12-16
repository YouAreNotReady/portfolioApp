import 'package:flutter/material.dart';
import 'package:unreal_porfolio_app/classes/project.dart';
import 'card.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({Key? key, required this.projects}) : super(key: key);

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15,15,15,15),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: projects.map((project) => ProjectCard(project: project)).toList()
      ),
    );
  }
}
