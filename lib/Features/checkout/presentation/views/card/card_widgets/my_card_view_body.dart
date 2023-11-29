import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:payment/Features/checkout/presentation/manager/payment_cubit.dart';
import 'package:payment/Features/checkout/presentation/views/card/card_widgets/total_price_widget.dart';

import '../../../../../../core/widgets/custom_button.dart';
import '../../payment/payment_widgets/payment_method_bottom_sheet.dart';
import 'card_info_item.dart';

class MyCardViewBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 18),
          Expanded(child: Image.asset("assets/images/basket_image.png")),
          const SizedBox(height: 25),
          OrderInfoItem(title: "Order Subtotal",value: r"42.97$",),
          const SizedBox(height: 3),
          OrderInfoItem(title: "Discount",value: r"0$",),
          const SizedBox(height: 3),
          OrderInfoItem(title: "Shipping",value: r"8$",),
          const Divider(
            height: 34,
            thickness: 2,color: Color(0xffC7C7C7),),
          const TotalPrice(title: "Total",value: r"50.97$",),
          const SizedBox(height: 16),
          CustomButton(
            title: 'Complete Payment',
            onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context)
              // => PaymentDetailsView()));
              showModalBottomSheet(context: context, builder: (context){
                return  BlocProvider(
                  create: (context) => PaymentCubit(CheckoutRepoImpl()),
                  child: PaymentMethodsBottomSheet(),
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )
              );
            },
          ),
          const SizedBox(height: 12),

        ],
      ),
    );
  }
}





