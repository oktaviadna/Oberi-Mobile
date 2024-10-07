import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/chat/chat_controller.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}