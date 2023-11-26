import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/thanks_you_view_body.dart';
import 'package:payment/core/widgets/custom_app_bar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(),
      body: Transform.translate(
        offset: Offset(0,-16),
          child: const ThankYouViewBody()),
    );
  }
}
