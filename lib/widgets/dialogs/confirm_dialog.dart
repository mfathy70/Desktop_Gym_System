import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fx3/view_athletes_screen.dart';

import 'edit_details_dialog.dart';

Future<dynamic> confirmDialog(BuildContext context, int id, String name,
    String phone, String date, String paid, String coach) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("added".tr()),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CardText(text: "${"id".tr()}: $id"),
          CardText(text: "${"name".tr()}: $name"),
          CardText(text: "${"phone".tr()}: $phone"),
          CardText(
              text:
                  "${"paymentDate".tr()}: ${DateFormat.yMd("en-IN").format(DateTime.now())}"),
          CardText(text: "${"paid".tr()}: $paid"),
          CardText(text: "${"coach".tr()}: $coach")
        ],
      ),
      actions: const [
        CancelButton(text: "close"),
      ],
    ),
  );
}
