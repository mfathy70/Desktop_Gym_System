import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fx3/model/boxes.dart';

import '../../model/athletes.dart';
import '../../search_athletes.dart';
import 'edit_details_dialog.dart';

Future<dynamic> detailsDialog(BuildContext context, Athletes athlete, index) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(athlete.name),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CardText(text: "${"id".tr()}: ${athlete.id}"),
                CardText(text: "${"phone".tr()}: ${athlete.phoneNumber}"),
                CardText(
                    text:
                        "${"paymentDate".tr()}: ${athlete.paymentDate.day}/${athlete.paymentDate.month}/${athlete.paymentDate.year}"),
                CardText(text: "${"paid".tr()}: ${athlete.paid}"),
                CardText(text: "${"coach".tr()}: ${athlete.withCoach}"),
              ],
            ),
            actions: [
              OutlinedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  editDetailsDialog(context, athlete, index);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue[900],
                  side: const BorderSide(color: Colors.black26, width: 1.5),
                  fixedSize: Size(MediaQuery.of(context).size.width / 15,
                      MediaQuery.of(context).size.height / 20),
                ),
                child: Text("edit".tr()),
              ),
              ElevatedButton(
                  onPressed: () {
                    final box = Boxes.getAthletes();
                    box.deleteAt(index).then((value) => Navigator.pop(context));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.blue,
                        content: Row(
                          children: const [
                            Icon(Icons.info_outline_rounded,
                                color: Colors.white),
                            SizedBox(width: 10),
                            Text("Athlete Deleted")
                          ],
                        )));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: Size(MediaQuery.of(context).size.width / 15,
                        MediaQuery.of(context).size.height / 20),
                  ),
                  child: Text("delete".tr()))
            ],
          ));
}
