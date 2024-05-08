import 'package:checkout_app/core/utils/api_services.dart';
import 'package:checkout_app/core/utils/stripe_services.dart';
import 'package:checkout_app/features/checkout/data/repos/stripe_checkout_repo_impl.dart';
import 'package:checkout_app/features/checkout/presentation/manager/payment_stripe_cubit/payment_stripe_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return BlocProvider(
                            create: (context) => PaymentStripeCubit(
                                  StripeCheckoutRepoImpl(
                                    stripeServices: StripeServices(
                                      apiServices: ApiServices(
                                        dio: Dio(),
                                      ),
                                    ),
                                  ),
                                ),
                            child: const BuildModalBottomSheet());
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
