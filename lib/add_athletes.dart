import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fx3/model/athletes.dart';
import 'package:nanoid/async.dart';

import 'widgets/custom_textfield.dart';
import 'model/boxes.dart';

class AddAthletes extends StatefulWidget {
  const AddAthletes({super.key});

  @override
  State<AddAthletes> createState() => _AddAthletesState();
}

class _AddAthletesState extends State<AddAthletes> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController paymentDateController = TextEditingController();
  TextEditingController paidController = TextEditingController();
  TextEditingController coachController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: CustomTextField(
                  controller: nameController,
                  label: "name".tr(),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: CustomTextField(
                  controller: phoneController,
                  label: "phone".tr(),
                  isNumber: true,
                ),
              ),
            ],
          ),
          CustomTextField(
            controller: paymentDateController,
            label: "paymentDate".tr(),
            isDate: true,
          ),
          CustomTextField(
            controller: paidController,
            label: "paid".tr(),
            isPaid: true,
          ),
          CustomTextField(
            controller: coachController,
            label: "coach".tr(),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                addAthlete(
                    nameController.text,
                    phoneController.text,
                    DateTime.now(),
                    int.parse(paidController.text),
                    coachController.text);
                cleartextfields();
              }
            },
            style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width / 5,
                    MediaQuery.of(context).size.height / 10)),
            child: Text("add".tr()),
          )
        ],
      ),
    );
  }

  void cleartextfields() {
    nameController.clear();
    phoneController.clear();
    paymentDateController.clear();
    paidController.clear();
    coachController.clear();
  }
}

Future addAthlete(String name, String phone, DateTime paymentDate, int paid,
    String coach) async {
  late int id;
  await customAlphabet('1234567890', 6).then((value) => id = int.parse(value));

  final athlete = Athletes()
    ..id = id
    ..name = name
    ..paid = paid
    ..paymentDate = paymentDate
    ..phoneNumber = phone
    ..withCoach = coach;

  final box = Boxes.getAthletes();
  box.add(athlete);
}
