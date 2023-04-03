import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../model/athletes.dart';
import '../../model/boxes.dart';
import '../../screens/view_athletes_screen.dart';
import '../custom_textfield.dart';

Future<dynamic> editDetailsDialog(
    BuildContext context, Athletes athletes, index) {
  TextEditingController _nameController =
      TextEditingController(text: athletes.name);
  TextEditingController _phoneController =
      TextEditingController(text: athletes.phoneNumber);
  TextEditingController _dateController =
      TextEditingController(text: athletes.paymentDate.toString());
  TextEditingController _paidController =
      TextEditingController(text: athletes.paid.toString());
  TextEditingController _coachController =
      TextEditingController(text: athletes.withCoach);

  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("edit".tr()),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CardText(text: "name".tr()),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.96,
                      child: CustomTextField(
                          controller: _nameController, label: athletes.name),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CardText(text: "phone".tr()),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: CustomTextField(
                          controller: _phoneController,
                          label: athletes.phoneNumber),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CardText(text: "paymentDate".tr()),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.4,
                      child: CustomTextField(
                          controller: _dateController,
                          label:
                              "${athletes.paymentDate.day} / ${athletes.paymentDate.month} / ${athletes.paymentDate.year}"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CardText(text: "paid".tr()),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.9,
                      child: CustomTextField(
                          controller: _paidController,
                          label: athletes.paid.toString()),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CardText(text: "coach".tr()),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.35,
                      child: CustomTextField(
                          controller: _coachController,
                          label: athletes.withCoach),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black54,
                  side: const BorderSide(color: Colors.black26, width: 1.5),
                  fixedSize: Size(MediaQuery.of(context).size.width / 15,
                      MediaQuery.of(context).size.height / 20),
                ),
                child: Text("cancel".tr()),
              ),
              ElevatedButton(
                  onPressed: () {
                    final value = Athletes()
                      ..name = _nameController.text
                      ..id = athletes.id
                      ..phoneNumber = _phoneController.text
                      ..paid = int.parse(_paidController.text)
                      ..paymentDate = DateTime.parse(_dateController.text)
                      ..withCoach = _coachController.text;
                    final box = Boxes.getAthletes();
                    box
                        .putAt(index, value)
                        .then((value) => Navigator.pop(context));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.blue,
                        content: Row(
                          children: const [
                            Icon(Icons.info_outline_rounded,
                                color: Colors.white),
                            SizedBox(width: 10),
                            Text("Details Updated")
                          ],
                        )));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: Size(MediaQuery.of(context).size.width / 15,
                        MediaQuery.of(context).size.height / 20),
                  ),
                  child: Text("save".tr()))
            ],
          ));
}
