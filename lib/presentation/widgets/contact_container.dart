import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color.dart';

class ContactContainer extends StatelessWidget {
  final Size size;
  final String img;
  final String name;
  final String desc;

  const ContactContainer(
      {Key? key,
      required this.size,
      required this.img,
      required this.name,
      required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          img,
          width: size.width * 0.13,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: GoogleFonts.aBeeZee(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: size.width * 0.048),
            ),
            const SizedBox(height: 3),
            Text(
              desc,
              style: GoogleFonts.aBeeZee(
                  color: AppColors.black.withOpacity(0.35),
                  fontSize: size.width * 0.038),
            ),
          ],
        ),
      ],
    );
  }
}
