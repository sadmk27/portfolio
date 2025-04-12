import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                height: 180,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'lib/assets/placeholder.png',
                    height: 180,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),

            const SizedBox(height: 12),
            Text(
              textContent,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(FontAwesomeIcons.github, size: 20, color: Colors.white),
                      SizedBox(width: 8),
                      Text("Repository",style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(FontAwesomeIcons.googlePlay, size: 20, color: Colors.white,),
                      SizedBox(width: 8),
                      Text("Download",style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}