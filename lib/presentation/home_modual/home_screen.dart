import 'package:chat_box/helper/value_notify.dart';
import 'package:chat_box/presentation/home_modual/message_screen_modual/message_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<Widget> screen = [
    //   MessageScreen(),
    //   CallScreen(),
    //   ContactScreen(),
    //   SettingScreen()
    // ];
    // Size size = MediaQuery.of(context).size;
    return const Scaffold(
      backgroundColor: AppColors.darkPrimary,
      // bottomNavigationBar: Container(
      //   color: AppColors.white,
      //   height: MediaQuery.of(context).padding.bottom + size.width * 0.18,
      //   padding: EdgeInsets.only(
      //       left: size.width * 0.05,
      //       right: size.width * 0.05,
      //       top: 8,
      //       bottom: MediaQuery.of(context).padding.bottom + 8),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       bottomContainer(
      //           index: 0,
      //           icon: AppImages.message,
      //           name: AppString.message,
      //           size: size),
      //       bottomContainer(
      //           index: 1,
      //           icon: AppImages.calls,
      //           name: AppString.calls,
      //           size: size),
      //       bottomContainer(
      //           index: 2,
      //           icon: AppImages.contact,
      //           name: AppString.contacts,
      //           size: size),
      //       bottomContainer(
      //           index: 3,
      //           icon: AppImages.setting,
      //           name: AppString.setting,
      //           size: size),
      //     ],
      //   ),
      // ),
      body: MessageScreen(),
      // ValueListenableBuilder(
      //     valueListenable: homeIndex,
      //     builder: (context, int indexs, _) {
      //       return screen[homeIndex.value];
      //     }),
    );
  }

  Widget bottomContainer(
      {required int index,
      required String icon,
      required String name,
      required Size size}) {
    return ValueListenableBuilder(
        valueListenable: homeIndex,
        builder: (context, int indexs, _) {
          return GestureDetector(
            onTap: () {
              homeIndex.value = index;
              debugPrint('${homeIndex.value}');
            },
            child: Column(
              children: [
                SvgPicture.asset(
                  icon,
                  color: homeIndex.value == index
                      ? AppColors.primary
                      : AppColors.black.withOpacity(0.5),
                ),
                const SizedBox(height: 5),
                Text(
                  name,
                  style: GoogleFonts.aBeeZee(
                      color: homeIndex.value == index
                          ? AppColors.primary
                          : AppColors.black.withOpacity(0.5),
                      fontWeight: homeIndex.value == index
                          ? FontWeight.w600
                          : FontWeight.w500,
                      fontSize: size.width * 0.04),
                ),
              ],
            ),
          );
        });
  }
}
