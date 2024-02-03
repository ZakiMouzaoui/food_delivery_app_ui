import 'package:get/get.dart';

class CheckoutController extends GetxController{
  RxInt selectedIdx = 0.obs;

  void changeIdx(int newIdx){
    selectedIdx.value = newIdx;
  }
}