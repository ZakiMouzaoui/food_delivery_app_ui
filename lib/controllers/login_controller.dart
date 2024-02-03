import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/repository/auth_repository/auth_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailCtr = TextEditingController();
  final TextEditingController pwdCtr = TextEditingController();

  @override
  void dispose() {
    emailCtr.dispose();
    pwdCtr.dispose();
    super.dispose();
  }

  Future<void> login()async{
    final authRepo = Get.find<AuthRepository>();
    await authRepo.loginWithEmailAndPassword(emailCtr.text, pwdCtr.text);
  }
}