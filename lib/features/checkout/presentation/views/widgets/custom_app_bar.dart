import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AppBar customAppBar(BuildContext context, [String? title]) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        FontAwesomeIcons.arrowLeftLong,
        size: 26,
        color: Colors.black,
      ),
    ),
    title: Text(
      title ?? '',
      style: AppStyles.styleMedium25.copyWith(color: Colors.black),
    ),
  );
}
