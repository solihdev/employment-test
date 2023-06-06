import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyUtils {
  static showSnackBar(BuildContext context, String? text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text ?? ""),
        backgroundColor: Colors.blue,
      ),
    );
  }

  static getMyToast({required String message}) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade300,
        textColor: Colors.black,
        fontSize: 16.0,
      );

  static showLoader(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // static Future<bool> onUrlOpen(LinkableElement link) async =>
  //     await launchUrl(Uri.parse(link.url));

  static Future<bool?> getUrlOpenFailToast() {
    return Fluttertoast.showToast(
      msg: "Can't open Url",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}
