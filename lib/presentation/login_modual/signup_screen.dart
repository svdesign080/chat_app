import 'package:chat_box/helper/navigation.dart';
import 'package:chat_box/presentation/home_modual/home_screen.dart';
import 'package:chat_box/presentation/home_modual/message_screen_modual/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../../utils/route_string.dart';
import '../widgets/back_arrow_appbar.dart';
import '../widgets/custom_btn.dart';
import '../widgets/named_textfield.dart';
import '../widgets/or_divider.dart';
import '../widgets/spaces.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController name = TextEditingController();

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
                      AppString.signUpWithMail,
                      style: GoogleFonts.aBeeZee(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      textAlign: TextAlign.center,
                      AppString.getStarted,
                      style: GoogleFonts.aBeeZee(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black.withOpacity(0.35)),
                    ),
                    SizedBox(height: size.height * 0.07),
                    NamedTextField(
                        size: size, controller: name, name: AppString.yourName),
                    NamedTextField(
                        size: size,
                        controller: email,
                        name: AppString.yourEmail,
                        keyboardType: TextInputType.emailAddress),
                    NamedTextField(
                        size: size,
                        controller: password,
                        name: AppString.password),
                    NamedTextField(
                        size: size,
                        controller: confirmPassword,
                        name: AppString.confirmPassword),
                    const SizedBox(height: 20),
                    CustomBtn(
                      size: size,
                      onTap: () {
                        pushToPage(
                            screen: const MessageScreen(), context: context);
                      },
                      name: AppString.createAnAccount,
                      btnColor: AppColors.primary,
                      textColor: AppColors.white,
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
