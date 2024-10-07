import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/article/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  static const String route = '/article';
  const ArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Article View'),
      ),
    );
  }
}
