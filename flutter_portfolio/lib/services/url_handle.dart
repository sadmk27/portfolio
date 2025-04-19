import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlHandle {
  static Future<void> launchUrlWithFallback({
    required BuildContext context,
    required String url,
    required String fallbackMessage,
  }) async {
    if (url.isEmpty) {
      showAlert(context, fallbackMessage);
      return;
    }

    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      showAlert(context, fallbackMessage);
    }
  }

  static void showAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Alert'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }
}
