import 'package:flutter/material.dart';
import 'pages_layout.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentRoute: '/projects',
      child: const Center(
        child: Text(
          'ProjectPage!',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
