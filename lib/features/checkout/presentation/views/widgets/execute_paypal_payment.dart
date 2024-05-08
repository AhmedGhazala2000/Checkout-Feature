import 'dart:developer';

import 'package:checkout_app/core/functions/show_snack_bar.dart';
import 'package:checkout_app/core/utils/secret_key.dart';
import 'package:checkout_app/features/checkout/data/models/paypal_transaction_model/amount.dart';
import 'package:checkout_app/features/checkout/data/models/paypal_transaction_model/details.dart';
import 'package:checkout_app/features/checkout/data/models/paypal_transaction_model/items.dart';
import 'package:checkout_app/features/checkout/data/models/paypal_transaction_model/orders_list.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/thanks_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

void executePaypalPayment(BuildContext context) {
  var transactionData = getTransactionData();
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: PaypalKeys.clientId,
        secretKey: PaypalKeys.secretKey,
        transactions: [
          {
            "amount": transactionData.amount,
            "description": "The payment transaction description.",
            "item_list": transactionData.orders.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const ThanksView();
          }));
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
          showSnackBar(context, error.toString());
        },
        onCancel: () {
          log('cancelled:');
          Navigator.pop(context);
          showSnackBar(context, 'cancelled');
        },
      ),
    ),
  );
}

({AmountModel amount, OrdersListModel orders}) getTransactionData() {
  // var details = Details(subtotal: '0', shipping: '100', shippingDiscount: 0);
  //var amount = AmountModel(total: "100", currency: "USD", details: details);

  List<Items> items = [
    Items(
      name: "Apple",
      quantity: 4,
      price: '10',
      currency: "USD",
    ),
    Items(
      name: "Pineapple",
      quantity: 5,
      price: '12',
      currency: "USD",
    ),
  ];
  double subtotal = items.fold(
    0,
    (sum, item) => sum + (item.quantity! * double.parse(item.price!)),
  );

  var details = Details(
      subtotal: subtotal.toString(), shipping: '100', shippingDiscount: 0);
  var amount = AmountModel(
      total: (subtotal + 100).toString(), currency: "USD", details: details);
  var ordersList = OrdersListModel(items: items);
  return (amount: amount, orders: ordersList);
}
