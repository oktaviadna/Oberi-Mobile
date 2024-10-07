import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/chat/chat_binding.dart';
import 'package:oberi_mobile/ui/views/chat/chat_view.dart';

final chatRoute = [
  GetPage(
    name: ChatView.route,
    page: () => const ChatView(),
    binding: ChatBinding(),
  ),
];
