import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.isSelected, required this.onPressed});

  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Column(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.primaryTextColor.withOpacity(0.7),
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.primaryTextColor.withOpacity(0.7),
              ),
            )
          ],
        ));
  }
}
