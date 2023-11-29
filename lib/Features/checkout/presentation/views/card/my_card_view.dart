import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import 'card_widgets/my_card_view_body.dart';

class MyCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "My Cart"),
      body: MyCardViewBody(),
    );
  }


}
