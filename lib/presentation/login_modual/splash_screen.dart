import 'package:chat_box/helper/navigation.dart';
import 'package:chat_box/utils/app_color.dart';
import 'package:chat_box/utils/route_string.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_images.dart';
import 'package:flutter_svg/svg.dart';

import 'second_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => pushToPage(screen: const SecondScreen(), context: context),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.logoSvg),
            const SizedBox(height: 15),
            Text(
              AppString.chatBox,
              style: GoogleFonts.aBeeZee(
                  fontSize: size.width * 0.09,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  color: AppColors.darkPrimary),
            )
          ],
        ),
      ),
    );
  }
}
