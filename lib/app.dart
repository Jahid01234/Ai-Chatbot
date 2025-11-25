import 'package:ai_chatbot/features/chat/view/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiChatbotApp extends StatelessWidget {
  const AiChatbotApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ai Chatbot App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      home: ChatScreen()
    );
  }
}