import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouvidoria_front/coment_forms/controller/coment_forms_controller.dart';
import 'package:ouvidoria_front/utils/btn_standart.dart';
import 'package:ouvidoria_front/utils/colors.dart';
import 'package:ouvidoria_front/utils/text_field_standart.dart';
import 'package:ouvidoria_front/utils/text_standart.dart';

class ComentFormsPage extends StatelessWidget {
  var ct = Get.put(ComentFormsController());
  ComentFormsPage({Key? key}) : super(key: key);

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
              onPressed: () => Get.toNamed('/login'),
              icon: const Icon(
                Icons.login_outlined,
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
                child: TextStandart(
                  text:
                      'Preencha o Formulário com as suas reclamações ou Sugestões',
                  align: TextAlign.center,
                ),
              ),
              TextStandart(text: 'Setor'),
              DropdownSearch(
                onChanged: (value) => ct.department = value as String,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  baseStyle: GoogleFonts.inter(
                    color: CustomColors.secondaryColor,
                  ),
                  dropdownSearchDecoration: InputDecoration(
                    hintText: 'Setores',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 2,
                        color: CustomColors.secondaryColor,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 2,
                        color: CustomColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                items: const [
                  'Administrativo',
                  'Financeiro',
                  'Docente',
                  'Relacionamento',
                  'Juridico',
                  'Secretaria',
                ],
              ),
              TextStandart(text: 'Assunto'),
              TextFieldStandart(
                controller: ct.subject,
                hintText: 'Assunto',
                maxLength: 40,
                maxLines: 1,
              ),
              TextStandart(text: 'Comentário'),
              TextFieldStandart(
                controller: ct.comment,
                hintText: 'Descreva o seu comentário...',
                maxLength: 255,
                maxLines: 3,
              ),
              Align(
                alignment: Alignment.center,
                child: BtnStandart(
                  text: 'Enviar',
                  onPressed: () => ct.validForms(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
