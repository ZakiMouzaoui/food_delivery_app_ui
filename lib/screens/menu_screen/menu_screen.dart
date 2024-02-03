import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_app_bar.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_text_field.dart';
import 'package:food_delivery_app_ui/controllers/food_menu_controller.dart';
import 'package:food_delivery_app_ui/screens/menu_screen/food_menu_widget.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';


class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  final FoodMenuController ctr = Get.put(FoodMenuController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
       children: [
         Padding(padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h), child: const CustomAppBar(title: "Menu")),
         Padding(padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h), child: const CustomTextField(hint: "Search food", prefixIcon: Icons.search, hasLabel: false,)),
         SizedBox(height: 10.h,),
         Stack(
           alignment: Alignment.centerLeft,
           children: [
             Container(
               height: 480.h,
               width: 150.w,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.only(topRight: Radius.circular(40.r), bottomRight: Radius.circular(40.r)),
                 color: AppColors.primaryColor
               ),
             ),
             ListView.separated(
               shrinkWrap: true,
               physics: const ScrollPhysics(),
               itemBuilder: (_, index)=>FoodMenuWidget(category: ctr.menus[index]),
               itemCount: ctr.menus.length,
               separatorBuilder: (_, __)=>SizedBox(height: 20.h,),
             )
           ],
         ),
       ],
    );
  }
}
