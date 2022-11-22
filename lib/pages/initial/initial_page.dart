import 'package:fast_park/pages/login/login_page.dart';
import 'package:flutter/material.dart';

import '../../themes/colors.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Center(child: Image.asset("assets/images/Ellipse8.png")),
          Center(child: Image.asset("assets/images/Ellipse7.png")),
          Center(
            child: Image.asset(
              "assets/images/fastpark.png",
              width: 250,
              height: 250,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50, left: 15, right: 15),
              child: SizedBox(
                width: 375,
                height: 50,
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: const Text(
                      'Fazer Login',
                      style: TextStyle(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
