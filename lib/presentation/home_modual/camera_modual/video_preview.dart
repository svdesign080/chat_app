import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../helper/value_notify.dart';
import '../../../utils/app_color.dart';
import '../../../utils/route_string.dart';

class VideoPreviewScreen extends StatefulWidget {
  const VideoPreviewScreen({Key? key}) : super(key: key);

  @override
  State<VideoPreviewScreen> createState() => _VideoPreviewScreenState();
}

class _VideoPreviewScreenState extends State<VideoPreviewScreen> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.file(File(videoPath.value))
      ..initialize().then((value) {
        setState(() {});
      });
    _controller!.addListener(() {
      if (_controller!.value.isPlaying) {
        videoStart.value = true;
      } else {
        videoStart.value = false;
      }
    });
    debugPrint('done');
    super.initState();

    // _controller!.addListener(() {
    //   setState(() {});
    // });
    // _controller!.setLooping(true);
    // _controller!.initialize().then((_) => setState(() {}));
    // _controller!.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    videoStart.value = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkPrimary,
      ),
      backgroundColor: AppColors.darkPrimary,
      body: WillPopScope(
        onWillPop: () {
          videoStart.value = false;
          Navigator.pop(context);
          return Future(() => false);
        },
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: Alignment.bottomRight,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: size.width,
                    height: size.height,
                    child: _controller!.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _controller!.value.aspectRatio,
                            child: VideoPlayer(_controller!),
                          )
                        : const Center(child: CircularProgressIndicator()),
                  ),
                  GestureDetector(
                    onTap: () {
                      videoStart.value = !videoStart.value;
                      if (videoStart.value) {
                        _controller!.play();
                      } else {
                        // _controller.dataSource
                        _controller!.pause();
                      }
                    },
                    child: ValueListenableBuilder(
                        valueListenable: videoStart,
                        builder: (context, _, __) {
                          return CircleAvatar(
                            radius: size.width * 0.08,
                            backgroundColor: AppColors.black.withOpacity(0.2),
                            child: Icon(
                              videoStart.value ? Icons.pause : Icons.play_arrow,
                              color: AppColors.white,
                              size: size.width * 0.09,
                            ),
                          );
                        }),
                  )
                ],
              ),
              Container(
                color: AppColors.darkPrimary,
                // margin: const EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04, vertical: 10),
                // height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: size.width * 0.75,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            isDense: true,
                            hintStyle: TextStyle(color: AppColors.white),
                            hintText: AppString.writeYourMsg,
                            fillColor: Colors.white70),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        videoStart.value = false;
                        isVideoRecord.value = false;
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: size.width * 0.06,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.check,
                          size: size.width * 0.06,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
