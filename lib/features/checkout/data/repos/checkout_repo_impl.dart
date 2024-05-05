import 'dart:developer';

import 'package:checkout_app/core/errors/failures.dart';
import 'package:checkout_app/core/utils/stripe_services.dart';

import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeServices stripeServices;

  CheckoutRepoImpl({required this.stripeServices});

  @override
  Future<Either<Failures, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeServices.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return right(null);
    } on DioException catch (e) {
      log(ServerFailure.fromDioException(dioException: e).toString());
      return left(ServerFailure.fromDioException(dioException: e));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
