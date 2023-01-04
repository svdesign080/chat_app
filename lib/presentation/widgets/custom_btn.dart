import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color.dart';

class CustomBtn extends StatelessWidget {
  final Size size;
  final Function onTap;
  final String name;
  final Color? btnColor;
  final Color? textColor;

  const CustomBtn(
      {Key? key,
      required this.size,
      required this.onTap,
      required this.name,
      this.btnColor,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: size.height * 0.025),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.04),
            color: btnColor ?? AppColors.white),
        child: Text(
          name,
          style: GoogleFonts.aBeeZee(
              fontSize: size.width * 0.042,
              fontWeight: FontWeight.w600,
              color: textColor ?? AppColors.black),
        ),
      ),
    );
  }
}
