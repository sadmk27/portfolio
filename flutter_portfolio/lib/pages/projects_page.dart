import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/card.dart';
import 'package:flutter_portfolio/constants/projects.dart';
import 'pages_layout.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Projekty')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = 1;

          if (constraints.maxWidth > 1200) {
            crossAxisCount = 4;
          } else if (constraints.maxWidth > 800) {
            crossAxisCount = 3;
          } else if (constraints.maxWidth > 500) {
            crossAxisCount = 2;
          }

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.count(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
              children: projectList.map((project) {
                return AppCard(
                  imageUrl: project["imageUrl"]!,
                  textContent: project["textContent"]!,
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
