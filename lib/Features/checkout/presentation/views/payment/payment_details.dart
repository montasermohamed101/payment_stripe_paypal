import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/presentation/views/payment/payment_widgets/payment_details_view_body.dart';

import '../../../../../core/widgets/custom_app_bar.dart';

class PaymentDetailsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Payment Details"),
      body: PaymentDetailsViewBody(),
    );
  }
}
