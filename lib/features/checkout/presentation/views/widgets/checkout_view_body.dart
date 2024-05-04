import 'package:flutter/material.dart';
import 'build_modal_bottom_sheet.dart';
import 'custom_button.dart';
import 'order_info_list_view.dart';
import 'total_price_widget.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Image.asset('assets/images/OrdersImage.png'),
                  ),
                ),
                const OrderInfoListView(),
                const Divider(
                  color: Color(0xffC7C7C7),
                  height: 35,
                  thickness: 1.4,
                  indent: 15,
                  endIndent: 15,
                ),
                const TotalPrice(
                  title: 'Total',
                  value: r'$50.97',
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: 'Complete Payment',
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const PaymentDetailsView(),
                    //   ),
                    // );
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      context: context,
                      builder: (context) {
                        return const BuildModalBottomSheet();
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}