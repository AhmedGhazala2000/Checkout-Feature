import 'package:flutter/material.dart';

import 'custom_check_icon.dart';
import 'custom_dashed_divider.dart';
import 'thanks_view_body_content.dart';

class ThanksViewBody extends StatelessWidget {
  const ThanksViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
        bottom: height > 700 ? 40 : 30,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThanksViewBodyContent(),
          const CustomCheckIcon(),
          height > 750
              ? Positioned(
                  left: -20,
                  bottom: height * .2,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                )
              : const SizedBox(),
          height > 750
              ? Positioned(
                  right: -20,
                  bottom: height * .2,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                )
              : const SizedBox(),
          height > 750
              ? Positioned(
                  left: 25,
                  right: 25,
                  bottom: height * .2 + 20,
                  child: const CustomDashedDivider(),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
