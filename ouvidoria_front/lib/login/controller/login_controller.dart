import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ouvidoria_front/utils/colors.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void login() async {
    var url = Uri.parse(
        "http://127.0.0.1:8000/login/${emailController.text}/${passController.text}");
    var response = await http.get(url);
    if (response.body == 'true') {
      Get.offAndToNamed('/comments-view');
    } else {
      Get.snackbar(
        shouldIconPulse: true,
        snackPosition: SnackPosition.BOTTOM,
        'Erro',
        'Verifique as informações',
        backgroundColor: CustomColors.errorColor,
        colorText: Colors.white,
        icon: const Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
      );
    }
  }
}
