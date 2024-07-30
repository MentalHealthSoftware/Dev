import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipBehavior: Clip.hardEdge, // Ensure no border is visible
      child: Container(
        height: 70, // Slightly decrease the height
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [], // Remove shadow
        ),
        child: BottomNavigationBar(
          items: [
            _buildNavItem('assets/icon.svg', 'Consult', currentIndex == 0),
            _buildNavItem('assets/icon (1).svg', 'Chats', currentIndex == 1),
            _buildNavItem('assets/icon (2).svg', 'Tasks', currentIndex == 2),
            _buildNavItem(
                'assets/icon (3).svg', 'Subscriptions', currentIndex == 3),
          ],
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF003F5A),
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      String svgPath, String label, bool isActive) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                bottom: 5.0), // Decrease space between icon and text
            child: SvgPicture.asset(
              svgPath,
              color: isActive
                  ? Color(0xFF003F5A)
                  : Colors.grey, // Active and inactive colors
              height: 24, // You can adjust the size if needed
            ),
          ),
        ],
      ),
      label: label,
      backgroundColor: Colors.white,
    );
  }
}
