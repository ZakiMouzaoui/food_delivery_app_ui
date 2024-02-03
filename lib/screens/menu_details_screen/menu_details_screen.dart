import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_app_bar.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_text_field.dart';
import 'package:food_delivery_app_ui/models/food_category_model.dart';
import 'package:food_delivery_app_ui/screens/menu_details_screen/food_category_widget.dart';


class MenuDetailsScreen extends StatelessWidget {
  const MenuDetailsScreen({super.key, required this.menu});

  final FoodCategoryModel menu;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h), child: Column(
              children: [
                CustomAppBar(
                  title: menu.name,
                  hasReturnBtn: true,
                ),
                SizedBox(height: 20.h,),
                const CustomTextField(hint: "Search food", hasLabel: false,),
                SizedBox(height: 20.h,),

              ],
            )),
            ListView.separated(physics: const BouncingScrollPhysics(), shrinkWrap: true, itemBuilder: (_, index)=>FoodCategoryWidget(foodModel: menu.foods[index], category: menu.name,), separatorBuilder: (_, __)=>SizedBox(height: 10.h,), itemCount: menu.foods.length)
          ],
        ),
      ),
    );
  }
}
