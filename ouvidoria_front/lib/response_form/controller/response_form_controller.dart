import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ouvidoria_front/utils/colors.dart';

class ResponseFormController extends GetxController with StateMixin<String> {
  var id = Get.parameters;
  var resposta = TextEditingController();
  String? data;

  @override
  void onInit() async {
    super.onInit();
    change(state, status: RxStatus.loading());
    var url = Uri.parse("http://127.0.0.1:8000/get-comments-by-id/${id['id']}");
    var response = await http.get(url);
    data = jsonDecode(response.body)[0][2];
    change(data, status: RxStatus.success());
  }

  void sendResponse() async {
    if (resposta.text.length < 4) {
      Get.snackbar(
        shouldIconPulse: true,
        snackPosition: SnackPosition.BOTTOM,
        'Preencha o campo corretamente',
        'Preencha o campo com no minimo 3 caracteres',
        backgroundColor: CustomColors.errorColor,
        colorText: Colors.white,
        icon: const Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
      );
      return;
    }
    var url = Uri.parse(
        "http://127.0.0.1:8000/set-comments-response/${id['id']}/${resposta.text}");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Get.snackbar(
        shouldIconPulse: true,
        snackPosition: SnackPosition.BOTTOM,
        'Resposta enviada',
        'Resposta ao comentário armazenada com sucesso',
        backgroundColor: CustomColors.sucessColor,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      Get.offAndToNamed('/comments-view');
    }
  }
}
