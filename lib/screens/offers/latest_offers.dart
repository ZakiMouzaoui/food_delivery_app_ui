import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_app_bar.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_button.dart';
import 'package:food_delivery_app_ui/screens/offers/food_offer_widget.dart';
import 'package:food_delivery_app_ui/utils/desserts.dart';
import 'package:food_delivery_app_ui/utils/theme.dart';

class LatestOffers extends StatelessWidget {
  const LatestOffers({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CustomAppBar(
                title: "Latest Offers",
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                  width: size.width / 2,
                  child: Text(
                    "Find discounts, offers, special meals and more!",
                    style: AppTheme.textTheme.titleSmall,
                  )),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                onPressed: () {},
                title: "Check offers",
                width: size.width / 2,
                height: 40.h,
                fontSize: 13.sp,
              ),
              SizedBox(
                height: 20.h,
              ),

            ])),
        ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) =>
                FoodOfferWidget(model: desserts[index]),
            separatorBuilder: (_, __) => SizedBox(
              height: 25.h,
            ),
            itemCount: desserts.length),
        SizedBox(height: 20.h,)
      ],
    );
  }
}
