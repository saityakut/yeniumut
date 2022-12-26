import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/auth_service.dart';
import '../view/home_page.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool isLoading = false;

  void formSubmit() async {
    isLoading = true;
    update();
    formKey.currentState!.save();
    debugPrint('user bilgileri : $email -- $password');
    bool result =
        await AuthService().signInWithEmailandPassword(email, password);
    if (result == true) {
      isLoading = false;
      update();
      // ignore: use_build_context_synchronously
      Get.offAll(
        HomePage(),
      );
    } else {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: const Text('Hata!!'),
            content: const Text('Giriş yaparken bir hata oluştu'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Tamam',
                  style: TextStyle(color: Colors.greenAccent),
                ),
              ),
            ],
          );
        },
      );
      isLoading = false;
      update();
    }
  }
}
