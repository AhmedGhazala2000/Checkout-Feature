import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomPaid extends StatelessWidget {
  const CustomPaid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          FontAwesomeIcons.barcode,
          size: 70,
        ),
        Container(
          width: 115.w,
          height: 60.h,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side:  BorderSide(
                color: const Color(0xff34A853),
                width: 1.5.w,
              ),
            ),
          ),
          child: Center(
            child: Text(
              'PAID',
              style: AppStyles.styleSemiBold24
                  .copyWith(color: const Color(0xff34A853)),
            ),
          ),
        )
      ],
    );
  }
}
