import 'package:ai_chatbot/features/chat/view/widgets/message_bubble.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatController controller = Get.put(ChatController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("AI Chatbot"),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: Text("Options"),
                  content: Text("Choose an action:"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        controller.clearChat();
                        Get.back();
                      },
                      child: Text("Clear Chat"),
                    ),
                    TextButton(
                      onPressed: () => Get.back(),
                      child: Text("Close"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                controller: controller.scrollController,
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final msg = controller.messages[index];
                  return MessageBubble(
                    message: msg.message,
                    isUser: msg.sender == "user",
                  );
                },
              ),
            ),
          ),

          Obx(
            () => controller.isLoading.value
                ? Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 12, bottom: 12),
                    padding: EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
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
                          textStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                : SizedBox(),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.inputCtrl,
                    decoration: InputDecoration(
                      hintText: "Type message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    controller.sendMessage(controller.inputCtrl.text);
                    controller.inputCtrl.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
