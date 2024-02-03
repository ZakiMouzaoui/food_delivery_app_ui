import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/utils/theme.dart';


class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTheme.textTheme.displayMedium,),
        TextButton(onPressed: (){}, child: const Text("View all", style: TextStyle(
          color: AppColors.primaryColor
        ),))
      ],
    );
  }
}
