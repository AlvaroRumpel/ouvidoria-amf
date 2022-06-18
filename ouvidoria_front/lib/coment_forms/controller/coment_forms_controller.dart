import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouvidoria_front/models/comment_model.dart';
import 'package:ouvidoria_front/models/user_model.dart';
import 'package:ouvidoria_front/utils/btn_standart.dart';
import 'package:ouvidoria_front/utils/colors.dart';
import 'package:ouvidoria_front/utils/text_field_standart.dart';
import 'package:ouvidoria_front/utils/text_standart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ComentFormsController extends GetxController {
  RxBool anonimo = false.obs;
  String? department;
  TextEditingController subject = TextEditingController();
  TextEditingController comment = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  void onInit() async {
    super.onInit();
    // var localStorage = await SharedPreferences.getInstance();
    // var body = CommentModel(
    //   department: 'Adiministrativo',
    //   subject: 'Top demais',
    //   message: 'Muito bom o atendimento e toda atenção',
    // );
    // List<String> comments = await localStorage.getStringList('comments') ?? [];
    // for (var i = 0; i < 5; i++) {
    //   comments.add(body.toJson());
    // }
    // await localStorage.setStringList('comments', comments);
  }

  void validForms() async {
    if (subject.text.isEmpty || comment.text.isEmpty || department == null) {
      Get.snackbar(
        shouldIconPulse: true,
        snackPosition: SnackPosition.BOTTOM,
        'Erro',
        'Preencha todos os campos',
        backgroundColor: CustomColors.errorColor,
        colorText: Colors.white,
        icon: const Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
      );
      return;
    }
    await openPopUpSendDialog();
    var body = CommentModel(
      department: department!,
      subject: subject.text,
      message: comment.text.trim(),
      email: email.text,
      isAnonymous: anonimo.value,
      response: ' ',
    );
    var url = Uri.parse(
        'http://127.0.0.1:8000/set-comments/${body.subject}/${body.message}/${body.email}/${body.response}/${body.department}/${body.isAnonymous.toString().capitalizeFirst}');
    await http.get(url);
    await Get.offAndToNamed('/coment-form');
  }

  Future<void> openPopUpSendDialog() async {
    await Get.defaultDialog(
      barrierDismissible: false,
      title: 'Método de envio',
      titlePadding: const EdgeInsets.only(top: 16),
      titleStyle: GoogleFonts.inter(
        color: CustomColors.secondaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      content: Column(
        children: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextStandart(text: 'Quer ser anonimo?'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Checkbox(
                    activeColor: CustomColors.secondaryColor,
                    splashRadius: 10,
                    side: const BorderSide(
                      color: CustomColors.secondaryColor,
                      width: 2,
                    ),
                    shape: const CircleBorder(),
                    value: anonimo.value,
                    onChanged: (value) => anonimo.toggle(),
                  ),
                ),
              ],
            ),
          ),
          TextFieldStandart(
            hintText: 'Email',
            controller: email,
          ),
          BtnStandart(
            text: 'Enviar',
            onPressed: () async {
              if (!email.text.isEmail) {
                Get.snackbar(
                  snackPosition: SnackPosition.BOTTOM,
                  'Erro',
                  'Preencha todos os campos',
                  backgroundColor: CustomColors.errorColor,
                  colorText: Colors.white,
                  icon: const Icon(
                    Icons.error_outline,
                    color: Colors.white,
                  ),
                );
                return;
              }
              Get.back();
            },
          ),
          BtnStandart(
              text: 'Cancelar',
              onPressed: () => Get.back(),
              color: CustomColors.errorColor),
        ],
      ),
      contentPadding: const EdgeInsets.all(16.0),
      radius: 10,
    );
  }
}
