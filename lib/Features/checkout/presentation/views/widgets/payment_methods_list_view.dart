import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/payment_method_item.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({Key? key}) : super(key: key);

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  final List<String> paymentMethodsItems = const [
    "assets/images/card.svg",
    "assets/images/paypal.svg",
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
            onTap: (){
              activeIndex = index;
              setState(() {});
            },
            child: PaymentMethodItem(image: paymentMethodsItems[index],
                isActive:  activeIndex == index ),
          ),
        ),
        itemCount: paymentMethodsItems.length,
      ),
    );
  }
}