import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common_widgets/bottom_nav_item.dart';
import '../../constants/colors.dart';
import '../../controllers/main_view_controller.dart';
import '../../utils/nav_items.dart';

class MainView extends StatelessWidget {
  MainView({super.key});

  final mainViewCtr = Get.put(MainViewController());

  @override
  Widget build(BuildContext context) {
    return DoubleBack(

      child: SafeArea(
            child: Obx(
              ()=> Scaffold(
                body: mainViewCtr.pages[mainViewCtr.currentIndex.value],
                floatingActionButton: SizedBox(
                  height: 60.h,
                  width: 60.w,
                  child: FloatingActionButton(
                    shape: const CircleBorder(),
                    backgroundColor: mainViewCtr.currentIndex.value == 2 ? AppColors.primaryColor : AppColors.placeholderColor,
                    onPressed: () {
                      mainViewCtr.changeIndex(2);
                    },
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 38.sp,
                    ),
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                bottomNavigationBar: BottomAppBar(
                  shape: const CircularNotchedRectangle(),
                  shadowColor: Colors.grey,
                  elevation: 100,
                  height: 80.h,
                  color: Colors.white,
                  notchMargin: 8,
                  surfaceTintColor: Colors.white,
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          navItems.length,
                          (index) => BottomNavItem(
                              onPressed: () => mainViewCtr.changeIndex(index < 2 ? index : index + 1),
                              icon: navItems[index]["icon"] as IconData,
                              title: navItems[index]["title"] as String,
                              isSelected: navItems[index]["index"] == mainViewCtr.currentIndex.value))),
                ),
              ),
            ),
      ),
    );
  }
}
