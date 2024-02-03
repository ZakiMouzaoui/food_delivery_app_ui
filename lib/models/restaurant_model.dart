class RestaurantModel{
  RestaurantModel({ required this.image, required this.title, required this.rating, required this.totalRatings});

  final String image;
  final String title;
  final double rating;
  final int totalRatings;
}