import 'package:chat_box/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_images.dart';
import '../../../utils/route_string.dart';

class WallpaperScreen extends StatelessWidget {
  const WallpaperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          children: [
            topSpace(context: context),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: size.width * 0.1,
                      width: size.width * 0.06,
                      color: Colors.transparent,
                      child: SvgPicture.asset(
                        AppImages.backArrow,
                        width: size.width * 0.05,
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.22),
                  Text(
                    AppString.themeWallpaper,
                    style: GoogleFonts.aBeeZee(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          width: size.width * 0.75,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.primary),
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(size.width * 0.02)),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.2),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(size.width * 0.02),
                                    topRight: Radius.circular(size.width * 0.02),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.05, vertical: 10),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: size.width * 0.05,
                                        backgroundColor: AppColors.primary,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        AppString.userName,
                                        style: GoogleFonts.aBeeZee(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * 0.048),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                color: AppColors.white,
                                height: size.height * 0.5,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(10),
                                          height: 35,
                                          width: size.width * 0.25,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: AppColors.primary.withOpacity(0.6),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(10),
                                          height: 70,
                                          width: size.width * 0.5,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: AppColors.primary.withOpacity(0.6),
                                            borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.2),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(size.width * 0.02),
                                    bottomLeft: Radius.circular(size.width * 0.02),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(
                                      AppImages.link,
                                      width: size.width * 0.065,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 15),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: size.width * 0.417,
                                      // height: size.width * 0.12,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(width: size.width * 0.02),
                                        SvgPicture.asset(
                                          AppImages.cam,
                                          width: size.width * 0.065,
                                        ),
                                        SizedBox(width: size.width * 0.05),
                                        SvgPicture.asset(
                                          AppImages.mic,
                                          width: size.width * 0.065,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Text(
                            AppString.change,
                            style: GoogleFonts.aBeeZee(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkPrimary,
                            ),
                          ),
                          Container(
                            color: AppColors.darkPrimary,
                            width: size.width * 0.18,
                            height: 1.5,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
