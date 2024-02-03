import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/models/food_category_model.dart';
import 'package:food_delivery_app_ui/screens/auth/change_password_screen/change_password_screen.dart';
import 'package:food_delivery_app_ui/screens/auth/login_screen/login_screen.dart';
import 'package:food_delivery_app_ui/screens/auth/otp_screen/otp_screen.dart';
import 'package:food_delivery_app_ui/screens/auth/reset_password_screen/reset_password_screen.dart';
import 'package:food_delivery_app_ui/screens/auth/signup_screen/signup_screen.dart';
import 'package:food_delivery_app_ui/screens/change_address_screen/change_address_screen.dart';
import 'package:food_delivery_app_ui/screens/checkout_screen/checkout_screen.dart';
import 'package:food_delivery_app_ui/screens/food_details_screen/food_details_screen.dart';
import 'package:food_delivery_app_ui/screens/inbox_screen/inbox_screen.dart';
import 'package:food_delivery_app_ui/screens/main_screen/main_view.dart';
import 'package:food_delivery_app_ui/screens/menu_details_screen/menu_details_screen.dart';
import 'package:food_delivery_app_ui/screens/notifications/notifications_screen.dart';
import 'package:food_delivery_app_ui/screens/orders/orders_screen.dart';
import 'package:food_delivery_app_ui/screens/splash_screen/splash_screen.dart';
import 'package:food_delivery_app_ui/screens/welcome_screen/welcome_screen.dart';
import '../models/food_model.dart';
import '../screens/on_boarding_screen/on_boarding_screen.dart';

class AppRoutes {
  static const String splash = "/";
  static const String onBoarding = "/on-boarding";
  static const String welcome = "/welcome";
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String otp = "/otp";
  static const String forgotPassword = "/forgot-password";
  static const String home = '/home';
  static const String changePassword = "/change-password";
  static const String notifications = '/notifications';
  static const String inbox = "/inbox";
  static const String myOrders = "/my-orders";
  static const String menuDetails = "/menu-details";
  static const String foodDetails = "/food-details";
  static const String checkout = "/checkout";
  static const String changeAddress = "/change-address";

  static Widget transitionBuilder(_, animation, __, child){
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const SplashScreen());
      case onBoarding:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => OnBoarding(),
            transitionsBuilder: transitionBuilder
            );
      case welcome:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const WelcomeScreen(),
            transitionsBuilder: transitionBuilder,
          settings: const RouteSettings()
        );
      case login:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => LoginScreen(),
            transitionsBuilder: transitionBuilder
        );
      case signUp:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const SignupScreen(),
            transitionsBuilder: transitionBuilder
        );
      case otp:
        final phoneNumber = (settings.arguments as Map<String, dynamic>)["phoneNumber"];

        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => OTPScreen(phoneNumber: phoneNumber,),
            transitionsBuilder: transitionBuilder
        );
      case forgotPassword:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const ResetPasswordScreen(),
            transitionsBuilder: transitionBuilder
        );
      case changePassword:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const ChangePasswordScreen(),
            transitionsBuilder: transitionBuilder
        );
      case home:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => MainView(),
            transitionsBuilder: transitionBuilder
        );
      case notifications:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const NotificationsScreen(),
            transitionsBuilder: transitionBuilder
        );
      case inbox:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => InboxScreen(),
            transitionsBuilder: transitionBuilder
        );
      case myOrders:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => MyOrdersScreen(),
            transitionsBuilder: transitionBuilder
        );
      case menuDetails:
        final Map<String, FoodCategoryModel> arguments = (settings.arguments) as Map<String, FoodCategoryModel>;
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => MenuDetailsScreen(menu: arguments["menu"]! ,),
            transitionsBuilder: transitionBuilder
        );
      case foodDetails:
        final Map<String, FoodModel> arguments = (settings.arguments) as Map<String, FoodModel>;
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => FoodDetailsScreen(foodModel: arguments["food"]!),
            transitionsBuilder: transitionBuilder
        );
      case checkout:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const CheckoutScreen(),
            transitionsBuilder: transitionBuilder
        );
      case changeAddress:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const ChangeAddressScreen(),
            transitionsBuilder: transitionBuilder
        );
      default:
        // Handle unknown routes here
        return null;
    }
  }
}
