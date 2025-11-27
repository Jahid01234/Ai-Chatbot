import 'package:ai_chatbot/features/chat/controller/chat_controller.dart';
import 'package:ai_chatbot/features/chat/view/widgets/build_thinking_loader.dart';
import 'package:ai_chatbot/features/chat/view/widgets/custom_chat_app_bar.dart';
import 'package:ai_chatbot/features/chat/view/widgets/message_bubble.dart';
import 'package:ai_chatbot/features/chat/view/widgets/shimmer_loader_widgets.dart';
import 'package:ai_chatbot/features/chat/view/widgets/text_field_and_send_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomChatAppBar(controller: controller),
      body: Obx(() {
        if (controller.isInitLoading.value) {
          return ShimmerLoaderWidget();
        }
        return Column(
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
                      time: msg.time,
                    );
                  },
                ),
              ),
            ),

            Obx(
              () => controller.isLoading.value
                  ? BuildThinkingLoader()
                  : SizedBox(),
            ),

            TextFieldAndSendWidget(
              controller: controller.inputCtrl,
              sendButton: (){
                controller.sendMessage(controller.inputCtrl.text);
                controller.inputCtrl.clear();
              },
            ),
          ],
        );
      }),
    );
  }
}

