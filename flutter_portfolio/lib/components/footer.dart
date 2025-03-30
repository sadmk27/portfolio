import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart'; // Dodaj w pubspec.yaml

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      color: AppColors.textFieldColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            spacing: 20,
            children: [
              _socialIcon(FontAwesomeIcons.facebookF, 'https://facebook.com'),
              _socialIcon(FontAwesomeIcons.instagram, 'https://instagram.com'),
              _socialIcon(FontAwesomeIcons.linkedinIn, 'https://linkedin.com'),
              _socialIcon(FontAwesomeIcons.github, 'https://github.com'),
              _socialIcon(FontAwesomeIcons.solidEnvelope, 'mailto:example@gmail.com'),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            '© 2025 MyApp. All rights reserved.',
            style: TextStyle(color: AppColors.hintColor, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () async {
        if (await canLaunchUrlString(url)) {
          await launchUrlString(url);
        } else {
          debugPrint('Could not launch $url');
        }
      },
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}
