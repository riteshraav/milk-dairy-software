import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG, // Toast.LENGTH_LONG for a longer duration
      gravity: ToastGravity.SNACKBAR,   // Can be TOP, BOTTOM, or CENTER
      timeInSecForIosWeb: 5,          // For iOS & Web
      backgroundColor: Colors.black,  // Background color of the toast
      textColor: Colors.white,        // Text color of the toast
      fontSize: 16.0                  // Font size of the text
  );
}