// ignore_for_file: unnecessary_const

import 'package:fast_park/global/car_textfield_widget.dart';
import 'package:fast_park/shared/models/user_model.dart';
import 'package:fast_park/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({
    Key? key,
  }) : super(key: key);

  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  final box = GetStorage('app');

  User usuario = User();

  @override
  void initState() {
    super.initState();
    usuario = User.fromJson(box.read('auth'));
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController _precoInputController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        Container(
                          height: 15,
                          decoration: const BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(7),
                              topRight: Radius.circular(7),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(top: 12),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Padding(padding: EdgeInsets.only(left: 15)),
                                    const CircleAvatar(
                                      maxRadius: 50,
                                      backgroundImage: NetworkImage(
                                        "https://uploads-ssl.webflow.com/621f6615a4c8a1d5166a4362/62615ca29b7d0a31079ac32e_smart%20parking.jpeg",
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15)),
                                          Text(
                                            usuario.displayName!,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CarTextField(
                              controller: _precoInputController,
                              formWidth: size.width * 0.42,
                              label: "Valor - Cera",
                            ),
                            CarTextField(
                              controller: _precoInputController,
                              formWidth: size.width * 0.42,
                              label: "Valor - Lavagem",
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CarTextField(
                              controller: _precoInputController,
                              formWidth: size.width * 0.42,
                              label: "Valor - Mensal",
                            ),
                            CarTextField(
                              controller: _precoInputController,
                              formWidth: size.width * 0.42,
                              label: "Valor - Horista",
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CarTextField(
                              controller: _precoInputController,
                              formWidth: size.width * 0.92,
                              label: "Capacidade",
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0, bottom: 25),
                          child: SizedBox(
                            width: 375,
                            height: 50,
                            child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                                child: const Text(
                                  'Atualizar',
                                  style: TextStyle(
                                      color: AppColors.secondary,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {}),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
