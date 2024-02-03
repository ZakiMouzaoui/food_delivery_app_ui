import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_app_bar.dart';
import 'package:food_delivery_app_ui/routes/routes.dart';
import 'package:food_delivery_app_ui/screens/more_screen/list_tile_widget.dart';
import 'package:get/get.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          CustomAppBar(title: "More"),
          SizedBox(
            height: 40.h,
          ),
          ListTileWidget(
              title: "Payment Details",
              image: "assets/images/more_payment.png"),
          SizedBox(
            height: 20.h,
          ),
          ListTileWidget(
              title: "My Orders", image: "assets/images/more_my_order.png", onTap: (){
                Get.toNamed(AppRoutes.myOrders);
          },),
          SizedBox(
            height: 20.h,
          ),
          ListTileWidget(
            title: "Notifications",
            image: "assets/images/more_notification.png",
            count: 3,
            onTap: () {
              Get.toNamed(AppRoutes.notifications);
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          ListTileWidget(
            title: "Inbox",
            image: "assets/images/more_inbox.png",
            onTap: () {
              Get.toNamed(AppRoutes.inbox);
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          ListTileWidget(
              title: "About Us", image: "assets/images/more_info.png")
        ],
      ),
    );
  }
}
