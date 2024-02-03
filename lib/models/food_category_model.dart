import 'food_model.dart';

class FoodCategoryModel{
  FoodCategoryModel({ required this.name, required this.image, required this.foods, required this.totalItems});

  final String name;
  final String image;
  final List<FoodModel> foods;
  final int totalItems;
}