import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/Features/checkout/data/models/amount_model.dart';
import 'package:payment/Features/checkout/data/models/item_list_model.dart';
import 'package:payment/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/Features/checkout/presentation/manager/payment_cubit.dart';
import 'package:payment/Features/checkout/presentation/views/thank_you/thanks_you_view.dart';
import 'package:payment/core/utils/api_keys.dart';

import 'custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key, required this.credit,
  });

final bool credit;

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
          onTap: () async {
            if (credit) {
              // Credit Payment Logic
              executeStripe(context);
            } else {
              // PayPal Payment Logic
              var transactionsData = getTransactionsData();
              executePaypalPayment(context, transactionsData);

            }
          },
          title: "Continue",
          isLoading: state is PaymentLoading ? true : false,
        );
      },
    );
  }

  void executeStripe(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel =
    PaymentIntentInputModel(
      amount: "100",
      currency: "USD",
      customerId: "cus_P4fF5pTS3liroi",
    );
    BlocProvider.of<PaymentCubit>(context)
        .makePayment(paymentIntentInputModel: paymentIntentInputModel);
  }

  void executePaypalPayment(BuildContext context, ({AmountModel amount, ItemListModel itemList}) transactionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientID,
        secretKey: ApiKeys.paypalSecretKey,
        transactions:  [
          {
            "amount": transactionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list":transactionsData.itemList.toJson()
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }
  ({AmountModel amount, ItemListModel itemList}) getTransactionsData(){
    AmountModel amountModel = AmountModel(
      total: "100",
      currency: "USD",
      details: DetailsModel(
          shipping: "0", shippingDiscount: 0, subtotal: "100"),
    );
    List<OrderItemModel> orders = [
      OrderItemModel(
        currency: "USD",
        name: "Apple",
        price: "4",
        quantity: 10,
      ),
      OrderItemModel(
        currency: "USD",
        name: "Apple",
        price: "5",
        quantity: 12,
      ),
    ];
    ItemListModel itemListModel = ItemListModel(
      orders: orders,
    );

    return (amount: amountModel , itemList : itemListModel);
  }
}
