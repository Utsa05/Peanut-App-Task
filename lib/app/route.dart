import 'package:get/get.dart';
import 'package:peanut_app_task/views/pages/home/home-page.dart';
import 'package:peanut_app_task/views/pages/login/login-page.dart';
import 'package:peanut_app_task/views/pages/profile/profile-page.dart';

class AppRoute {
  const AppRoute._();

  static const String initialRoute = "/";
  static const String homeRoute = "/home-route";
  static const String profileRoute = "/profile-route";

  static List<GetPage<dynamic>> route = [
    GetPage(name: initialRoute, page: () => const LoginPage()),
    GetPage(name: homeRoute, page: () => const HomePage()),
    GetPage(name: profileRoute, page: () => const ProfilePage()),
  ];
}
