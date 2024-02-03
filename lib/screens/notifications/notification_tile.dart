import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:timeago/timeago.dart' as timeago;


class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, required this.isRead, required this.content, required this.date});

  final bool isRead;
  final String content;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        color: isRead ? Colors.transparent : AppColors.textFieldColor,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 30,
              child: isRead ? const SizedBox.shrink() : Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor
                ),
                height: 10,
                width: 10,
              ),
            ),
            SizedBox(width: 30.w,),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(content, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: isRead ? FontWeight.w600 : FontWeight.w700, color: AppColors.primaryTextColor)),
                  Text(timeago.format(date), style: TextStyle(
                    color: Colors.grey,
                    fontWeight: isRead ? FontWeight.w500 : FontWeight.bold
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
