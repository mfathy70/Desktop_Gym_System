import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../screens/view_athletes_screen.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 60, child: CardText(text: "id".tr())),
              SizedBox(width: 150, child: CardText(text: "name".tr())),
              SizedBox(width: 120, child: CardText(text: "phone".tr())),
              SizedBox(width: 120, child: CardText(text: "paymentDate".tr())),
              SizedBox(width: 120, child: CardText(text: "paid".tr())),
              SizedBox(width: 100, child: CardText(text: "coach".tr())),
            ],
          ),
        ),
      ),
    );
  }
}
