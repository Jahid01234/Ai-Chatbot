import 'package:ai_chatbot/core/style/custom_alert_dialog.dart';
import 'package:ai_chatbot/features/chat/controller/chat_controller.dart';
import 'package:ai_chatbot/features/chat/view/widgets/message_bubble.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("AI Chatbot", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
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
                  onCancel: () {
                    Navigator.pop(context);
                  },
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
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    controller.sendMessage(controller.inputCtrl.text);
                    controller.inputCtrl.clear();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(child: Icon(Icons.send, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
