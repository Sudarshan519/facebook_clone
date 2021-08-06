import 'package:facebook_clone/utils/styleUtil.dart';
import 'package:flutter/material.dart';

import 'colorUtil.dart';

class SnackbarUtil {
  static showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        content: Text(
          '$message',
          style: StyleUtil.white14,
        ),
        backgroundColor: ColorUtil.primaryColor,
      ),
    );
  }
}
