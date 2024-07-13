import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showCustomToast(
    {required String message,
    Color? backgroundColor,
    Color? textColor,
    Toast? toastLength,
    ToastGravity? position}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength ?? Toast.LENGTH_SHORT,
      gravity: position ?? ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor ?? Colors.blueGrey,
      textColor: textColor ?? Colors.white,
      fontSize: 16.0);
}
