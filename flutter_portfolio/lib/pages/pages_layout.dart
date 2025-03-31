import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/footer.dart';
import 'package:flutter_portfolio/components/navbar.dart';
import 'package:flutter_portfolio/constants/colors.dart';

class MainLayout extends StatelessWidget {
  final String currentRoute;
  final Widget child;

  const MainLayout({
    super.key,
    required this.currentRoute,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: NavBar(currentRoute: currentRoute),
      drawer: isMobile ? _buildDrawer(context) : null,
      body: Column(
        children: [
          Expanded(child: child),
          const Footer(),
        ],
      ),
      backgroundColor: AppColors.background,
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.textFieldColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text(
              'MyApp Menu',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          _drawerItem(context, 'Home', '/home'),
          _drawerItem(context, 'Projects', '/projects'),
          _drawerItem(context, 'About', '/about'),
          _drawerItem(context, 'Contact', '/contact'),
        ],
      ),
    );
  }

  ListTile _drawerItem(BuildContext context, String label, String route) {
    final isActive = currentRoute == route;

    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          color: isActive ? AppColors.primary : Colors.white,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // zamknij drawer
        if (!isActive) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
    );
  }
}
