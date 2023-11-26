import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/my_cart_view_body.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class MyCartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "My Cart"),
      body: MyCartViewBody(),
    );
  }


}
