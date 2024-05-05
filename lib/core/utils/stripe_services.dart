import 'package:checkout_app/core/utils/api_services.dart';
import 'package:checkout_app/core/utils/secret_key.dart';
import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/data/models/payment_intent_model/PaymentIntentModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices {
  final ApiServices apiServices;

  const StripeServices({required this.apiServices});

  final String baseUrl = 'https://api.stripe.com';

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiServices.post(
      url: '$baseUrl/v1/payment_intents',
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Ahmed Ghazala',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
    );
    await displayPaymentSheet();
  }
}
