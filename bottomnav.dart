import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyBottomNav extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;
  const MyBottomNav({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: <Widget>[
        _buildNavItem(Icons.home, "Home", context),
        _buildNavItem(Icons.menu_outlined, "Menu", context),
        _buildNavItem(Icons.download_done, "Downloads", context),
      ],
      backgroundColor: Colors.black,
      buttonBackgroundColor: Color(0xFFF0131E),
      color: Colors.white,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      index: currentIndex,
      onTap: onTap,
      height: 60,
    );
  }

  Widget _buildNavItem(IconData icon, String label, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 30),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 25, color: Colors.black)),
      ],
    );
  }
}
