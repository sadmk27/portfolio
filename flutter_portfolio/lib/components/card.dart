import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final String imageUrl;
  final String textContent;
  const AppCard({
    super.key,
    required this.imageUrl,
    required this.textContent
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              textContent,
              style: const TextStyle(fontSize: 16),
            ),
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Akcja 1')),
                ElevatedButton(onPressed: () {}, child: const Text('Akcja 2')),
                ElevatedButton(onPressed: () {}, child: const Text('Akcja 3')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}