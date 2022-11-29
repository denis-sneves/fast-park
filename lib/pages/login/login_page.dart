// ignore_for_file: use_build_context_synchronously

import 'package:fast_park/global/custom_password_widget.dart';
import 'package:fast_park/global/email_textfield_widget.dart';
import 'package:fast_park/pages/cadastro/cadastro_page.dart';
import 'package:fast_park/pages/index/index_page.dart';
import 'package:fast_park/pages/initial/initial_page.dart';
import 'package:fast_park/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../shared/models/user_model.dart';
import '../../shared/service/login_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  final box = GetStorage('app');
  AuthClient auth = AuthClient();
  User usuario = User();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InitialPage()));
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ),
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
                          child: CustomPasswordTextField(
                            controller: _passwordInputController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 15, right: 15),
                          child: _isLoading
                              ? SizedBox(
                                  width: 375,
                                  height: 50,
                                  child: TextButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(
                                            color: AppColors.secondary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          loginUser();
                                        });
                                      }),
                                )
                              : const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 5,
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 15, right: 15),
                          child: TextButton(
                            child: const Text(
                              "Esqueceu a Senha? Clique aqui",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, left: 15, right: 15),
                          child: SizedBox(
                            width: 375,
                            height: 50,
                            child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                                child: const Text(
                                  'Cadastre-se',
                                  style: TextStyle(
                                      color: AppColors.secondary,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CadastroPage()),
                                  );
                                }),
                          ),
                        ),
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

  void loginUser() async {
    if (_formKey.currentState!.validate()) {
      _isLoading = false;
      try {
        usuario = (await auth.login(
            _mailInputController.text, _passwordInputController.text));
        setState(() {
          if (usuario.registered == true) {
            box.write('auth', usuario.toJson());
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const IndexPage()),
                ModalRoute.withName('/'));
          } else {
            print("Usuário ou senha invalido");
            _isLoading = true;
          }
        });
      } on Exception catch (e) {
        print(e);
        setState(() {
          _isLoading = true;
        });
      }
    }
  }
}
