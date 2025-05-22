import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String date;
  final String description;
  const InfoCard({
    super.key,
    required this.title,
    required this.date,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(date, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              const SizedBox(height: 8),
              Text(description, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}