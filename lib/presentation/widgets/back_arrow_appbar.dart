import 'package:chat_box/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_images.dart';

class BackArrowAppbar extends StatelessWidget {
  const BackArrowAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topLeft,
      padding:
          EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 22),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          color: Colors.transparent,
          child: SvgPicture.asset(
            AppImages.backArrow,
            width: size.width * 0.06,
          ),
        ),
      ),
    );
  }
}
