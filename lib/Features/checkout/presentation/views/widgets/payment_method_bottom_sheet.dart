import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/payment_methods_list_view.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'custom_button_bloc_consumer.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16,),
          PaymentMethodListView(),
          const SizedBox(height: 35,),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}

