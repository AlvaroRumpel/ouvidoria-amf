import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvidoria_front/utils/btn_standart.dart';
import 'package:ouvidoria_front/utils/text_field_standart.dart';
import 'package:ouvidoria_front/utils/text_standart.dart';
import 'package:ouvidoria_front/utils/btn_text_standart.dart';
import 'package:ouvidoria_front/utils/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteStandard,
      appBar: AppBar(
        leadingWidth: 128,
        leading: Image.asset(
          'logo_amf.png',
        ),
        backgroundColor: CustomColors.primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: () => Get.offAndToNamed('/coment-form'),
              icon: const Icon(
                Icons.forum_outlined,
                color: CustomColors.whiteStandard,
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width > 500
              ? MediaQuery.of(context).size.width * 0.25
              : MediaQuery.of(context).size.width * 0.1,
          vertical: MediaQuery.of(context).size.height * 0.05,
        ),
        decoration: BoxDecoration(
          color: CustomColors.container,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStandart(
                text: 'Email',
              ),
              TextFieldStandart(
                hintText: 'Email',
              ),
              TextStandart(
                text: 'Senha',
              ),
              TextFieldStandart(
                hintText: 'Senha',
              ),
              Align(
                alignment: Alignment.center,
                child: BtnStandart(
                  text: 'Acessar',
                  onPressed: () => Get.offAndToNamed('/comments-view'),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: BtnTextStandart(
                  text: 'Esqueceu a senha?',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
