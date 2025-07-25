import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;


  const BottomNavItem({required this.icon, required this.label, required this.isSelected, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final selected = Color(0xFF4E61F6);
    final unSelected = Color(0xff757575);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(isSelected ? selected : unSelected, BlendMode.srcATop),
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? selected : unSelected,
            ),
          ),
        ],
      ),
    );
  }
}