import 'package:flutter/material.dart';

import 'custom_button_bloc_consumer.dart';
import 'payment_methods.dart';

class BuildModalBottomSheet extends StatelessWidget {
  const BuildModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethods(),
          SizedBox(height: 16),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}
