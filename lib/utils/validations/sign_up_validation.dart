import 'package:food_delivery_app_ui/controllers/sign_up_controller.dart';
import 'package:get/get.dart';

class SignupValidation{
  final ctr = Get.find<SignUpController>();

  static bool isValidEmail(String email){
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  static isValidPassword(String password){
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$').hasMatch(password);
  }

  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name is required';
    } else {
      return null;
    }
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!isValidEmail(value)) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? value) {
    final algerianPhoneNumberRegex = RegExp(r'^(\+213|0)(5|6|7)[0-9]{8}$');
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (!algerianPhoneNumberRegex.hasMatch(value)) {
      return 'Enter a valid phone number';
    } else {
      return null;
    }
  }

  static String? validateAddress(String? address) {
    if (address == null || address.isEmpty) {
      return 'Address is required';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? password){
    if(password == null || password.isEmpty){
      return "Password is required";
    }

    if(password.length < 6){
      return "Password must contain at least 6 characters";
    }
    return null;
  }
}
