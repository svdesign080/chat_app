import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:chat_box/helper/navigation.dart';
import 'package:chat_box/presentation/audio_screens/recorder_home_view.dart';
import 'package:chat_box/presentation/home_modual/camera_modual/camera_screen.dart';
import 'package:chat_box/utils/route_string.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../helper/value_notify.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_images.dart';
import '../../widgets/spaces.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FlutterSound? _flutterSound;
  final audioPlayer = AssetsAudioPlayer();

  FocusNode focusNode = FocusNode();
  TextEditingController msg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          topSpace(context: context),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 10),
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
                const SizedBox(width: 15),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.asset(
                      AppImages.img1,
                      width: size.width * 0.13,
                    ),
                    const CircleAvatar(
                      radius: 5,
                      backgroundColor: AppColors.green,
                    )
                  ],
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: size.width * 0.35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vavadiya Smile",
                        style: GoogleFonts.aBeeZee(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * 0.048),
                      ),
                      Text(
                        AppString.activeNow,
                        style: GoogleFonts.aBeeZee(
                            color: AppColors.black.withOpacity(0.35), fontSize: size.width * 0.035),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AppImages.call,
                    width: size.width * 0.07,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              alignment: Alignment.topRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Hello Smile',
                          style: GoogleFonts.aBeeZee(
                            fontSize: fontSize.value == AppString.small
                                ? size.width * 0.03
                                : fontSize.value == AppString.medium
                                    ? size.width * 0.038
                                    : size.width * 0.048,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '09:25 AM',
                    style: GoogleFonts.aBeeZee(
                      fontSize: size.width * 0.03,
                      color: AppColors.black.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 15),
            child: ValueListenableBuilder(
              valueListenable: msges,
              builder: (context, String massage, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        showModalBottomSheet(
                          // backgroundColor: AppColors.darkPrimary,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    AppString.select,
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  filePickerContainer(
                                      onTap: () async {
                                        final result = await FilePicker.platform.pickFiles(
                                          type: FileType.custom,
                                          allowedExtensions: ['jpg', 'jpeg', 'png'],
                                        ).then(
                                          (value) {
                                            focusNode.unfocus();
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                      icon: AppImages.image,
                                      name: AppString.photoOrVideo,
                                      size: size),
                                  filePickerContainer(
                                      onTap: () async {
                                        final result = await FilePicker.platform.pickFiles(
                                          type: FileType.custom,
                                          allowedExtensions: ['pdf', 'docs'],
                                        ).then(
                                          (value) => Navigator.pop(context),
                                        );
                                        // debugPrint('$result');
                                      },
                                      icon: AppImages.pdf,
                                      name: AppString.pdf,
                                      size: size)
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: SvgPicture.asset(
                        AppImages.link,
                        width: size.width * 0.07,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: msges.value == "" ? size.width * 0.58 : size.width * 0.67,
                      // height: size.width * 0.12,
                      child: TextFormField(
                        controller: msg,
                        keyboardType: TextInputType.text,
                        maxLines: 3,
                        minLines: 1,
                        textAlign: TextAlign.start,
                        cursorColor: AppColors.primary,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            hintStyle: TextStyle(color: Colors.grey[700]),
                            hintText: AppString.writeYourMsg,
                            fillColor: Colors.white70),
                        onChanged: (string) {
                          msges.value = string;
                        },
                      ),
                    ),
                    msges.value != ""
                        ? CircleAvatar(
                            radius: size.width * 0.06,
                            backgroundColor: AppColors.primary,
                            child: SvgPicture.asset(
                              AppImages.send,
                              width: size.width * 0.055,
                            ),
                          )
                        : Row(
                            children: [
                              SizedBox(width: size.width * 0.02),
                              GestureDetector(
                                onTap: () {
                                  pushToPage(screen: const CameraScreen(), context: context);
                                },
                                child: SvgPicture.asset(
                                  AppImages.cam,
                                  width: size.width * 0.07,
                                ),
                              ),
                              SizedBox(width: size.width * 0.05),
                              GestureDetector(
                                onTap: () {
                                  pushToPage(screen: const RecorderHomeView(title: 'title'), context: context);
                                },
                                child: SvgPicture.asset(
                                  AppImages.mic,
                                  width: size.width * 0.07,
                                ),
                              ),
                            ],
                          ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }

  Widget filePickerContainer(
      {required Function onTap, required String icon, required String name, required Size size}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.transparent,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              // color: AppColors.white,
              width: size.width * 0.08,
            ),
            const SizedBox(width: 10),
            Text(
              name,
              style:
                  GoogleFonts.aBeeZee(fontSize: size.width * 0.045, color: AppColors.black.withOpacity(0.6)),
            )
          ],
        ),
      ),
    );
  }
}
