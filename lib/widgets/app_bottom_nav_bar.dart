import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../screens/home_screen.dart';
import '../screens/wishlist_screen.dart';

class AppBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  const AppBottomNavBar({super.key, required this.selectedIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == selectedIndex) return;
    if (index == 0) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const HomePage()),
        (route) => false,
      );
    } else if (index == 2) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const WishlistScreen()),
        (route) => false,
      );
    }
    // Add more navigation if needed
  }

  @override
  Widget build(BuildContext context) {
    final navItems = [
      {'icon': Icons.home_filled, 'isSelected': selectedIndex == 0},
      {'icon': Icons.shopping_bag_outlined, 'isSelected': selectedIndex == 1},
      {'icon': Icons.favorite, 'isSelected': selectedIndex == 2},
      {'icon': Icons.chat_bubble_outline, 'isSelected': selectedIndex == 3},
      {'icon': Icons.person_outline, 'isSelected': selectedIndex == 4},
    ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(32),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(navItems.length, (index) {
          final item = navItems[index];
          return GestureDetector(
            onTap: () => _onItemTapped(context, index),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color:
                    item['isSelected'] as bool
                        ? Colors.white
                        : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                item['icon'] as IconData,
                color:
                    item['isSelected'] as bool ? AppColors.text : Colors.grey,
                size: 24,
              ),
            ),
          );
        }),
      ),
    );
  }
}
