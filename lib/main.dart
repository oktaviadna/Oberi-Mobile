import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';
import 'package:oberi_mobile/services_locator.dart';

import 'core/themes/app_theme.dart';
import 'ui/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesLocator.init();
  AppOrientation.lock(DeviceOrientation.portraitUp);
  AppTheme.setStatusBar(brightness: Brightness.dark, color: Colors.white);
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const MyApp(),
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oberi Mobile',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
    );
  }
}
