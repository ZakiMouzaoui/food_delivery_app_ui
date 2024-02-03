import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_app_bar.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/screens/notifications/notification_tile.dart';
import 'package:food_delivery_app_ui/utils/notifications.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: const CustomAppBar(title: "Notifications", hasReturnBtn: true,)),
            SizedBox(
              height: 40.h,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (_, index) => NotificationTile(
                      isRead: notifications[index].isRead,
                      content: notifications[index].content,
                      date: notifications[index].date),
                  separatorBuilder: (_, __) => Container(
                        width: double.infinity,
                        height: 0.5,
                        color: AppColors.primaryTextColor.withOpacity(0.4),
                      ),
                  itemCount: notifications.length),
            ),
          ],
        ),
      ),
    );
  }
}
