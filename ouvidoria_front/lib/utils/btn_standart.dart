import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ouvidoria_front/utils/colors.dart';

class BtnStandart extends StatelessWidget {
  String text;
  Function onPressed;
  Color color;
  BtnStandart({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = CustomColors.secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.resolveWith<Size?>(
            (Set<MaterialState> states) {
              if (MediaQuery.of(context).size.width < 500) {
                return const Size(128, 56);
              }
              return const Size(240, 56);
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return color.withAlpha(125);
              }
              if (states.contains(MaterialState.selected)) {
                return color.withAlpha(200);
              }
              return color;
            },
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            color: CustomColors.whiteStandard,
          ),
        ),
      ),
    );
  }
}
