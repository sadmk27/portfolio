import 'package:flutter/material.dart';
import 'pages_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentRoute: '/home',
      child: const Center(
        child: Text(
          'Welcome to HomePage!',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
