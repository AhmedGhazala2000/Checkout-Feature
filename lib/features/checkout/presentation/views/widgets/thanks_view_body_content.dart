import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/total_price_widget.dart';
import 'package:flutter/material.dart';
import 'custom_list_tile.dart';
import 'custom_paid.dart';
import 'thanks_info_list_view.dart';

class ThanksViewBodyContent extends StatelessWidget {
  const ThanksViewBodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffEDEDED),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(height: height > 700 ? 65 : 40),
          Text(
            'Thank you!',
            style: AppStyles.styleMedium25(),
          ),
          const SizedBox(height: 2),
          Opacity(
            opacity: .8,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Your transaction was successful',
                style: AppStyles.styleRegular20(),
              ),
            ),
          ),
          const SizedBox(height: 22),
          const ThanksInfoListView(),
          const SizedBox(height: 6),
          const Divider(
            height: 48,
            color: Color(0xffC7C7C7),
            thickness: 2,
          ),
          const TotalPrice(title: 'Total', value: r'$50.97'),
          const SizedBox(height: 30),
          const CustomListTile(),
          const Spacer(),
          const CustomPaid(),
          SizedBox(
            height: height > 700 ? (height * .2 / 2) - 30 : 10,
          ),
        ],
      ),
    );
  }
}
