import 'package:flutter_test/flutter_test.dart';
import 'package:nutricionistaapp/home/model/pessoal.dart';

void main() {
  final pessoa = Pessoa(altura: 1.80, peso: 80, nome: 'Marcos'); 
  test('deve retornar imc 24.69', () {
    expect(pessoa.imc.valor, 24.69);
  });
}