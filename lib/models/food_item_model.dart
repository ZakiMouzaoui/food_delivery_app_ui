class FoodItemModel{
  FoodItemModel({ required this.name, required this.price, this.qty=1, this.description});

  final String name;
  final String? description;
  final int price;
  int qty;
}