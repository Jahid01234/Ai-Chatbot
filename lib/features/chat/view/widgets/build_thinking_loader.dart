import 'package:ai_chatbot/core/style/global_text_style.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class BuildThinkingLoader extends StatelessWidget {
  const BuildThinkingLoader({super.key});

  @override
  Widget build(BuildContext context) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.only(left: 12, bottom: 12),
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TyperAnimatedText(
                "AI is thinking...",
                speed: Duration(milliseconds: 70),
                textStyle: globalTextStyle(
                  context,
                  color: Colors.black87,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      );
  }
}
