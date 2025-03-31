import 'package:flutter/material.dart';
import 'pages_layout.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentRoute: '/contact',
      child: const Center(
        child: Text(
          'ContactPage!',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
