import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ouvidoria_front/utils/colors.dart';

class BtnTextStandart extends StatelessWidget {
  String text;
  Function onPressed;
  BtnTextStandart({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: TextButton(
        onPressed: () => onPressed(),
        child: Text(
          text,
          style: GoogleFonts.inter(
            color: CustomColors.secondaryColor,
          ),
        ),
      ),
    );
  }
}
