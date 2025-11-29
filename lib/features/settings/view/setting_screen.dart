import 'package:ai_chatbot/core/style/global_text_style.dart';
import 'package:ai_chatbot/features/settings/controller/setting_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final SettingController controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            // Back Button
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white.withValues(alpha: 0.1)
                          : Colors.black.withValues(alpha: 0.08),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "Setting",
                  style: globalTextStyle(
                    context,
                    color:
                    Theme.of(context).colorScheme.onPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),

            SizedBox(height: 50),
            Obx(
              () =>
                  // Dark/light mode.............
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color:  Theme.of(context).brightness == Brightness.light
                          ? Colors.white54
                          : Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Light and dark mode text show
                        Text(
                          controller.isDarkTheme.value
                              ? "Dark Mode"
                              : "Light Mode",
                          style: globalTextStyle(
                            context,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                ? Colors.grey
                                : Colors.white,
                            fontSize: 16,
                          ),
                        ),

                        // switch toggle
                        CupertinoSwitch(
                          value: controller.isDarkTheme.value,
                          onChanged: controller.toggleTheme,
                        ),
                      ],
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
