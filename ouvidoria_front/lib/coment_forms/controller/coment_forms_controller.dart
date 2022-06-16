import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouvidoria_front/utils/btn_standart.dart';
import 'package:ouvidoria_front/utils/colors.dart';
import 'package:ouvidoria_front/utils/text_field_standart.dart';
import 'package:ouvidoria_front/utils/text_standart.dart';

class ComentFormsController extends GetxController {
  RxBool anonimo = false.obs;
  void openPopUpSendDialog() {
    Get.defaultDialog(
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
          ),
          BtnStandart(text: 'Enviar', onPressed: () {}),
        ],
      ),
      contentPadding: const EdgeInsets.all(16.0),
      radius: 10,
    );
  }
}
