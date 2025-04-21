import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final String currentRoute;
  const NavBar({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final currentPage = currentRoute[1].toUpperCase()+currentRoute.substring(2,currentRoute.length);
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 4,
      shadowColor: AppColors.shadowLight,
      title: Text(
        currentPage,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: isMobile ? null : _buildNavItems(context),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  List<Widget> _buildNavItems(BuildContext context) {
    return [
      _navItem(context, 'Home', '/home'),
      _navItem(context, 'Projects', '/projects'),
      _navItem(context, 'About', '/about'),
      _navItem(context, 'Contact', '/contact'),
    ];
  }

  Widget _navItem(BuildContext context, String label, String route) {
    final isActive = currentRoute == route;
    return TextButton(
      onPressed: () {
        if (!isActive) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isActive ? AppColors.primary : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 2,
            width: isActive ? 20 : 0,
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(1),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
