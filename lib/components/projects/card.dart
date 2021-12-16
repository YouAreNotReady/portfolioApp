import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unreal_porfolio_app/classes/project.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({Key? key, required this.project}) : super(key: key);
  final Project project;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                  aspectRatio: 2/1,
                  child: Image.network(
                    'https://c.tenor.com/wcTAJ_FqG0oAAAAd/%D0%BF%D0%B0%D0%BF%D0%B8%D1%87.gif',
                    fit: BoxFit.cover,
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(project.name),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                child: Text(
                    project.link,
                    style: const TextStyle(
                        decoration: TextDecoration.underline, color: Colors.blue
                    ),
                ),
                onTap: () => launch('https://'+project.link),
              ),
            ),
            Text(project.description),
          ],
        ),
      ),
    );
  }
}
