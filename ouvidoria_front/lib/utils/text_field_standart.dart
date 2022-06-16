import 'package:flutter/material.dart';

import 'package:ouvidoria_front/utils/colors.dart';

class TextFieldStandart extends StatelessWidget {
  String? hintText;
  int? maxLength;
  int? maxLines;

  TextFieldStandart({
    Key? key,
    this.hintText,
    this.maxLength,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hintText,
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
          )),
    );
  }
}
