// ignore: file_names
import 'package:fast_park/themes/colors.dart' show AppColors;
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmailTextField extends StatelessWidget {
  Icon icon;
  TextEditingController controller;
  EmailTextField({Key? key, required this.icon, required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Favor preencher todos os campos";
        } else if (!value.contains("@")) {
          return "E-mail inválido";
        } else if (value.length < 5) {
          return "Esse e-mail está curto demais";
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
        prefixIcon: icon,
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
