import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/card.dart';
import 'pages_layout.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    if (isMobile) {
      return MainLayout(
        currentRoute: '/projects',
        child: Column(
          children: List.generate(3, (index) {
            return Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppCard(
                  imageUrl: 'https://via.placeholder.com/150',
                  textContent: 'Karta ${index + 1}',
                ),
              ),
            );
          }),
        ),
      );
    } else {
      return MainLayout(
        currentRoute: '/projects',
          child: GridView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            return AppCard(
              imageUrl: 'https://via.placeholder.com/150',
              textContent: 'Karta ${index + 1}',
            );
          },
        ),
      );
    }
  }
}
