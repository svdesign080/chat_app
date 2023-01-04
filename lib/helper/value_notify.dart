import 'package:chat_box/utils/route_string.dart';
import 'package:flutter/cupertino.dart';

ValueNotifier<int> homeIndex = ValueNotifier(0);

ValueNotifier<String> msges = ValueNotifier('');
ValueNotifier<String> fontSize = ValueNotifier(AppString.medium);
ValueNotifier<String> imagePath = ValueNotifier('');
ValueNotifier<String> videoPath = ValueNotifier('');
ValueNotifier<bool> isVideoRecord = ValueNotifier(false);
ValueNotifier<bool> videoStart = ValueNotifier(false);