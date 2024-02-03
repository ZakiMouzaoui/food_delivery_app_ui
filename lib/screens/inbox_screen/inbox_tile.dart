import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/controllers/inbox_controller.dart';
import 'package:food_delivery_app_ui/models/inbox_model.dart';
import 'package:food_delivery_app_ui/utils/show_dialog.dart';
import 'package:get/get.dart';
import '../../utils/format_date.dart';


class InboxTile extends StatelessWidget {
  InboxTile({super.key, required this.message, required this.isFavorite, required this.isRead});

  final InboxModel message;
  final bool isFavorite;
  final bool isRead;

  final ctr = Get.find<InboxController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showDetailsDialog(context, message);
        ctr.markAsRead(message.id);
        },
      onLongPress: (){showDeleteDialog(context, message, secondDialog: false);},
      child: Container(
            color:  isRead ? Colors.transparent : AppColors.textFieldColor,
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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

                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth:  MediaQuery.of(context).size.width/2),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(message.object, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: isRead ? FontWeight.w600 : FontWeight.w700, color: AppColors.primaryTextColor)),
                            Text(message.content, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.grey,
                                fontWeight: isRead ? FontWeight.w500 : FontWeight.bold),),
                          ],
                        ),
                    ),


                  ],
                ),

                Container(
                  margin: const EdgeInsets.only(right:10),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(formatDateWithSuffix(message.date), style: TextStyle(color: Colors.grey,
                          fontWeight: message.isRead ? FontWeight.w500 : FontWeight.bold, fontSize: 11.sp),),
                        ),
                       Flexible(child: Icon(isFavorite ? Icons.star : Icons.star_border_outlined, color: AppColors.primaryColor,))
                      ],
                  ),
                )
              ],
            ),
          ),
    );
  }
}

