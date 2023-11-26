import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/presentation/views/thanks_you_view.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/payment_methods_list_view.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'custom_credit_card.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(slivers: [
      const SliverToBoxAdapter(
        child: PaymentMethodListView(),
      ),
      SliverToBoxAdapter(
        child: CustomCreditCard(formKey: formKey,autovalidateMode: autovalidateMode),
      ),
      SliverFillRemaining(
       hasScrollBody: false,
       child: Align(
         alignment: Alignment.bottomCenter,
           child: Padding(
             padding: EdgeInsets.only(bottom: 12,left: 16,right: 16),
             child: CustomButton(
               onTap: (){
                 if(formKey.currentState!.validate())
                 {
                   formKey.currentState!.save();
                   log("payment");
                 }else{
                   autovalidateMode = AutovalidateMode.always;
                   setState(() {});
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ThankYouView()));
                 }
               },
                 title: "Pay"),
           )),
     ),

    ]);
  }
}
