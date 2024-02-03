import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/models/food_item_model.dart';


class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({super.key, required this.item});

  final FoodItemModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${item.name} x ${item.qty}", style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryTextColor
          ),),
          Text("${item.price} DA", style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.primaryTextColor
          ),)
        ],
    );
  }
}
