import 'package:checkout_app/core/utils/secret_key.dart';
import 'package:checkout_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'core/utils/simple_bloc_observers.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  Bloc.observer = SimpleBlocObservers();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const CheckoutApp(),
    ),
  );
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Inter",
      ),
      debugShowCheckedModeBanner: false,
      home: const CheckoutView(),
    );
  }
}
