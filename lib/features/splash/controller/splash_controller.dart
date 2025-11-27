import 'package:ai_chatbot/features/chat/view/chat_screen.dart';
import 'package:get/get.dart';



class SplashController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    redirectToNextScreen();
  }


  Future<void> redirectToNextScreen()async{
    await Future.delayed( const Duration(seconds: 2));
    Get.offAll(()=>ChatScreen());
  }
}

