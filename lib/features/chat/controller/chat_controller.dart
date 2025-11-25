

import 'package:ai_chatbot/core/services/local_services/chat_database.dart';
import 'package:ai_chatbot/features/chat/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ai_chatbot/core/const/url/urls.dart';

class ChatController extends GetxController {
  final TextEditingController inputCtrl = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final db = ChatDatabase.instance;
  RxList<ChatModel> messages = <ChatModel>[].obs;
  RxBool isLoading = false.obs;



  @override
  void onInit() {
    super.onInit();
    loadMessages();
  }

  // Load messages from local database.......
  Future<void> loadMessages() async {
    messages.value = await db.getMessages();
    scrollToBottom();
  }

  // Clear chat..........
  Future<void> clearChat() async {
    await db.deleteChat();
    messages.clear();
    scrollToBottom();
  }

  // Send message....................
  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    // Save user message
    final userMessage = ChatModel(
      message: text,
      sender: "user",
      time: DateTime.now().toString(),
    );
    await db.insertMessage(userMessage);
    messages.add(userMessage);
    scrollToBottom();

    isLoading.value = true;

    try {
      final botReply = await _getBotReply(text);

      if (botReply != null && botReply.isNotEmpty) {
        final botMessage = ChatModel(
          message: botReply,
          sender: "bot",
          time: DateTime.now().toString(),
        );

        await db.insertMessage(botMessage);
        messages.add(botMessage);
        scrollToBottom();
      }
    } finally {
      isLoading.value = false;
    }
  }

  // Call Gemini API...........
  Future<String?> _getBotReply(String prompt) async {
    try {
      final url = Uri.parse(Urls.url);
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "contents": [
            {"parts": [{"text": prompt}]}
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["candidates"][0]["content"]["parts"][0]["text"];
      } else {
        _showError("⚠️ Server did not respond.");
        return null;
      }
    } on SocketException {
      _showError("❌ No internet connection!");
      return null;
    } on TimeoutException {
      _showError("⏳ Server took too long to respond. Please try again later.");
      return null;
    } on HttpException {
      _showError("❌ HTTP error occurred. Please try again.");
      return null;
    } on FormatException {
      _showError("❌ Invalid JSON format received from server.");
      return null;
    } catch (e) {
      _showError("⚠️ Unexpected error occurred: $e");
      return null;
    }
  }

  // Show error using GetX snackbar............
  void _showError(String msg) {
    Get.snackbar(
      "Error",
      msg,
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      margin: EdgeInsets.all(12),
    );
  }

  // Scroll ListView to bottom......
  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}

