import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/infoCard.dart';
import 'package:flutter_portfolio/components/roundedImage.dart';
import 'package:flutter_portfolio/constants/about-info.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/constants/image-list.dart';
import 'pages_layout.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentRoute: '/about',
      maxWidth: 1200,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: const [
                      Text(
                        "Hi, my name is Szymon Adamkiewicz",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "I'm a passionate developer focused on building clean, performant, and user-friendly applications.",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Technologies I use:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 2;
                if (constraints.maxWidth > 1600) crossAxisCount = 4;
                else if (constraints.maxWidth > 1200) crossAxisCount = 3;
                else if (constraints.maxWidth > 800) crossAxisCount = 2;

                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GridView.count(
                    crossAxisCount: crossAxisCount,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1,
                    children: imageList.map((image) {
                      return RoundedImage(imgUrl: image["imageUrl"] ?? "");
                    }).toList(),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            _buildSectionTitle("Experience"),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: experienceList.map((exp) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: InfoCard(
                      title: exp["title"] ?? "",
                      date: exp["date"] ?? "",
                      description: exp["description"] ?? "",
                    ),
                  );
                }).toList(),
              ),
            ),

            _buildSectionTitle("Education"),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: educationList.map((edu) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: InfoCard(
                      title: edu["title"] ?? "",
                      date: edu["date"] ?? "",
                      description: edu["description"] ?? "",
                    ),
                  );
                }).toList(),
              ),
            ),
            _buildSectionTitle("Certifications"),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: certificateList.map((crt) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: InfoCard(
                      title: crt["title"] ?? "",
                      date: crt["date"] ?? "",
                      description: crt["description"] ?? "",
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}
