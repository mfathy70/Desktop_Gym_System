import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isNumber,
    this.isPaid,
    this.isDate,
  });

  final TextEditingController controller;
  final String label;
  final bool? isNumber;
  final bool? isPaid;
  final bool? isDate;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        validator: (value) {
          if (widget.isDate == true) {
            /*if (value == null || value.isEmpty) {
              return "invalidDate".tr();
            }*/
            return null;
          }

          if (widget.isPaid == true) {
            if (value == null || value.isEmpty) {
              return "invalidQuntity".tr();
            }
            return null;
          }

          if (widget.isNumber == true) {
            if (value == null || value.isEmpty || value.length > 11) {
              return "invalidPhone".tr();
            }
            return null;
          }

          if (value == null || value.isEmpty) {
            return "invalidName".tr();
          }
          return null;
        },
        controller: widget.controller,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        enabled: widget.isDate == true ? false : true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black.withOpacity(0.09),
          hintText: widget.label,
        ),
      ),
    );
  }
}
