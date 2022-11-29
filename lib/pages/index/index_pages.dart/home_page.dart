import 'package:fast_park/themes/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: AppColors.primary,
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 20,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 80, left: 5, right: 5, top: 10),
                child: Stack(
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
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Padding(
                                          padding: EdgeInsets.only(left: 15)),
                                      Text(
                                        "VENCIMENTOS",
                                        style: TextStyle(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: const [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15)),
                                          Text(
                                            "HYUNDAI - YTR73",
                                            style: TextStyle(
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 7.0),
                                        child: Text(
                                          "Vencido",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 14),
                                        child: Text(
                                          "05/03/2022 - 22:00 - 23:00",
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                              side: const BorderSide(
                                                  width: 2,
                                                  color: AppColors.secondary),
                                            ),
                                            child: const Text(
                                              'OK',
                                              style: TextStyle(
                                                  color: AppColors.secondary,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onPressed: () {}),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Padding(
                                          padding: EdgeInsets.only(left: 15)),
                                      Text(
                                        "Valor : RS 55,00",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
