import 'package:ai_chatbot/app.dart';
import 'package:ai_chatbot/core/routes/app_routes.dart';
import 'package:ai_chatbot/core/services/local_services/shared_preferences_helper.dart';
import 'package:ai_chatbot/features/settings/controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isFirstTime = await SharedPreferencesHelper.getIsFirstTime();
  String initialRoute =
  isFirstTime ? AppRoutes.splash : AppRoutes.splash;
  Get.put(SettingController());
  runApp(AiChatbotApp(initialRoute: initialRoute));
}

