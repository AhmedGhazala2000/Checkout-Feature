import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDashedDivider extends StatelessWidget {
  const CustomDashedDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        30,
        (index) => Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: 2.h,
            color: const Color(0xffB8B8B8),
          ),
        ),
      ),
    );
  }
}
