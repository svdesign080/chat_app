import 'package:chat_box/helper/navigation.dart';
import 'package:chat_box/presentation/home_modual/message_screen_modual/message_screen.dart';
import 'package:chat_box/presentation/widgets/back_arrow_appbar.dart';
import 'package:chat_box/presentation/widgets/custom_btn.dart';
import 'package:chat_box/presentation/widgets/named_textfield.dart';
import 'package:chat_box/utils/app_color.dart';
import 'package:chat_box/utils/route_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_images.dart';
import '../widgets/or_divider.dart';
import '../widgets/spaces.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          topSpace(context: context),
          const BackArrowAppbar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.06),
                    Text(
                      AppString.loginToChatBox,
                      style: GoogleFonts.aBeeZee(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      textAlign: TextAlign.center,
                      AppString.welcomeBack,
                      style: GoogleFonts.aBeeZee(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black.withOpacity(0.35)),
                    ),
                    SizedBox(height: size.height * 0.05),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.black.withOpacity(0.7),
                        ),
                      ),
                      child: SvgPicture.asset(AppImages.google),
                    ),
                    OrDivider(
                        color: AppColors.black.withOpacity(0.1),
                        vertPad: size.height * 0.05),
                    NamedTextField(
                        size: size,
                        controller: email,
                        name: AppString.yourEmail),
                    NamedTextField(
                        size: size,
                        controller: password,
                        name: AppString.password),
                    const SizedBox(height: 20),
                    CustomBtn(
                      size: size,
                      onTap: () {
                        pushToPage(
                            screen: const MessageScreen(), context: context);
                      },
                      name: AppString.login,
                      btnColor: AppColors.primary,
                      textColor: AppColors.white,
                    ),
                    const SizedBox(height: 18),
                    Text(
                      textAlign: TextAlign.center,
                      AppString.forgetPass,
                      style: GoogleFonts.aBeeZee(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary),
                    ),
                    bottomSpace(context: context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
