import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController{
  late SharedPreferences _preferences;

  Future<MainController> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  SharedPreferences get preferences => _preferences;
  bool get onboardingShown => _preferences.getBool('onboardingShown') ?? false;

  Future<void> setOnboardingShown() async {
    await _preferences.setBool('onboardingShown', true);
  }
}