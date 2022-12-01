// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:fast_park/themes/colors.dart' show AppColors;
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarTextField extends StatelessWidget {
  double? formWidth;
  String? label;
  TextEditingController controller;
  CarTextField(
      {Key? key,
      required this.controller,
      required this.formWidth,
      required this.label})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Column(
        children: [
          Text(
            label!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 15,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            width: formWidth,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Favor preencher todos os campos";
                }
                return null;
              },
              controller: controller,
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 10)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                      color: Colors.white, style: BorderStyle.solid, width: 10),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary)),
                labelStyle: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
