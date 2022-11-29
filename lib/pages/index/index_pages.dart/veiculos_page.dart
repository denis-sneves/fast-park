import 'package:fast_park/pages/index/index_pages.dart/veiculos_model.dart';
import 'package:fast_park/themes/colors.dart';
import 'package:flutter/material.dart';

class VeiculosPage extends StatelessWidget {
  const VeiculosPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    int i = 0;

    List<VeiculosModel> listModels = [
      VeiculosModel(
          title: "HYUNDAI - YTR73",
          data: "05/03/2022 - 22:00 - 23:00",
          valor: "RS 55,00"),
      VeiculosModel(
          title: "HYUNDAI - YTR73",
          data: "05/03/2022 - 22:00 - 23:00",
          valor: "RS 55,00"),
      VeiculosModel(
          title: "HYUNDAI - YTR73",
          data: "05/03/2022 - 22:00 - 23:00",
          valor: "RS 55,00"),
      VeiculosModel(
          title: "HYUNDAI - YTR73",
          data: "05/03/2022 - 22:00 - 23:00",
          valor: "RS 55,00"),
    ];

    return Scaffold(
      body: Container(
        color: AppColors.primary,
        padding:
            const EdgeInsets.only(bottom: 80, left: 20, right: 20, top: 50),
        child: ListView.builder(
            itemCount: listModels.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      Padding(
                                          padding: EdgeInsets.only(left: 15)),
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
                                      "Faturado",
                                      style: TextStyle(
                                          color: AppColors.secondary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 14),
                                    child: Text(
                                      listModels[index].data,
                                      style: const TextStyle(
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
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(left: 15)),
                                  Text(
                                    "Valor : ${listModels[index].valor}",
                                    style: const TextStyle(
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
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: AppColors.secondary,
        child: const Icon(Icons.add_box_outlined),
      ),
    );
  }
}
