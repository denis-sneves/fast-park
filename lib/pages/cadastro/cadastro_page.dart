import 'package:fast_park/global/custom_textfield_widget.dart';
import 'package:fast_park/global/email_textfield_widget.dart';
import 'package:fast_park/shared/service/cadastro_service.dart';
import 'package:fast_park/pages/login/login_page.dart';
import 'package:fast_park/themes/colors.dart';
import 'package:flutter/material.dart';

import '../../global/custom_password_widget.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/fastpark.png",
                    width: 200,
                    height: 200,
                  ),
                  Image.asset("assets/images/Line.png"),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, left: 15, right: 15),
                          child: EmailTextField(
                            icon: const Icon((Icons.email)),
                            controller: _mailInputController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 15, right: 15),
                          child: CustomTextField(
                            icon: const Icon((Icons.account_circle_rounded)),
                            controller: _nameInputController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 15, right: 15),
                          child: CustomPasswordTextField(
                            controller: _passwordInputController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 15, right: 15),
                          child: SizedBox(
                            width: 375,
                            height: 50,
                            child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                                child: const Text(
                                  'Cadastrar',
                                  style: TextStyle(
                                      color: AppColors.secondary,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  _doSignUp();
                                }),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 15, right: 15),
                          child: TextButton(
                            child: const Text(
                              "Já tem Cadastro? Fazer Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _doSignUp() {
    if (_formKey.currentState!.validate()) {
      CadastroService().signUp(_mailInputController.text,
          _passwordInputController.text, _nameInputController.text, context);
    } else {
      debugPrint("invalido");
    }
  }
}
