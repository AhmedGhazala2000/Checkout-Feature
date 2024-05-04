import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.only(top: 9),
          child: SvgPicture.asset('assets/images/logo.svg'),
        ),
        title: Text(
          'Credit Card',
          style: AppStyles.styleRegular18(),
        ),
        subtitle: Text(
          'Mastercard **78',
          style: AppStyles.styleRegular16(),
        ),
      ),
    );
  }
}
