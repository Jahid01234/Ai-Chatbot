import 'package:ai_chatbot/core/routes/app_routes.dart';
import 'package:ai_chatbot/core/theme/dark_theme/dark_theme.dart';
import 'package:ai_chatbot/core/theme/light_theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiChatbotApp extends StatelessWidget {
  final String initialRoute;
  const AiChatbotApp({super.key, required this.initialRoute});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ai Chatbot App',
      debugShowCheckedModeBanner: false,
        getPages: AppRoutes.routes,
        initialRoute: initialRoute,
        theme: lightTheme,
        darkTheme: darkTheme,

    );
  }
}