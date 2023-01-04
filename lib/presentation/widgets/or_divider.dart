import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color.dart';
import '../../utils/route_string.dart';

class OrDivider extends StatelessWidget {
  final Color color;
  final double? vertPad;

  const OrDivider({Key? key, required this.color, this.vertPad})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertPad ?? size.width * 0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: color.withOpacity(0.4),
            height: 1,
            width: size.width * 0.37,
          ),
          Text(
            AppString.or,
            style: GoogleFonts.aBeeZee(
                color: color.withOpacity(0.6), fontSize: size.width * 0.04),
          ),
          Container(
            color: color.withOpacity(0.4),
            height: 1,
            width: size.width * 0.37,
          ),
        ],
      ),
    );
  }
}
