import 'package:ai_chatbot/features/splash/view/splash_screen.dart';
import 'package:get/get.dart';


class AppRoutes{
  // Get routes name here.................
  static const String splash = '/splash';






  // Get routes here.................
  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.leftToRight,
    ),
  ];


}