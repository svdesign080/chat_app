import 'dart:io';

import 'package:flutter/material.dart';

import '../../../helper/value_notify.dart';
import '../../../utils/app_color.dart';
import '../../../utils/route_string.dart';

class PhotoPreviewScreen extends StatelessWidget {
  const PhotoPreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkPrimary,
      ),
      backgroundColor: AppColors.darkPrimary,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.bottomRight,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: Image.file(
                File(imagePath.value),
                fit: BoxFit.cover,
              ),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
                    onTap: (){
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
    );
  }
}
