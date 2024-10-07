import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/article/article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleController());
  }
}