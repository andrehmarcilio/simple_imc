import 'package:flutter/material.dart';

import '../model/pessoal.dart';

class ResultadoPage extends StatefulWidget {
  const ResultadoPage({
    Key? key,
    required this.pessoa,
  }) : super(key: key);
  final Pessoa pessoa;

  @override
  State<ResultadoPage> createState() => _ResultadoPageState();
}

class _ResultadoPageState extends State<ResultadoPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _imcController = TextEditingController();
  final TextEditingController _condicaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.pessoa.nome;
    _pesoController.text = widget.pessoa.peso.toString();
    _alturaController.text = widget.pessoa.altura.toString();
    _imcController.text = widget.pessoa.imc.valor.toString();
    _condicaoController.text = widget.pessoa.imc.condicao;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Nutri App"),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
               const SizedBox(
                height: 16.0,
              ),
              TextField(
                style: const TextStyle(color: Color(0xff736F6F)),
                controller: _nameController,
                enabled: false,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                ),
              ),
              const SizedBox(
                height: 33.0,
              ),
              TextField(
                style: const TextStyle(color: Color(0xff736F6F)),
                controller: _pesoController,
                enabled: false,
                decoration: const InputDecoration(
                  labelText: 'Peso',
                ),
              ),
              const SizedBox(
                height: 33.0,
              ),
              TextField(
                style: const TextStyle(color: Color(0xff736F6F)),
                controller: _alturaController,
                enabled: false,
                decoration: const InputDecoration(
                  labelText: 'Altura',
                ),
              ),
              const SizedBox(
                height: 33.0,
              ),
              TextField(
                style: const TextStyle(color: Color(0xffDB7CEA)),
                controller: _imcController,
                enabled: false,
                decoration: const InputDecoration(
                  labelText: 'IMC',
                ),
              ),
              const SizedBox(
                height: 33.0,
              ),
              TextField(
                style: const TextStyle(color: Color(0xffDB7CEA)),
                controller: _condicaoController,
                enabled: false,
                decoration: const InputDecoration(
                  labelText: 'Situação',
                ),
              ),
              const SizedBox(
                height: 33.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
