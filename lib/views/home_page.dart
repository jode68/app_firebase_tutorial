import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_firebase_tutorial/controllers/main_controller.dart';

class HomePage extends GetView<MainController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {
              controller.loginOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.lightBlue,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'User : ${controller.userEmail}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
