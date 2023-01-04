import 'package:chat_box/helper/navigation.dart';
import 'package:chat_box/presentation/home_modual/message_screen_modual/chat_screen.dart';
import 'package:chat_box/presentation/home_modual/popmenu_modual/account_screen.dart';
import 'package:chat_box/presentation/home_modual/popmenu_modual/contact_screen.dart';
import 'package:chat_box/presentation/home_modual/popmenu_modual/font_size.dart';
import 'package:chat_box/presentation/home_modual/popmenu_modual/group_make_screen.dart';
import 'package:chat_box/presentation/home_modual/popmenu_modual/wallpaper_screen.dart';
import 'package:chat_box/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_images.dart';
import '../../../utils/route_string.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

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
                    width: size.width * 0.05,
                  ),
                ),
                Text(
                  AppString.home,
                  style: GoogleFonts.aBeeZee(
                      color: AppColors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.05),
                ),
                PopupMenuButton(
                  offset: Offset(0, size.width * 0.13),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.width * 0.02)),
                  itemBuilder: (context) {
                    return [
                      popupMenuItem(
                          name: AppString.newGroup,
                          icon: AppImages.group,
                          onTap: () {
                            Navigator.pop(context);
                            pushToPage(
                                screen: const GroupMakeScreen(),
                                context: context);
                          },
                          size: size),
                      popupMenuItem(
                          name: AppString.contacts,
                          icon: AppImages.contact,
                          onTap: () {
                            Navigator.pop(context);
                            pushToPage(
                                screen: const ContactScreen(),
                                context: context);
                          },
                          size: size),
                      popupMenuItem(
                          name: AppString.account,
                          icon: AppImages.account,
                          onTap: () {
                            Navigator.pop(context);
                            pushToPage(
                                screen: const AccountScreen(),
                                context: context);
                          },
                          size: size),
                      popupMenuItem(
                          name: AppString.fontSize,
                          icon: AppImages.fontSize,
                          onTap: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  // backgroundColor: AppColors.primary.withOpacity(0.2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          size.width * 0.04),
                                    ),
                                    title: const FontSize());
                              },
                            );
                          },
                          size: size),
                      popupMenuItem(
                          name: AppString.wallpaper,
                          icon: AppImages.wallpaper,
                          onTap: () {
                            Navigator.pop(context);
                            pushToPage(
                                screen: const WallpaperScreen(),
                                context: context);
                          },
                          size: size),
                    ];
                  },
                  child: Container(
                    width: size.width * 0.13,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.white.withOpacity(0.5),
                      ),
                    ),
                    child: Icon(
                      Icons.more_vert_rounded,
                      color: AppColors.white,
                      size: size.width * 0.05,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: size.width * 0.22,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  storyContainer(
                      img: AppImages.img,
                      size: size,
                      name: 'Smit Vavadiya',
                      isMy: true),
                  ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return storyContainer(
                        img: AppImages.img,
                        size: size,
                        name: 'Smit Vavadiya',
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.width * 0.07),
                  topRight: Radius.circular(size.width * 0.07),
                ),
              ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      pushToPage(screen: const ChatScreen(), context: context);
                    },
                    child: msgContainer(size: size),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem popupMenuItem(
      {required String name,
      required String icon,
      required Function onTap,
      required Size size}) {
    return PopupMenuItem(
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: size.width * 0.06,
                color: AppColors.black.withOpacity(0.5),
              ),
              const SizedBox(width: 10),
              Text(
                name,
                style: GoogleFonts.aBeeZee(fontSize: size.width * 0.045),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget msgContainer({required Size size}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 10),
      child: Row(
        children: [
          Image.asset(
            AppImages.img,
            width: size.width * 0.13,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Vavadiya Smile",
                style: GoogleFonts.aBeeZee(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: size.width * 0.048),
              ),
              const SizedBox(height: 3),
              Text(
                "How are you today?",
                style: GoogleFonts.aBeeZee(
                    color: AppColors.black.withOpacity(0.35),
                    fontSize: size.width * 0.035),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "2 min ago",
                style: GoogleFonts.aBeeZee(
                    color: AppColors.black.withOpacity(0.7),
                    fontSize: size.width * 0.035),
              ),
              const SizedBox(height: 3),
              CircleAvatar(
                radius: size.width * 0.025,
                backgroundColor: AppColors.msg,
                child: Text(
                  '2',
                  style: GoogleFonts.aBeeZee(
                      color: AppColors.white,
                      fontSize: size.width * 0.035,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget storyContainer(
      {required String img,
      required Size size,
      required String name,
      bool isMy = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          width: size.width * 0.15,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    width: size.width * 0.22,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white, width: 1.3)),
                    child: Image.asset(
                      img,
                      width: size.width * 0.12,
                    ),
                  ),
                  isMy
                      ? CircleAvatar(
                          backgroundColor: AppColors.white,
                          radius: size.width * 0.02,
                          child: Icon(
                            Icons.add,
                            color: AppColors.black,
                            size: size.width * 0.04,
                          ),
                        )
                      : const SizedBox()
                ],
              ),
              const SizedBox(height: 8),
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.aBeeZee(
                    color: AppColors.white.withOpacity(0.8),
                    fontSize: size.width * 0.038),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
