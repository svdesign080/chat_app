import 'package:chat_box/presentation/login_modual/signup_screen.dart';
import 'package:chat_box/presentation/widgets/or_divider.dart';
import 'package:chat_box/utils/app_color.dart';
import 'package:chat_box/utils/app_images.dart';
import 'package:chat_box/utils/route_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper/navigation.dart';
import '../widgets/custom_btn.dart';
import 'login_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.background,
            fit: BoxFit.fill,
            width: size.width,
            height: size.height,
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top + 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppImages.logoSvg,
                        color: AppColors.white,
                        width: size.width * 0.05,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        AppString.chatBox,
                        style: GoogleFonts.aBeeZee(
                            color: AppColors.white,
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.04),
                  Text(
                    AppString.connectFriendsEasily,
                    style: GoogleFonts.aBeeZee(
                        color: AppColors.white,
                        fontSize: size.width * 0.15,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    AppString.easilyNQuickly,
                    style: GoogleFonts.aBeeZee(
                        color: AppColors.white,
                        fontSize: size.width * 0.15,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: size.height * 0.035,
                  ),
                  Text(
                    AppString.ourChatApp,
                    style: GoogleFonts.aBeeZee(
                        color: AppColors.white.withOpacity(0.8),
                        fontSize: size.width * 0.04),
                  ),
                  SizedBox(
                    height: size.height * 0.055,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(vertical: size.height * 0.023),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.04),
                      border: Border.all(color: AppColors.white),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppImages.google),
                        const SizedBox(width: 10),
                        Text(
                          AppString.signUpWithGoogle,
                          style: GoogleFonts.aBeeZee(
                              color: AppColors.white.withOpacity(0.8),
                              fontSize: size.width * 0.045),
                        ),
                      ],
                    ),
                  ),
                  const OrDivider(color: AppColors.white),
                  CustomBtn(
                    size: size,
                    name: AppString.signUpWithMail,
                    onTap: () {
                      pushToPage(
                          screen: const SignupScreen(), context: context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.width * 0.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppString.existingAccount,
                          style: GoogleFonts.aBeeZee(
                              color: AppColors.white.withOpacity(0.7),
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * 0.04),
                        ),
                        GestureDetector(
                          onTap: () {
                            pushToPage(
                                screen: const LoginScreen(), context: context);
                          },
                          child: Text(
                            AppString.login,
                            style: GoogleFonts.aBeeZee(
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.045),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
