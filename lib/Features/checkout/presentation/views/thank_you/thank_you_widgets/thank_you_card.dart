import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment/Features/checkout/presentation/views/payment/payment_widgets/payment_info_item.dart';
import 'package:payment/core/utils/style.dart';

import '../../card/card_widgets/total_price_widget.dart';
import 'card_info_widget.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: const Color(0xFFD9D9D9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50 ,left: 22,right: 22),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'Thank you!',
                textAlign: TextAlign.center,
                style: Styles.style25,
              ),
              Text(
                'Your transaction was successful',
                textAlign: TextAlign.center,
                style: Styles.style20,
              ),
              const SizedBox(height: 42,),
              const PaymentItemInfo(title: "Date",value:  '01/24/2023',),
              const SizedBox(height: 20,),
              const PaymentItemInfo(title: "Time",value: "10:15 AM",),
              const SizedBox(height: 20,),
              const PaymentItemInfo(title: "To",value: "Sam Louis",),
              const Divider(thickness: 2,height: 60,),
              const TotalPrice(title: "Total", value: r"50$"),
              // const SizedBox(height: 30,),
              const CardInfoWidget(),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(FontAwesomeIcons.barcode,size: 65,),
                  Container(
                    width: 113,
                    height: 58,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1.50, color: Color(0xFF34A853)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'PAID',
                        textAlign: TextAlign.center,
                        style: Styles.style24.copyWith(color: const Color(0xFF34A853),),
                      ),
                    ),
                  )
                ],
              ),

              // SizedBox(
              //   // height:( (MediaQuery.sizeOf(context).height * .1 + 20 ) / 2) - 29,
              //   height: MediaQuery.sizeOf(context).height * .2 ,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}



