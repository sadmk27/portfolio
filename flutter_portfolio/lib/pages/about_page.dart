import 'package:flutter/material.dart';
import 'pages_layout.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentRoute: '/about',
      child: const Center(
        child: Text(
          'AboutPage!',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
