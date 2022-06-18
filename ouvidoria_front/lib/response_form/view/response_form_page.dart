import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouvidoria_front/response_form/controller/response_form_controller.dart';
import 'package:ouvidoria_front/utils/btn_standart.dart';
import 'package:ouvidoria_front/utils/colors.dart';
import 'package:ouvidoria_front/utils/text_field_standart.dart';
import 'package:ouvidoria_front/utils/text_standart.dart';

class ResponseFormPage extends StatelessWidget {
  ResponseFormController ct = Get.put(ResponseFormController());
  ResponseFormPage({Key? key}) : super(key: key);

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
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back,
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
        // decoration: BoxDecoration(
        //   color: CustomColors.container,
        //   borderRadius: BorderRadius.circular(10),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.black.withOpacity(0.25),
        //       blurRadius: 4,
        //       offset: const Offset(0, 3), // changes position of shadow
        //     ),
        //   ],
        // ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStandart(text: 'Comentário'),
              ct.obx(
                ((state) => Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: CustomColors.container,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 4,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      width: double.maxFinite,
                      child: Text(
                        state ?? '',
                        style: GoogleFonts.inter(),
                      ),
                    )),
                onLoading: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              TextStandart(text: 'Resposta'),
              Container(
                padding: const EdgeInsets.all(24),
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
                child: TextFieldStandart(
                  controller: ct.resposta,
                  hintText: 'Descreva o seu comentário...',
                  maxLength: 255,
                  maxLines: 3,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: BtnStandart(
                      text: 'Enviar',
                      onPressed: () => ct.sendResponse(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: BtnStandart(
                      color: CustomColors.errorColor,
                      text: 'Cancelar',
                      onPressed: () => Get.offAndToNamed('/comments-view'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
