import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/article/article_binding.dart';
import 'package:oberi_mobile/ui/views/article/article_view.dart';

final articleRoute = [
  GetPage(
    name: ArticleView.route,
    page: () => const ArticleView(),
    binding: ArticleBinding(),
  ),
];
