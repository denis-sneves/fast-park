import 'package:fast_park/pages/index/index_pages.dart/veiculos_model.dart';
import 'package:fast_park/themes/colors.dart';
import 'package:flutter/material.dart';

class VeiculosPage extends StatelessWidget {
  const VeiculosPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    ];

    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 20,
      ),
      child: ListView.builder(
          itemCount: listModels.length,
          itemBuilder: (context, index) {
            return Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(left: 15)),
                                  Text(
                                    listModels[index].title,
                                    style: const TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 7.0),
                                child: SizedBox(
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
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Padding(padding: EdgeInsets.only(left: 15)),
                              Text(
                                listModels[index].data,
                                style: const TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Padding(padding: EdgeInsets.only(left: 15)),
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
            );
          }),
    );
  }
}
