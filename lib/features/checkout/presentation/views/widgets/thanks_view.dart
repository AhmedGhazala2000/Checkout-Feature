import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'thanks_view_body.dart';

class ThanksView extends StatelessWidget {
  const ThanksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(context),
        body: const ThanksViewBody(),
      ),
    );
  }
}
