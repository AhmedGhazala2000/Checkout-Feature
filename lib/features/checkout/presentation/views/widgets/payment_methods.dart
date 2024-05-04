import 'package:checkout_app/features/checkout/presentation/views/widgets/payment_method_widget.dart';
import 'package:flutter/material.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  List<String> images = [
    'assets/images/CardImage.svg',
    'assets/images/PayPalImage.svg',
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: images.asMap().entries.map(
          (e) {
            int index = e.key;
            String value = e.value;
            return GestureDetector(
              onTap: () {
                currentIndex = index;
                setState(() {});
              },
              child: PaymentMethodWidget(
                assetImage: value,
                isSelected: currentIndex == index,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
