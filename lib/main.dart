import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app_firebase_tutorial/firebase_options.dart';
import 'package:app_firebase_tutorial/views/main_app.dart';
import 'package:app_firebase_tutorial/controllers/main_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(MainController());
  runApp(
    DevicePreview(
      builder: (context) => const MainApp(),
    ),
  );
}
