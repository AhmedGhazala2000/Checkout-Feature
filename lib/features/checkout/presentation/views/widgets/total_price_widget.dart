import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.styleSemiBold24,
        ),
        Text(
          value,
          style: AppStyles.styleSemiBold24,
        ),
      ],
    );
  }
}
