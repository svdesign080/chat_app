import 'package:chat_box/helper/demo_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_images.dart';
import '../../../utils/route_string.dart';
import '../../widgets/spaces.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

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
                Text(
                  AppString.contacts,
                  style: GoogleFonts.aBeeZee(
                      color: AppColors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.05),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white.withOpacity(0.5),
                    ),
                  ),
                  child: SvgPicture.asset(
                    AppImages.search,
                    color: AppColors.white.withOpacity(0.8),
                    width: size.width * 0.06,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.width * 0.07),
                  topRight: Radius.circular(size.width * 0.07),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    AppString.myContact,
                    style: GoogleFonts.aBeeZee(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black.withOpacity(0.4)),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: demoContact.length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              children: [
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Image.asset(
                                      demoContact[index].image,
                                      width: size.width * 0.13,
                                    ),
                                    demoContact[index].isSelect
                                        ? Container(
                                            width: size.width * 0.04,
                                            height: size.width * 0.04,
                                            decoration: const BoxDecoration(
                                              color: Colors.green,
                                              shape: BoxShape.circle,
                                            ),
                                            // radius: size.width * 0.02,
                                            child: Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: size.width * 0.04,
                                            ),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      demoContact[index].name,
                                      style: TextStyle(
                                          fontSize: size.width * 0.048,
                                          color: AppColors.black),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      demoContact[index].desc!,
                                      style: TextStyle(
                                          fontSize: size.width * 0.038,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.black
                                              .withOpacity(0.35)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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
