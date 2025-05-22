import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';

class RoundedImage extends StatelessWidget {
  final String imgUrl;
  const RoundedImage({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imgUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset('lib/assets/placeholder.png', fit: BoxFit.cover);
          },
        ),
      ),
    );
  }
}

class AppColor {
}
