import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle styleMedium25() {
    return const TextStyle(fontSize: 25, fontWeight: FontWeight.w500);
  }

  static TextStyle styleRegular16() {
    return const TextStyle(fontSize: 16, fontWeight: FontWeight.normal);
  }

  static TextStyle styleRegular18() {
    return const TextStyle(fontSize: 18, fontWeight: FontWeight.normal);
  }

  static TextStyle styleRegular20() {
    return const TextStyle(fontSize: 20, fontWeight: FontWeight.normal);
  }

  static TextStyle styleSemiBold24() {
    return const TextStyle(fontSize: 24, fontWeight: FontWeight.w600);
  }

  static TextStyle styleMedium22() {
    return const TextStyle(fontSize: 22, fontWeight: FontWeight.w500);
  }

  static TextStyle styleSemiBold18() {
    return const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  }
}
