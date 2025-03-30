import 'package:flutter/material.dart';
import 'package:flutter_portfolio/pages/home_page.dart';

void main(){
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Portfolio - Szymon Adamkiewicz',
      home: const HomePage(),
    );
  }
}