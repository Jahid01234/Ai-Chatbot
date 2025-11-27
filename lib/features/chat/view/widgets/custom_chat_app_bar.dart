import 'package:flutter/material.dart';
import 'package:ai_chatbot/core/style/global_text_style.dart';
import 'package:ai_chatbot/core/global_widgets/custom_alert_dialog.dart';
import 'package:ai_chatbot/features/chat/controller/chat_controller.dart';

class CustomChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ChatController controller;

  const CustomChatAppBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal,
      title: Text(
        "AI Chatbot",
        style: globalTextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => CustomAlertDialog(
                title: "Delete Chat",
                description: "Are you sure delete all chat history?",
                onConfirm: () {
                  controller.clearChat();
                  Navigator.pop(context);
                },
                onCancel: () => Navigator.pop(context),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
