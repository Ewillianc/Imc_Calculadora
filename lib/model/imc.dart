class Imc {
  double altura = 0.0;
  double peso = 0.0;

  double calcularIMC(_peso, _altura) {
    double imc = _peso / (_altura * _altura);
    return imc;
  }
}
