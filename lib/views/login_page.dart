import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_firebase_tutorial/controllers/main_controller.dart';
import 'package:the_validator/the_validator.dart';

class LoginPage extends GetView<MainController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final keyForm = GlobalKey<FormState>();

    return Obx(() {
      return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: keyForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/image1.jpg'),
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: TextFormField(
                        controller: controller.emailController,
                        validator: FieldValidator.email(),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        autofocus: false,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: TextFormField(
                        controller: controller.passwordController,
                        validator: FieldValidator.password(minLength: 6),
                        keyboardType: TextInputType.visiblePassword,
                        autocorrect: false,
                        obscureText: controller.showPassword.value,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (controller.showPassword.value) {
                                controller.showPassword.value = false;
                              } else {
                                controller.showPassword.value = true;
                              }
                            },
                            icon: Icon(controller.showPassword.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    controller.loadingIndicator.value
                        ? const SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (keyForm.currentState!.validate()) {
                                  controller.loadingIndicator.value = true;
                                  await controller.loginFunc();
                                }
                                controller.loadingIndicator.value = false;
                              },
                              child: const Text(
                                'Login ...',
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Your not have account? ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: () {
                              controller.pageController.animateToPage(
                                PageIndex.Register.page,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                            },
                            child: const Text('Register here.'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
