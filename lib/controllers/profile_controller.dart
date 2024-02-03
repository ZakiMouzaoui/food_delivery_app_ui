import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app_ui/repository/auth_repository/auth_repository.dart';
import 'package:food_delivery_app_ui/routes/routes.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController{
  TextEditingController nameCtr = TextEditingController(text: "zaki");
  TextEditingController emailCtr = TextEditingController(text: "zakimouzaoui123@gmail.com");
  TextEditingController phoneCtr = TextEditingController(text: "0558405601");
  TextEditingController addressCtr = TextEditingController(text: "Hai El Sabah, Oran");
  TextEditingController pwdCtr = TextEditingController(text: "zakizaki");

  Rx<String> imgPath = "".obs;

  Future<void> pickImage() async{
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      imgPath.value = image.path;
    }
  }

  Future<void> signOut()async{
    await Get.find<AuthRepository>().signOut();
    Get.offAllNamed(AppRoutes.welcome);
  }
}
