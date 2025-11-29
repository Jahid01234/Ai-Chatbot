import 'package:ai_chatbot/core/style/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final String time;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isUser,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    DateTime parsedTime = DateTime.parse(time);
    String formattedTime = DateFormat('hh:mm a').format(parsedTime);

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? Colors.pink : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment:
          isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            // Chat message...........
            GptMarkdown(
              message,
              style: globalTextStyle(
                context,
                color: isUser ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 6),
            // Time text.......
            Text(
              formattedTime,
              style: globalTextStyle(
                context,
                color: isUser ? Colors.white70 : Colors.black54,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

