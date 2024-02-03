import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/bindings/app_bindings.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/controllers/main_controller.dart';
import 'package:food_delivery_app_ui/repository/auth_repository/auth_repository.dart';
import 'package:food_delivery_app_ui/routes/routes.dart';
import 'package:food_delivery_app_ui/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() async => MainController().init());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync(() async => AuthRepository());

  runApp(const FoodDeliveryApp());
}

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375,812),
      child: GetMaterialApp(
        initialRoute: "/",
        //initialBinding: AppBindings(),
        onGenerateRoute: (settings)=> AppRoutes.generateRoute(settings),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: AppColors.primaryColor
          )
        ),
        home:  SplashScreen()

      ),
    );
  }
}
