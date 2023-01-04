import 'package:flutter/material.dart';

pushToPage({required Widget screen, required BuildContext context}) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ));
}
