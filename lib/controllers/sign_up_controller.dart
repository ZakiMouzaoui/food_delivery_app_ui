import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app_ui/repository/auth_repository/auth_repository.dart';
import 'package:food_delivery_app_ui/repository/auth_repository/exceptions/sign_up_exception.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  final TextEditingController nameCtr = TextEditingController();
  final TextEditingController emailCtr = TextEditingController();
  final TextEditingController mobileCtr = TextEditingController();
  final TextEditingController addressCtr = TextEditingController();
  final TextEditingController pwd1Ctr = TextEditingController();
  final TextEditingController pwd2Ctr = TextEditingController();

  String? validatePasswordMatch(String? pwd){
    final String pwd1 = pwd1Ctr.value.text;
    if(pwd1.isNotEmpty && pwd == null || pwd != pwd1){
      return "Passwords are not matching";
    }

    return null;
  }

  void verifyPhone() async{
    await Get.find<AuthRepository>().authenticatePhoneNumber(mobileCtr.text);
  }

  Future<void> signUp() async{
    final ctr = Get.find<AuthRepository>();
    try{
      await ctr.signUp(emailCtr.text, pwd1Ctr.text);
    }
    on SignUpFailure catch(e){
      Get.snackbar(e.message, "");
    }
  }

  void clearForm(){

  }

  @override
  void onClose() {
    print("closing controller");
    super.onClose();
  }

  @override
  void dispose() {
    print("disposed");
    nameCtr.clear();
    nameCtr.dispose();

    emailCtr.clear();
    emailCtr.dispose();

    mobileCtr.clear();
    mobileCtr.dispose();

    addressCtr.clear();
    addressCtr.dispose();

    pwd1Ctr.clear();
    pwd1Ctr.dispose();

    pwd2Ctr.clear();
    pwd2Ctr.dispose();

    super.dispose();
  }
}
