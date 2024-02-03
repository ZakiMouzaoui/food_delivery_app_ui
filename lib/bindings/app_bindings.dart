import 'package:get/get.dart';

import '../repository/auth_repository/auth_repository.dart';

class AppBindings implements Bindings{
  @override
  void dependencies() {
    //Get.lazyPut(()=>AuthRepository());
  }
}