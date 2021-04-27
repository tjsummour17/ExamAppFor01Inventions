import 'dart:developer';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

enum ToastType { info, error, success }

void showLongToast(BuildContext context, String message, {ToastType toastType = ToastType.success}) {
  showFlash(
    context: context,
    persistent: true,
    duration: const Duration(milliseconds: 2600),
    builder: (_, controller) {
      return Flash(
        controller: controller,
        margin: EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(15.0),
        borderColor: Colors.transparent,
        boxShadows: kElevationToShadow[8],
        backgroundGradient: LinearGradient(
          colors: [Colors.black54, Colors.black87],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        onTap: () => controller.dismiss(),
        forwardAnimationCurve: Curves.easeInCirc,
        reverseAnimationCurve: Curves.bounceIn,
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.white),
          child: FlashBar(
              message: Text(message),
              leftBarIndicatorColor: toastType == ToastType.success
                  ? Colors.green
                  : toastType == ToastType.error
                      ? Colors.red
                      : Colors.amberAccent,
              icon: Icon(toastType == ToastType.success ? Icons.check_circle : Icons.info,
                  color: toastType == ToastType.success
                      ? Colors.green
                      : toastType == ToastType.error
                          ? Colors.red
                          : Colors.amberAccent)),
        ),
      );
    },
  ).then((_) {
    if (_ != null) {
      log(_.toString());
    }
  });
}
