import 'package:flutter/material.dart';

import '../../../../../../core/utils/style.dart';

class OrderInfoItem extends StatelessWidget {
  OrderInfoItem({Key? key, required this.title, required this.value}) : super(key: key);
  final String title,value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.style18,
        ),
        Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
          style: Styles.style18,
        ),
      ],
    );
  }
}