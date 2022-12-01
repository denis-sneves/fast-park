import 'dart:ui';

import 'package:fast_park/pages/login/login_page.dart';
import 'package:fast_park/shared/models/user_model.dart';
import 'package:fast_park/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'index_pages.dart/home_page.dart';
import 'index_pages.dart/veiculos_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final box = GetStorage('app');
  User usuario = User();
  @override
  void initState() {
    super.initState();
    usuario = User.fromJson(box.read('auth'));
  }

  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          elevation: 10,
          title: Image.asset(
            "assets/images/fastpark_letreiro.png",
            width: 80,
            height: 80,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  usuario.displayName!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            )
          ],
          centerTitle: true,
          leading: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => SizedBox(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: AlertDialog(
                                    content: const Text(
                                      'Tem certeza que deseja sair?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            height: 40,
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                side: const BorderSide(
                                                    width: 2,
                                                    color: AppColors.secondary),
                                              ),
                                              child: const Text(
                                                'Cancelar',
                                                style: TextStyle(
                                                    color: AppColors.secondary,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              onPressed: () => Navigator.pop(
                                                  context, 'Cancel'),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 100,
                                            height: 40,
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                side: const BorderSide(
                                                    width: 2,
                                                    color: Colors.red),
                                              ),
                                              child: const Text(
                                                'Sim',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              onPressed: () {
                                                box.erase();
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            const LoginPage()),
                                                    ModalRoute.withName('/'));
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                            ));
                  }),
            ],
          ),
          backgroundColor: AppColors.primary,
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomePage(),
          VeiculosPage(),
          ConfiguracoesPage(),
          UsuarioPage(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(15),
        height: size.width * .155,
        decoration: BoxDecoration(
          color: AppColors.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 5,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: size.width * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(
                () {
                  currentIndex = index;
                },
              );
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(
                    bottom: index == currentIndex ? 0 : size.width * .029,
                    right: size.width * .0422,
                    left: size.width * .0422,
                  ),
                  width: size.width * .128,
                  height: index == currentIndex ? size.width * .014 : 0,
                  decoration: const BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
                Icon(
                  listOfIcons[index],
                  size: size.width * .076,
                  color: index == currentIndex
                      ? AppColors.secondary
                      : Colors.white,
                ),
                SizedBox(height: size.width * .02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.car_rental,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];
}

class ConfiguracoesPage extends StatelessWidget {
  const ConfiguracoesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Configuraçôes"));
  }
}

class UsuarioPage extends StatelessWidget {
  const UsuarioPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Usuário"));
  }
}
