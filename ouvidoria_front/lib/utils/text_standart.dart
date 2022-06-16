import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ouvidoria_front/utils/colors.dart';

class TextStandart extends StatelessWidget {
  String text;
  TextAlign align;
  TextStandart({
    required this.text,
    this.align = TextAlign.left,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: GoogleFonts.inter(
          color: CustomColors.secondaryColor,
          fontSize: MediaQuery.of(context).size.width > 500 ? 24 : 16,
          fontWeight: FontWeight.w500,
        ),
        textAlign: align,
      ),
    );
  }
}
