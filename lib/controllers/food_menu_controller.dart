import 'package:food_delivery_app_ui/models/food_category_model.dart';
import 'package:food_delivery_app_ui/models/food_model.dart';
import 'package:get/get.dart';

class FoodMenuController extends GetxController{
  final List<FoodCategoryModel> menus = [
    FoodCategoryModel(name: "Appetizers", image: "assets/images/appetizer-menu.jpg", foods: [
      FoodModel(name: "Zaalouk", image: "https://th.bing.com/th/id/OIP.Hhw7aq8xS8khqFlnOf061gHaLH?rs=1&pid=ImgDetMain", description: "Grilled eggplant and tomatoes with garlic and spices.", price: 200),
      FoodModel(name: "Brik à l'Oeuf", image: "https://th.bing.com/th/id/OIP.obGSTZ-E61yOCibXeGOfBQHaFj?rs=1&pid=ImgDetMain", description: "Thin pastry filled with a mixture of egg, tuna, capers, and parsley, then deep-fried.", price: 200),
      FoodModel(name: "Chourba Frik", image: "https://s3-eu-west-1.amazonaws.com/images-ca-1-0-1-eu/recipe_photos/slide/148342/Chorba_frik_traditionnelle_recette_soupe_algerienne_1_680.jpg", description: "A hearty soup made with cracked wheat (frik), meat, vegetables, and spices.", price: 200),
      FoodModel(name: "Makbouba", image: "https://th.bing.com/th/id/OIP.3r_LHLEqPHCZ5zPJiAnL6QHaE7?w=800&h=533&rs=1&pid=ImgDetMain", description: "Mashed potatoes mixed with garlic, olive oil, and paprika, served as a dip with bread.", price: 200),
    ], totalItems: 4),

    FoodCategoryModel(name: "Main Courses", image: "assets/images/main-course-menu.jpg", foods: [
      FoodModel(name: "Couscous Royale", image: "https://th.bing.com/th/id/R.ad62897863908181ce541769fef665b0?rik=sKyA%2finfomn%2bHQ&pid=ImgRaw&r=0", description: "Steamed couscous served with a rich stew of lamb, chicken, and vegetables.", price: 200),
      FoodModel(name: "Tagine Djaj", image: "https://canalcocina.es/medias/images/1604CocinaMarroquiTajinPolloAlbaricoques2.jpg", description: "Chicken tagine with preserved lemons, olives, and a blend of aromatic spices.", price: 200),
      FoodModel(name: "Loubia", image: "https://th.bing.com/th/id/OIP.DsraN3ZqOchXYc6T3bEYLQHaEK?rs=1&pid=ImgDetMain", description: "White bean stew cooked with tomatoes, garlic, and spices, often served with merguez sausage.", price: 200),
      FoodModel(name: "Merguez Sandwich", image: "https://th.bing.com/th/id/OIP.Usrw7ROJty9HNZ8lrUXdeAHaEB?w=298&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7", description: "Grilled spicy lamb or beef sausages served in a baguette with harissa and vegetables.", price: 200),
      FoodModel(name: "Chakhchoukha", image: "https://i0.wp.com/theazizkitchen.com/wp-content/uploads/2021/08/Image_1.png?resize=1024%2C577&ssl=1", description: "Broken vermicelli cooked with chickpeas, tomatoes, and lamb, seasoned with cumin and coriander.", price: 200),
    ], totalItems: 5),

    FoodCategoryModel(name: "Desserts", image: "assets/images/appetizer-menu.jpg", foods: [
      FoodModel(name: "Baklawa", image: "https://th.bing.com/th/id/OIP.ZekuBgf6_MhqxDOKvYu9zgHaFn?rs=1&pid=ImgDetMain", description: "Layers of phyllo dough filled with chopped nuts and sweetened with honey or syrup.", price: 200),
      FoodModel(name: "M'hanncha", image: "https://img.theculturetrip.com/1440x/smart/wp-content/uploads/2020/04/kn5x0g.jpg", description: "Coiled almond pastry with cinnamon and orange blossom water.", price: 200),
      FoodModel(name: "Makrout", image: "https://i.pinimg.com/originals/1c/fd/c0/1cfdc07e15d062715747f04322f8ddec.jpg", description: "Deep-fried sweet dough spirals soaked in honey or sugar syrup.", price: 200),
      FoodModel(name: "Zlabya", image: "https://cac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fcac.2F2018.2F09.2F25.2Fe4aafe72-3c01-4339-aca4-ca1a28582ab5.2Ejpeg/750x562/quality/80/crop-from/center/zlabia.jpeg", description: "Date-filled semolina cookies, often shaped into diamonds and deep-fried.", price: 200),
    ], totalItems: 4),

    FoodCategoryModel(name: "Beverages", image: "assets/images/beverage-menu.webp", foods: [
      FoodModel(name: "Mint Tea (Té B’naana)", image: "https://th.bing.com/th/id/R.6eeaf8d01e457b477b7bb4a91472420a?rik=9w83gNuVfNgNEA&riu=http%3a%2f%2fprovendietpillsreview.com%2fwp-content%2fuploads%2f2014%2f12%2fpeppermint-tea-weight-loss1.jpeg&ehk=I4niDqI%2beMpNas3%2fUvoANk7ZYGZlK7IVTOFoQ7LyAVg%3d&risl=&pid=ImgRaw&r=0", description: "Green tea brewed with fresh mint leaves and sweetened with sugar.", price: 200),
      FoodModel(name: "Jus d'Orange Frais", image: "https://th.bing.com/th/id/OIP.ABQZuWNbhGgfOL_Hy1yz8AHaE8?rs=1&pid=ImgDetMain", description: "Freshly squeezed orange juice, a refreshing choice.", price: 200),
      FoodModel(name: "Smoothie", image: "https://th.bing.com/th/id/OIP.o7Dk_IeVEunD1bO8RCYiowHaLH?rs=1&pid=ImgDetMain", description: "A smoothie inspired by the flavors of Tchakchouka, with tomatoes, bell peppers, and a hint of spice.", price: 200),
      FoodModel(name: "Qamar al-Din Juice", image: "https://images.squarespace-cdn.com/content/v1/5bbb34b1da50d330b2643e06/1557921010989-5YCF27XZLJBBI1CRE65O/Apricot+Juice+(Qaseer+Qamar+Al-Din)", description: "Apricot juice, a popular and sweet beverage.", price: 200),
    ], totalItems: 4),
  ];
}