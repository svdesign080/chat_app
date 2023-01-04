import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_images.dart';
import '../../../utils/route_string.dart';
import '../../widgets/spaces.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.darkPrimary,
      body: Column(
        children: [
          topSpace(context: context),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    AppImages.backArrow,
                    color: AppColors.white.withOpacity(0.8),
                    width: size.width * 0.06,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white.withOpacity(0.5),
                    ),
                  ),
                  child: SvgPicture.asset(
                    AppImages.edit,
                    color: AppColors.white.withOpacity(0.8),
                    width: size.width * 0.05,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            AppImages.img1,
            width: size.width * 0.2,
          ),
          const SizedBox(height: 12),
          Text(
            "Smile Vavadiya",
            style: TextStyle(
                fontSize: size.width * 0.055,
                fontWeight: FontWeight.w600,
                color: AppColors.white),
          ),
          const SizedBox(height: 3),
          Text(
            "smit@gmail.com",
            style: TextStyle(
                fontSize: size.width * 0.035,
                fontWeight: FontWeight.w500,
                color: AppColors.white.withOpacity(0.6)),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Container(
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.width * 0.07),
                  topRight: Radius.circular(size.width * 0.07),
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.05),
                    names(
                        name: " Smile Vavadiya",
                        title: AppString.displayName,
                        size: size),
                    names(
                        name: " smile@gmail.com",
                        title: AppString.emailAddress,
                        size: size),
                    names(
                        name: " Valak, surat, Gujarat, India.",
                        title: AppString.address,
                        size: size),
                    names(
                        name: " +91 8645791232",
                        title: AppString.phoneNumber,
                        size: size),
                    /* Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.mediaShare,
                          style: TextStyle(
                              fontSize: size.width * 0.04,
                              color: AppColors.black.withOpacity(0.6)),
                        ),
                        Text(
                          AppString.viewAll,
                          style: TextStyle(
                            fontSize: size.width * 0.04,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),*/
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget names(
      {required String name, required String title, required Size size}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: size.width * 0.04,
              color: AppColors.black.withOpacity(0.6)),
        ),
        SizedBox(height: size.height * 0.01),
        Text(
          name,
          style: TextStyle(
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.w500,
              color: AppColors.black),
        ),
        SizedBox(height: size.height * 0.05),
      ],
    );
  }
}
