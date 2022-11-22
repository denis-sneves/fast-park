import 'package:flutter/material.dart';

import '../themes/colors.dart';

// ignore: must_be_immutable
class CustomPasswordTextField extends StatelessWidget {
  TextEditingController controller;
  CustomPasswordTextField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Favor preencher todos os campos";
        } else if (value.length < 5) {
          return "Esse campo precisa ter no mínimo 6 caracteres";
        }
        return null;
      },
      obscureText: true,
      controller: controller,
      style: const TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        alignLabelWithHint: true,
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
                color: Colors.white, style: BorderStyle.solid, width: 10)),
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
    );
  }
}
