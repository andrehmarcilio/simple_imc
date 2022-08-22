class Pessoa {
  Pessoa({required this.altura, required this.peso, required this.nome});
  double peso;
  double altura;
  String nome;
  Imc get imc => Imc.fromPesoAltura(peso, altura);
}

class Imc {
  double valor;
  String condicao;

  Imc({required this.valor, required this.condicao});

  factory Imc.fromPesoAltura(double peso, double altura) {
    double valor = peso / (altura * altura);
    valor *= 100;
    valor = valor.roundToDouble();
    valor /=100;
      


    int pegarCondicao(double imc) {
      if (imc < 20) {
        return 0;
      } else if (imc >= 20 && imc < 25) {
        return 1;
      } else if (imc >= 25 && imc < 30) {
        return 2;
      } else if (imc >= 30 && imc < 40) {
        return 3;
      }
      return 4;
    }

    return Imc(valor: valor, condicao: condicaoText[pegarCondicao(valor)]);
  }
}

final List<String> condicaoText = [
  "Abaixo do peso",
  "Peso normal",
  "Sobre peso",
  "Obeso",
  "Obeso mórbido"
];
