import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_firebase_tutorial/controllers/main_controller.dart';

class MainApp extends GetView<MainController> {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.indigo,
      ),
      home: Obx(() {
        return PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            controller.loginReady() ? controller.homePage : controller.loginPage,
            controller.loginReady() ? controller.homePage : controller.registerPage,
          ],
        );
      }),
    );
  }
}
