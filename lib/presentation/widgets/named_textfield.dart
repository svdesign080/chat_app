import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color.dart';
import '../../utils/route_string.dart';

class NamedTextField extends StatelessWidget {
  final Size size;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String name;

  const NamedTextField(
      {Key? key,
      required this.size,
      required this.controller,
      this.keyboardType,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.center,
          name,
          style: GoogleFonts.aBeeZee(
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
        TextFormField(
          keyboardType: keyboardType ?? TextInputType.name,
          controller: controller,
        ),
        SizedBox(height: size.height * 0.05)
      ],
    );
  }
}
