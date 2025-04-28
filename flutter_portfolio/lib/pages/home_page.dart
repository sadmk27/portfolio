import 'package:flutter/material.dart';
import 'pages_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentRoute: '/home',
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/banner.png'),
            fit: BoxFit.cover,
          ),
      )
    ),
    );
  }
}
