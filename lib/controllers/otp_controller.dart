import 'package:food_delivery_app_ui/repository/auth_repository/auth_repository.dart';
import 'package:food_delivery_app_ui/routes/routes.dart';
import 'package:get/get.dart';

class OtpController extends GetxController{
  void verifyOtp(String otp) async{
    final isVerified = await Get.find<AuthRepository>().verifyOtp(otp);
    isVerified ? Get.offAllNamed(AppRoutes.home) : Get.back();
  }
}