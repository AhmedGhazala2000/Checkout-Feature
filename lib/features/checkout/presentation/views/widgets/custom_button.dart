import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key, this.onPressed, required this.text, this.isLoading = false})
      : super(key: key);
  final void Function()? onPressed;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed ?? () {},
      height: 60,
      minWidth: double.infinity,
      color: const Color(0xff34A853),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(
              text,
              style: AppStyles.styleMedium22(),
            ),
    );
  }
}
