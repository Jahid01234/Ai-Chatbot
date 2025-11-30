import 'package:ai_chatbot/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class TextFieldAndSendWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback sendButton;

  const TextFieldAndSendWidget({
    super.key,
    required this.controller,
    required this.sendButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              cursorColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              style: globalTextStyle(
                context,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
              decoration: InputDecoration(
                hintText: "Type message...",
                hintStyle: globalTextStyle(
                  context,
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: sendButton,
            child: Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.blueGrey
                    : Colors.teal,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                  child: Icon(
                      Icons.send,
                      color: Colors.white,
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
