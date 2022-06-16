import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouvidoria_front/utils/btn_standart.dart';
import 'package:ouvidoria_front/utils/btn_text_standart.dart';
import 'package:ouvidoria_front/utils/colors.dart';
import 'package:ouvidoria_front/utils/text_field_standart.dart';
import 'package:ouvidoria_front/utils/text_standart.dart';

class CommentsViewPage extends StatelessWidget {
  CommentsViewPage({Key? key}) : super(key: key);
  ScrollController scroll = ScrollController();
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
              onPressed: () => Get.offAndToNamed('/login'),
              icon: const Icon(
                Icons.logout,
                color: CustomColors.whiteStandard,
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width > 500
              ? MediaQuery.of(context).size.width * 0.15
              : MediaQuery.of(context).size.width * 0.1,
          vertical: MediaQuery.of(context).size.height * 0.05,
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextStandart(
              text: 'Comentários',
            ),
            TextFieldStandart(
              hintText: 'Pesquisar',
            ),
            Expanded(
              child: Scrollbar(
                scrollbarOrientation: ScrollbarOrientation.bottom,
                thumbVisibility:
                    MediaQuery.of(context).size.width > 500 ? true : false,
                trackVisibility:
                    MediaQuery.of(context).size.width > 500 ? true : false,
                controller: scroll,
                child: ListView.builder(
                  scrollDirection: MediaQuery.of(context).size.width > 500
                      ? Axis.horizontal
                      : Axis.vertical,
                  shrinkWrap: true,
                  controller: scroll,
                  itemCount: 10,
                  itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      top: 16,
                      bottom: 24,
                    ),
                    child: Container(
                      width: 250,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        // color: CustomColors.container,
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
                      child: InkWell(
                        onTap: () => Get.toNamed('/response-form'),
                        splashColor: CustomColors.blackSecondary,
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                            (states) => CustomColors.container),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextStandart(text: 'Cleito'),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextStandart(text: 'Assunto assunto'),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Eu gosto muito da AMF. Que legal Eu gosto muito da AMF. Que legal Eu gosto muito da AMF. Que legal Eu gosto muito da AMF. Que legal Eu gosto muito da AMF. Que legal ',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: GoogleFonts.inter(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
