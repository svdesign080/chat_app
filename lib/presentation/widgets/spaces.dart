import 'package:flutter/material.dart';

Widget topSpace({required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
  );
}

Widget bottomSpace({required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.bottom + 15),
  );
}
