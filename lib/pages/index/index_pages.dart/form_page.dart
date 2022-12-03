import 'package:fast_park/global/car_textfield_widget.dart';
import 'package:fast_park/themes/colors.dart';
import 'package:flutter/material.dart';

class FormPageCar extends StatefulWidget {
  const FormPageCar({super.key});

  @override
  State<FormPageCar> createState() => _FormPageCarState();
}

class _FormPageCarState extends State<FormPageCar> {
  final TextEditingController _placaInputController = TextEditingController();
  final TextEditingController _modeloInputController = TextEditingController();
  final TextEditingController _corInputController = TextEditingController();
  final TextEditingController _tabelaInputController = TextEditingController();
  final TextEditingController _observacoesInputController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          elevation: 10,
          title: const Text(
            "Entrada de Veículos",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: AppColors.primary,
        ),
      ),
      body: Container(
          height: Size.infinite.height,
          color: AppColors.primary,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CarTextField(
                        controller: _placaInputController,
                        formWidth: size.width * 0.42,
                        label: "Placa",
                      ),
                      CarTextField(
                        controller: _placaInputController,
                        formWidth: size.width * 0.42,
                        label: "Placa",
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CarTextField(
                        controller: _modeloInputController,
                        formWidth: size.width * 0.42,
                        label: "Marca/Modelo",
                      ),
                      CarTextField(
                        controller: _corInputController,
                        formWidth: size.width * 0.42,
                        label: "Cor",
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CarTextField(
                        controller: _tabelaInputController,
                        formWidth: size.width * 0.92,
                        label: "Tabela",
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        const Text(
                          'Lavagem',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(width: 10),
                        Checkbox(
                          value: true,
                          onChanged: (bool? value) {
                            value = true;
                          },
                        ),
                        const Text(
                          'Cera',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(width: 15),
                        Checkbox(
                          value: true,
                          onChanged: (bool? value) {
                            value = false;
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CarTextField(
                        controller: _observacoesInputController,
                        formWidth: size.width * 0.92,
                        label: "Observações",
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: SizedBox(
                      width: 375,
                      height: 50,
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          child: const Text(
                            'Adicionar',
                            style: TextStyle(
                                color: AppColors.secondary,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {}),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
