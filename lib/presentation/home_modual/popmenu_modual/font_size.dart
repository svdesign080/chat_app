import 'package:chat_box/helper/value_notify.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_color.dart';
import '../../../utils/route_string.dart';

class FontSize extends StatelessWidget {
  const FontSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        row(title: AppString.small, onTap: () {}, size: size),
        row(title: AppString.medium, onTap: () {}, size: size),
        row(title: AppString.large, onTap: () {}, size: size),
      ],
    );
  }

  Widget row(
      {required String title, required Function onTap, required Size size}) {
    return ValueListenableBuilder(
      valueListenable: fontSize,
      builder: (context,_,__) {
        return InkWell(
          onTap: () {
            fontSize.value = title;
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Container(
                  width: size.width * 0.05,
                  height: size.width * 0.05,
                  decoration: BoxDecoration(
                    color: fontSize.value == title
                        ? AppColors.primary
                        : Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 2),
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  title,
                  style: GoogleFonts.aBeeZee(
                    color: AppColors.black.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                    fontSize: size.width * 0.045,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
