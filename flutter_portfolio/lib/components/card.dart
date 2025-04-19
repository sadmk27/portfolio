import 'package:flutter/material.dart';
import 'package:flutter_portfolio/services/url_handle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppCard extends StatelessWidget {
  final String projectTitle;
  final String imageUrl;
  final String textContent;
  final String github;
  final String googlePlay;

  const AppCard({
    super.key,
    required this.projectTitle,
    required this.imageUrl,
    required this.textContent,
    required this.github,
    required this.googlePlay,
  });

  void _showFullContent(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(projectTitle),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                errorBuilder: (context, error, stackTrace) => Image.asset('lib/assets/placeholder.png'),
              ),
              const SizedBox(height: 12),
              Text(
                textContent,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      UrlHandle.launchUrlWithFallback(
                        context: context,
                        url: github,
                        fallbackMessage: 'Repository does not exist or it is private',
                      );
                    },
                    icon: const Icon(FontAwesomeIcons.github, size: 18),
                    label: const Text("Repository"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      UrlHandle.launchUrlWithFallback(
                        context: context,
                        url: googlePlay,
                        fallbackMessage: 'App is not available to download',
                      );
                    },
                    icon: const Icon(FontAwesomeIcons.googlePlay, size: 18),
                    label: const Text("Download"),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Zamknij"),
          )
        ],
      ),
    );
  }

  @override
Widget build(BuildContext context) {
  const double maxContentHeight = 100;

  return InkWell(
    onTap: () => _showFullContent(context),
    borderRadius: BorderRadius.circular(12),
    child: Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                height: 100, 
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'lib/assets/placeholder.png',
                    height: 100,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Text(
              projectTitle,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Flexible(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final textSpan = TextSpan(
                    text: textContent,
                    style: const TextStyle(fontSize: 14),
                  );
                  final tp = TextPainter(
                    text: textSpan,
                    textDirection: TextDirection.ltr,
                    maxLines: null,
                  )..layout(maxWidth: constraints.maxWidth);

                  final needsEllipsis = tp.size.height > maxContentHeight;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: needsEllipsis ? maxContentHeight/1.1 : null,
                        child: Text(
                          textContent,
                          overflow: needsEllipsis ? TextOverflow.ellipsis : null,
                          maxLines: needsEllipsis ? 4 : null,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      if (needsEllipsis)
                        TextButton(
                          onPressed: () => _showFullContent(context),
                          child: const Text("Zobacz więcej"),
                        ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      UrlHandle.launchUrlWithFallback(
                        context: context,
                        url: github,
                        fallbackMessage: 'Repository does not exist or it is private',
                      );
                    },
                    icon: const Icon(FontAwesomeIcons.github, size: 16),
                    label: const Text("Repo", overflow: TextOverflow.ellipsis),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      UrlHandle.launchUrlWithFallback(
                        context: context,
                        url: googlePlay,
                        fallbackMessage: 'App is not available to download',
                      );
                    },
                    icon: const Icon(FontAwesomeIcons.googlePlay, size: 16),
                    label: const Text("Download", overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
}
