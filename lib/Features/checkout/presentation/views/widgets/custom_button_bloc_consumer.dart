import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/Features/checkout/presentation/manager/payment_cubit.dart';
import 'package:payment/Features/checkout/presentation/views/thanks_you_view.dart';

import '../../../../../core/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const ThankYouView()));
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
                    amount: "100",
                    currency: "USD",
                    customerId: "cus_P4fF5pTS3liroi");
            BlocProvider.of<PaymentCubit>(context)
                .makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          title: "Continue",
          isLoading: state is PaymentLoading ? true : false,
        );
      },
    );
  }
}
