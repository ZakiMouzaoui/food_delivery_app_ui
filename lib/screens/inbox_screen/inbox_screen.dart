import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_app_bar.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/controllers/inbox_controller.dart';
import 'package:food_delivery_app_ui/models/inbox_model.dart';
import 'package:food_delivery_app_ui/screens/inbox_screen/inbox_tile.dart';
import 'package:get/get.dart';

class InboxScreen extends StatelessWidget {
  InboxScreen({super.key});

  final ctr = Get.put(InboxController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: const CustomAppBar(
                  title: "Inbox",
                  hasReturnBtn: true,
                )),
            SizedBox(
              height: 40.h,
            ),
            Expanded(
              child: Obx(
                () => ListView.separated(
                    itemBuilder: (_, index) {
                      final InboxModel message = ctr.messages[index];
                      return Obx(
                        ()=> InboxTile(
                            isFavorite: ctr.favorites.contains(message.id),
                            message: message,
                            isRead: ctr.viewedMessages.contains(message.id)),
                      );
                    },
                    separatorBuilder: (_, __) => Container(
                          width: double.infinity,
                          height: 0.5,
                          color: AppColors.primaryTextColor.withOpacity(0.4),
                        ),
                    itemCount: ctr.messages.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
