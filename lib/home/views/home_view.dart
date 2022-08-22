import 'package:flutter/material.dart';
import 'package:nutricionistaapp/home/model/pessoal.dart';

import 'resultado_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  late List<TextEditingController> listController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    listController = [_nameController, _pesoController, _alturaController];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16,),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Nome',
                    labelText: 'Nome',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite algo';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 33.0,
                ),
                TextFormField(
                  controller: _pesoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Peso',
                    hintText: 'Em Kg',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite algo';
                    } else {
                      String valorFinal = value.replaceAll(",", ".");
                      final isDigitsOnly = double.tryParse(valorFinal);
                      return isDigitsOnly == null ? 'formato inválido!' : null;
                    }
                  },
                ),
                const SizedBox(
                  height: 33.0,
                ),
                TextFormField(
                  controller: _alturaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Altura',
                    hintText: 'Em metros Ex: 1.83',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite algo';
                    } else {
                      String valorFinal = value.replaceAll(",", ".");
          
                      final isDigitsOnly = double.tryParse(valorFinal);
                      return isDigitsOnly == null ? 'formato inválido!' : null;
                    }
                  },
                ),
                const SizedBox(
                  height: 33.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      for (var controller in listController) {
                        controller.text = "";
                      }
                    },
                    child: const Text(
                      'LIMPAR',
                      style: TextStyle(
                          color: Color.fromARGB(255, 187, 130, 255),
                          fontWeight: FontWeight.w600),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(55, 186, 130, 255),
                      side: const BorderSide(
                        width: 0.6,
                        color: Color.fromARGB(255, 187, 130, 255),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: irParaResultado,
                      child: const Text(
                        "CALCULAR IMC",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFC582FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ))),
                ) // <-- Radius
              ],
            ),
          ),
        ),
      ),
    );
  }

  irParaResultado() {
    if (_formKey.currentState!.validate()) {
      final pessoa = Pessoa(
          altura: double.parse(_alturaController.text.replaceAll(",", ".")),
          peso: double.parse(_pesoController.text.replaceAll(",", ".")),
          nome: _nameController.text);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultadoPage(
                    pessoa: pessoa,
                  )));
    }
  }
}
