import 'package:chat_box/presentation/home_modual/camera_modual/photo_preview_screen.dart';
import 'package:chat_box/presentation/home_modual/camera_modual/video_preview.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';
import '../../../helper/navigation.dart';
import '../../../helper/value_notify.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_images.dart';

List<CameraDescription>? camera;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? controller;

  Future<void>? cameraValue;
  bool isFlash = false;

  @override
  void initState() {
    controller = CameraController(camera![0], ResolutionPreset.high);
    cameraValue = controller!.initialize();
    controller!.setFlashMode(FlashMode.off);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();

    videoStart.value = false;
    isVideoRecord.value = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.darkPrimary,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Stack(
              // alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: size.height * 0.963,
                  child: FutureBuilder(
                    future: cameraValue,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return CameraPreview(controller!);
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(size.width * 0.05),
                    height: size.width * 0.1,
                    width: size.width * 0.06,
                    color: Colors.transparent,
                    child: SvgPicture.asset(
                      AppImages.backArrow,
                      color: AppColors.white,
                      width: size.width * 0.05,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  // alignment: Alignment.bottomRight,
                  child: Container(
                    color: AppColors.darkPrimary,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isFlash = !isFlash;
                            });
                            isFlash
                                ? controller!.setFlashMode(FlashMode.torch)
                                : controller!.setFlashMode(FlashMode.off);
                          },
                          child: Icon(
                            isFlash ? Icons.flash_on : Icons.flash_off,
                            color: AppColors.white,
                            size: size.width * 0.08,
                          ),
                        ),
                        ValueListenableBuilder(
                            valueListenable: isVideoRecord,
                            builder: (context, _, __) {
                              return InkWell(
                                onLongPress: () {
                                  videoStart.value = true;
                                  isVideoRecord.value = true;
                                  if (isVideoRecord.value) {
                                    controller!.startVideoRecording();
                                  } else {
                                    isVideoRecord.value = false;
                                    controller!.stopVideoRecording();
                                  }
                                },
                                onTap: () async {
                                  if (!videoStart.value) {
                                    debugPrint('image');
                                    isFlash
                                        ? controller!
                                            .setFlashMode(FlashMode.torch)
                                        : controller!
                                            .setFlashMode(FlashMode.off);
                                    final image =
                                        await controller!.takePicture();
                                    imagePath.value = image.path;
                                    debugPrint(image.path);
                                    setState(() {
                                      controller!.setFlashMode(FlashMode.off);
                                    });
                                    pushToPage(
                                        context: context,
                                        screen: const PhotoPreviewScreen());
                                  } else {
                                    final video =
                                        await controller!.stopVideoRecording();
                                    debugPrint(' === video  ==== $video');
                                    videoPath.value = video.path;
                                    debugPrint(video.path);
                                    setState(() {
                                      controller!.setFlashMode(FlashMode.off);
                                    });
                                    pushToPage(
                                        context: context,
                                        screen: const VideoPreviewScreen());
                                    isVideoRecord.value = false;
                                    videoStart.value = false;
                                  }
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Icon(
                                      Icons.panorama_fish_eye,
                                      color: AppColors.white,
                                      size: size.width * 0.18,
                                    ),
                                    videoStart.value
                                        ? Container(
                                            height: size.width * 0.07,
                                            width: size.width * 0.07,
                                            color: Colors.red,
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              );
                            }),
                        InkWell(
                          onTap: () {
                            // controller!.;
                          },
                          child: Icon(
                            Icons.flip_camera_ios,
                            color: AppColors.white,
                            size: size.width * 0.08,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
