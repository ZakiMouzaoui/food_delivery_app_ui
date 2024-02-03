import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_app_bar.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_text_field.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/screens/home/food_category_card.dart';
import 'package:food_delivery_app_ui/screens/home/popular_food.dart';
import 'package:food_delivery_app_ui/screens/home/popular_restaurent_widget.dart';
import 'package:food_delivery_app_ui/screens/home/recent_foods.dart';
import 'package:food_delivery_app_ui/screens/home/section_title.dart';
import 'package:food_delivery_app_ui/utils/popular_foods.dart';
import 'package:food_delivery_app_ui/utils/recent_items.dart';
import 'package:food_delivery_app_ui/utils/restaurants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final categories = [
    {"image": "assets/images/coucous.png", "title": "Couscous"},
    {"image": "assets/images/tajin.jpg", "title": "Tajin"},
    {"image": "assets/images/mhajeb.jpg", "title": "Mhajeb"},
    {"image": "assets/images/kesra.jpg", "title": "Kesra"},
    {"image": "assets/images/dolma.jpg", "title": "Dolma"},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            // APP BAR
            const CustomAppBar(
              title: "Good morning Zaki!",
            ),
            SizedBox(
              height: 21.h,
            ),
            // LOCATION
            Text(
              "delivering to",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.placeholderColor),
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: [
                const Text(
                  "Current Location",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryTextColor),
                ),
                SizedBox(
                  width: 10.w,
                ),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),

            // SEARCH BAR
            const CustomTextField(
              hint: "Search food",
              prefixIcon: Icons.search,
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 130.h,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => FoodCategoryCard(
                    image: categories[index]["image"]!,
                    title: categories[index]["title"]!),
                separatorBuilder: (_, __) => SizedBox(
                  width: 15.w,
                ),
              ),
            ),

            // FOOD CATEGORIES
            SizedBox(
              height: 40.h,
            ),

            // POPULAR RESTAURANTS
            const SectionTitle(title: "Popular Restaurants"),
            SizedBox(
              height: 10.h,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: restaurants.length,
              itemBuilder: (_, index) => PopularRestaurantWidget(
                  image: restaurants[index].image,
                  title: restaurants[index].title,
                  rating: restaurants[index].rating,
                  totalRatings: restaurants[index].totalRatings),
              separatorBuilder: (_, __) => SizedBox(
                height: 20.h,
              ),
            ),

            SizedBox(
              height: 20.h,
            ),

            // MOST POPULAR
            const SectionTitle(title: "Most Popular"),
            SizedBox(
              height: 10.h,
            ),

            SizedBox(
              height: 190.h,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: popularFoods.length,
                itemBuilder: (_, index) => PopularFood(
                  image: popularFoods[index].image,
                  title: popularFoods[index].title,
                  rating: popularFoods[index].rating,
                  isLiked: popularFoods[index].isLiked,
                ),
                separatorBuilder: (_, __) => SizedBox(
                  width: 20.w,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const SectionTitle(title: "Recent Items"),
            SizedBox(
              height: 10.h,
            ),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, index) => RecentFoods(
                      image: recentItems[index].image,
                      title: recentItems[index].title,
                      category: recentItems[index].category,
                      rating: recentItems[index].rating,
                    ),
                separatorBuilder: (_, __) => SizedBox(
                      height: 15.h,
                    ),
                itemCount: recentItems.length)
          ],
        ),
      );
  }
}
