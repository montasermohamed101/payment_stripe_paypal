import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/presentation/views/payment/payment_widgets/payment_methods_list_view.dart';

import '../../../../../../core/widgets/custom_button_bloc_consumer.dart';


class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {

   bool credit = true;

  paymentToggle({required int index}){
    if(index == 0){
      credit = true;
    }else{
      credit = false;
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          PaymentMethodListView(
             paymentToggle:  paymentToggle,
          ),
          const SizedBox(
            height: 35,
          ),
          CustomButtonBlocConsumer(
            credit: credit,
          ),
        ],
      ),
    );
  }
}
