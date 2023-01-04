import 'package:chat_box/presentation/widgets/contact_container.dart';
import 'package:chat_box/presentation/widgets/custom_btn.dart';
import 'package:chat_box/presentation/widgets/spaces.dart';
import 'package:chat_box/utils/app_color.dart';
import 'package:chat_box/utils/route_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helper/demo_data.dart';
import '../../../utils/app_images.dart';

class GroupMakeScreen extends StatefulWidget {
  const GroupMakeScreen({Key? key}) : super(key: key);

  @override
  State<GroupMakeScreen> createState() => _GroupMakeScreenState();
}

class _GroupMakeScreenState extends State<GroupMakeScreen> {
  List<ContactModel> groupList = [];
  List<ContactModel> contacts = [];

  @override
  void initState() {
    debugPrint('smile');
    contacts.clear();
    debugPrint('${demoContact.length}');
    for (int i = 0; i < demoContact.length; i++) {
      contacts.add(demoContact[i]);
      contacts[i].isSelect = false;
    }
    // debugPrint('$contacts');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 10),
        child: Column(
          children: [
            topSpace(context: context),
            Row(
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
                SizedBox(width: size.width * 0.25),
                Text(
                  AppString.createGroup,
                  style: GoogleFonts.aBeeZee(
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      AppString.groupDescription,
                      style: GoogleFonts.aBeeZee(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black.withOpacity(0.4)),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      AppString.makeGroupForTeam,
                      style: GoogleFonts.aBeeZee(
                        fontSize: size.width * 0.12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      AppString.groupAdmin,
                      style: GoogleFonts.aBeeZee(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black.withOpacity(0.4)),
                    ),
                    const SizedBox(height: 15),
                    ContactContainer(
                        size: size,
                        img: AppImages.img1,
                        name: "Vavadiya Smile",
                        desc: AppString.groupAdmin),
                    const SizedBox(height: 30),
                    Text(
                      AppString.invitedMember,
                      style: GoogleFonts.aBeeZee(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black.withOpacity(0.4)),
                    ),
                    const SizedBox(height: 15),
                    groupList.isNotEmpty
                        ? SizedBox(
                            width: size.width,
                            height: size.width * 0.15,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.zero,
                              itemCount: groupList.length,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            contacts[groupList[index].index!]
                                                .isSelect = false;
                                            groupList.removeAt(index);
                                          });
                                        },
                                        child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            Image.asset(
                                              groupList[index].image,
                                              width: size.width * 0.131,
                                            ),
                                            CircleAvatar(
                                              radius: size.width * 0.023,
                                              backgroundColor: AppColors.black
                                                  .withOpacity(0.5),
                                              child: Icon(
                                                Icons.clear,
                                                size: size.width * 0.035,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: Text(
                              AppString.noMemberSelectedYet,
                              style: GoogleFonts.aBeeZee(
                                fontSize: size.width * 0.04,
                              ),
                            ),
                          ),
                    const SizedBox(height: 20),
                    Text(
                      AppString.myContact,
                      style: GoogleFonts.aBeeZee(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black.withOpacity(0.4)),
                    ),
                    const SizedBox(height: 5),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: contacts.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (!contacts[index].isSelect) {
                                contacts[index].isSelect = true;
                                setState(() {
                                  groupList.add(ContactModel(
                                      image: contacts[index].image,
                                      index: index,
                                      name: contacts[index].name,
                                      desc: contacts[index].desc));
                                  contacts[index].index = index;
                                });
                              }
                            });
                            debugPrint('$groupList');
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              children: [
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Image.asset(
                                      contacts[index].image,
                                      width: size.width * 0.13,
                                    ),
                                    contacts[index].isSelect
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
                                      contacts[index].name,
                                      style: TextStyle(
                                          fontSize: size.width * 0.048,
                                          color: AppColors.black),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      contacts[index].desc!,
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
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomBtn(
              size: size,
              onTap: () {
                Navigator.pop(context);
              },
              name: AppString.create,
              btnColor: AppColors.primary,
              textColor: AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}
